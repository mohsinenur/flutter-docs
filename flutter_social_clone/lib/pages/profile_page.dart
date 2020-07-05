import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_social_clone/models/user.dart';
import 'package:flutter_social_clone/pages/edit_profile_page.dart';
import 'package:flutter_social_clone/pages/home_page.dart';
import 'package:flutter_social_clone/widgets/header_widget.dart';
import 'package:flutter_social_clone/widgets/progress_widget.dart';

class ProfilePage extends StatefulWidget {
  final User userProfileId;

  const ProfilePage({Key key, this.userProfileId}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final String currentOnLineUserId = currentUser?.id;

  createProfileTopView() {
    return FutureBuilder(
      future: usersReference.document(widget.userProfileId.id).get(),
      builder: (context, dataSnapshot) {
        if (!dataSnapshot.hasData) {
          return circularProgress();
        }

        User user = User.formDocument(dataSnapshot.data);

        return Padding(
          padding: EdgeInsets.all(17.0),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  CircleAvatar(
                    radius: 45.0,
                    backgroundColor: Colors.grey,
                    backgroundImage: CachedNetworkImageProvider(user.url),
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            createColumn('posts', 0),
                            createColumn('followers', 0),
                            createColumn('following', 0),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            createButton(),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(top: 13.0),
                child: Text(
                  '@' + user.username,
                  style: TextStyle(fontSize: 14.0, color: Colors.white),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(top: 3.0),
                child: Text(
                  user.profileName,
                  style: TextStyle(fontSize: 19.0, color: Colors.white),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(top: 3.0),
                child: Text(
                  user.bio,
                  style: TextStyle(fontSize: 18.0, color: Colors.white70),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Column createColumn(String title, int count) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          count.toString(),
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 5.0),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w400,
              color: Colors.grey,
            ),
          ),
        ),
      ],
    );
  }

  createButton() {
    bool ownProfile = currentOnLineUserId == widget.userProfileId.id;
    if (ownProfile) {
      return createButtonTitleAndFunction(
        title: 'Edit Profile',
        performFunction: editUserProfile,
      );
    }
  }

  Container createButtonTitleAndFunction({
    String title,
    Function performFunction,
  }) {
    return Container(
      padding: EdgeInsets.only(top: 3.0),
      child: FlatButton(
        onPressed: performFunction,
        child: Container(
          width: 200,
          height: 26.0,
          child: Text(
            title,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.grey,
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(6.0),
          ),
        ),
      ),
    );
  }

  editUserProfile() {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) =>
              EditProfilePage(currentOnLineUserId: currentOnLineUserId)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: header(context, strTitle: "Profile"),
      body: ListView(
        children: <Widget>[
          createProfileTopView(),
        ],
      ),
    );
  }
}
