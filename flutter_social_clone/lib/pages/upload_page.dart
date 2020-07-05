import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_social_clone/models/user.dart';
import 'package:flutter_social_clone/pages/home_page.dart';
import 'package:flutter_social_clone/widgets/progress_widget.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image/image.dart' as ImD;
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';

class UploadPage extends StatefulWidget {
  final User gCurrentUser;

  const UploadPage({Key key, this.gCurrentUser}) : super(key: key);
  @override
  _UploadPageState createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage>
    with AutomaticKeepAliveClientMixin<UploadPage> {
  final picker = ImagePicker();
  File selectedImage;
  bool uploading = false;
  String postId = Uuid().v4();
  TextEditingController descriptionTextEditingController =
      TextEditingController();
  TextEditingController locationTextEditingController = TextEditingController();

  Future pickImageFromGallery() async {
    Navigator.pop(context);
    var pickedFile = await picker.getImage(source: ImageSource.gallery);
    setState(
      () {
        selectedImage = File(pickedFile.path);
      },
    );
  }

  Future captureImageWithCamera() async {
    Navigator.pop(context);
    var pickedFile = await picker.getImage(
      source: ImageSource.camera,
      maxWidth: 970.0,
      maxHeight: 680.0,
    );
    setState(
      () {
        selectedImage = File(pickedFile.path);
      },
    );
  }

  takeImage(mContext) {
    return showDialog(
        context: mContext,
        builder: (context) {
          return SimpleDialog(
            title: Text(
              'New Post',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            children: <Widget>[
              SimpleDialogOption(
                child: Text(
                  'Capture Image With Camera',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: captureImageWithCamera,
              ),
              SimpleDialogOption(
                child: Text(
                  'Pick Image From Gallery',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: pickImageFromGallery,
              ),
              SimpleDialogOption(
                child: Text(
                  'Cancel',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          );
        });
  }

  displayUploadScreen() {
    return Container(
      color: Theme.of(context).accentColor.withOpacity(0.5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            Icons.add_photo_alternate,
            color: Colors.grey,
            size: 200,
          ),
          Padding(
            padding: EdgeInsets.all(20.0),
            child: RaisedButton(
              child: Text(
                'Upload Image',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              color: Colors.green,
              onPressed: () => takeImage(context),
            ),
          ),
        ],
      ),
    );
  }

  clearPostInfo() {
    locationTextEditingController.clear();
    descriptionTextEditingController.clear();
    setState(() {
      selectedImage = null;
    });
  }

  getUserCurrentLocation() async {
    Position position = await Geolocator()
        .getLastKnownPosition(desiredAccuracy: LocationAccuracy.high);
    List<Placemark> placeMarks = await Geolocator()
        .placemarkFromCoordinates(position.latitude, position.longitude);
    Placemark mPlacemark = placeMarks[0];
    String completeAddressInfo =
        '${mPlacemark.subThoroughfare} ${mPlacemark.thoroughfare}, ${mPlacemark.subLocality} ${mPlacemark.locality}, ${mPlacemark.subAdministrativeArea} ${mPlacemark.administrativeArea}, ${mPlacemark.postalCode} ${mPlacemark.country}';
    String specificAddress = '${mPlacemark.locality}, ${mPlacemark.country}';
    locationTextEditingController.text = specificAddress;
  }

  compressingPhoto() async {
    final tDirectory = await getTemporaryDirectory();
    final path = tDirectory.path;
    ImD.Image mImageFile = ImD.decodeImage(selectedImage.readAsBytesSync());
    final compressedImageFile = File('$path/img_$postId.jpg')
      ..writeAsBytesSync(ImD.encodeJpg(mImageFile, quality: 90));
    setState(() {
      selectedImage = compressedImageFile;
    });
  }

  controlUploadAndSave() async {
    setState(() {
      uploading = true;
    });

    await compressingPhoto();
    String downloadUrl = await uploadPhoto(selectedImage);

    savePostInfoToFirestore(
      photoUrl: downloadUrl,
      location: locationTextEditingController.text,
      description: descriptionTextEditingController.text,
    );

    locationTextEditingController.clear();
    descriptionTextEditingController.clear();

    setState(
      () {
        selectedImage = null;
        uploading = false;
        postId = Uuid().v4();
      },
    );
  }

  savePostInfoToFirestore(
      {String photoUrl, String location, String description}) {
    postsReference
        .document(widget.gCurrentUser.id)
        .collection('usersPosts')
        .document(postId)
        .setData(
      {
        'postId': postId,
        'ownerId': widget.gCurrentUser.id,
        'timestamp': timestamp,
        'likes': {},
        'username': widget.gCurrentUser.username,
        'description': description,
        'location': location,
        'url': photoUrl,
      },
    );
  }

  Future<String> uploadPhoto(mImage) async {
    StorageUploadTask mStorageUploadTask =
        storageReference.child('post_$postId.jpg').putFile(mImage);
    StorageTaskSnapshot storageTaskSnapshot =
        await mStorageUploadTask.onComplete;
    String downloadUrl = await storageTaskSnapshot.ref.getDownloadURL();
    return downloadUrl;
  }

  displayUploadFormScreen() {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: clearPostInfo,
        ),
        title: Text(
          'New Post',
          style: TextStyle(color: Colors.white),
        ),
        actions: <Widget>[
          FlatButton(
            onPressed: () => uploading ? null : controlUploadAndSave(),
            child: Text(
              'Share',
              style: TextStyle(
                color: Colors.lightGreenAccent,
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
          ),
        ],
      ),
      body: ListView(
        children: <Widget>[
          uploading ? linearProgress() : Text(""),
          Container(
            width: MediaQuery.of(context).size.width * 0.8,
            child: Center(
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: Container(
                  child: Image.file(
                    selectedImage,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 12.0),
          ListTile(
            leading: Icon(
              Icons.text_fields,
              color: Colors.white,
              size: 36.0,
            ),
            title: Container(
              width: 250,
              child: TextField(
                style: TextStyle(color: Colors.white),
                controller: descriptionTextEditingController,
                decoration: InputDecoration(
                  hintText: 'Say something about image',
                  hintStyle: TextStyle(
                    color: Colors.white,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          Divider(),
          ListTile(
            leading: Icon(
              Icons.person_pin,
              color: Colors.white,
              size: 36.0,
            ),
            title: Container(
              width: 250,
              child: TextField(
                style: TextStyle(color: Colors.white),
                controller: locationTextEditingController,
                decoration: InputDecoration(
                  hintText: 'Write your location',
                  hintStyle: TextStyle(
                    color: Colors.white,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          Container(
            width: 220.0,
            height: 110.0,
            alignment: Alignment.center,
            child: RaisedButton.icon(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              color: Colors.green,
              onPressed: getUserCurrentLocation,
              icon: Icon(
                Icons.my_location,
                color: Colors.white,
              ),
              label: Text(
                'Get my current location',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return selectedImage == null
        ? displayUploadScreen()
        : displayUploadFormScreen();
  }
}
