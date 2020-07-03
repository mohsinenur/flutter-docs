import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String id;
  final String profileName;
  final String username;
  final String url;
  final String email;
  final String bio;

  User({
    this.id,
    this.profileName,
    this.username,
    this.url,
    this.email,
    this.bio,
  });

  factory User.formDocument(DocumentSnapshot doc) {
    return User(
      id: doc.documentID,
      username: doc['username'],
      profileName: doc['profileName'],
      email: doc['email'],
      bio: doc['bio'],
      url: doc['url'],
    );
  }
}
