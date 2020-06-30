import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blog_app/services/crud.dart';
import 'package:image_picker/image_picker.dart';
import 'package:random_string/random_string.dart';

class CreateBlog extends StatefulWidget {
  @override
  _CreateBlogState createState() => _CreateBlogState();
}

class _CreateBlogState extends State<CreateBlog> {
  String authorName, title, desc;
  final picker = ImagePicker();
  File selectedImage;
  bool _loading = false;

  CrudMethods crudMethods = CrudMethods();

  Future getImage() async {
    var pickedFile = await picker.getImage(source: ImageSource.gallery);
    setState(
      () {
        selectedImage = File(pickedFile.path);
      },
    );
  }

  uploadBlog() async {
    if (selectedImage != null) {
      setState(() {
        _loading = true;
      });
      StorageReference firebaseStorageRef = FirebaseStorage.instance
          .ref()
          .child('blogImages')
          .child("${randomAlphaNumeric(9)}.jpg");
      final StorageUploadTask task = firebaseStorageRef.putFile(selectedImage);
      var downloadUrl = await (await task.onComplete).ref.getDownloadURL();

      Map<String, String> blogMap = {
        "imageUrl": downloadUrl,
        "authorName": authorName,
        "title": title,
        "desc": desc,
      };

      crudMethods.addData(blogMap).then(
            (result) => Navigator.pop(context),
          );
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Flutter',
              style: TextStyle(
                fontSize: 22.0,
                color: Colors.white,
              ),
            ),
            Text(
              'Blog',
              style: TextStyle(
                fontSize: 22.0,
                color: Colors.blue,
              ),
            )
          ],
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        actions: <Widget>[
          GestureDetector(
            onTap: () {
              uploadBlog();
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Icon(Icons.file_upload),
            ),
          ),
        ],
      ),
      body: _loading
          ? Container(
              alignment: Alignment.center,
              child: CircularProgressIndicator(),
            )
          : ListView(
              children: <Widget>[
                Container(
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 10.0),
                      GestureDetector(
                        onTap: () {
                          getImage();
                        },
                        child: selectedImage != null
                            ? Container(
                                margin: EdgeInsets.symmetric(horizontal: 16.0),
                                height: 150.0,
                                width: MediaQuery.of(context).size.width,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(6.0),
                                  child: Image.file(
                                    selectedImage,
                                    width: MediaQuery.of(context).size.width,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              )
                            : Container(
                                margin: EdgeInsets.symmetric(horizontal: 16.0),
                                height: 150.0,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(6.0),
                                ),
                                child: Icon(
                                  Icons.add_a_photo,
                                  color: Colors.black45,
                                ),
                              ),
                      ),
                      SizedBox(height: 10.0),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 16.0),
                        child: Column(
                          children: <Widget>[
                            TextField(
                              decoration:
                                  InputDecoration(hintText: 'Author Name'),
                              onChanged: (value) {
                                authorName = value;
                              },
                            ),
                            TextField(
                              decoration: InputDecoration(hintText: 'Title'),
                              onChanged: (value) {
                                title = value;
                              },
                            ),
                            TextField(
                              decoration:
                                  InputDecoration(hintText: 'Description'),
                              onChanged: (value) {
                                desc = value;
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
