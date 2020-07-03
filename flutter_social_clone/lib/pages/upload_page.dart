import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UploadPage extends StatefulWidget {
  @override
  _UploadPageState createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> {
  PickedFile _imageFile;
  dynamic _pickImageError;

  final ImagePicker _picker = ImagePicker();

  captureImageWithCamera() async {
    Navigator.pop(context);

    try {
      PickedFile pickedFile = await _picker.getImage(
        source: ImageSource.camera,
        maxWidth: 970.0,
        maxHeight: 680.0,
      );
      setState(() {
        this._imageFile = pickedFile;
      });
    } catch (e) {
      setState(() {
        this._pickImageError = e;
      });
    }
  }

  pickImageFromGallery() async {
    Navigator.pop(context);

    try {
      PickedFile pickedFile = await _picker.getImage(
        source: ImageSource.gallery,
      );
      setState(() {
        this._imageFile = pickedFile;
      });
    } catch (e) {
      setState(() {
        this._pickImageError = e;
      });
    }
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

  @override
  Widget build(BuildContext context) {
    return displayUploadScreen();
  }
}
