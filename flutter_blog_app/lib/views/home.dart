import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blog_app/services/crud.dart';
import 'package:flutter_blog_app/views/create_blog.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  CrudMethods crudMethods = new CrudMethods();
  QuerySnapshot blogSnapShot;

  Widget BlogsList() {
    return Container(
      child: blogSnapShot != null
          ? ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              itemBuilder: (context, index) {
                return BlogTile(
                  imgUrl: blogSnapShot.documents[index].data['imageUrl'],
                  title: blogSnapShot.documents[index].data['title'],
                  authorName: blogSnapShot.documents[index].data['authorName'],
                  desc: blogSnapShot.documents[index].data['desc'],
                );
              },
              itemCount: blogSnapShot.documents.length,
            )
          : Container(
              alignment: Alignment.center,
              child: CircularProgressIndicator(),
            ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    crudMethods.getData().then((result) {
      setState(() {
        blogSnapShot = result;
      });
    });
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
      ),
      body: BlogsList(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CreateBlog(),
            ),
          );
        },
      ),
    );
  }
}

class BlogTile extends StatelessWidget {
  final String imgUrl, title, authorName, desc;
  BlogTile(
      {@required this.imgUrl,
      @required this.title,
      @required this.authorName,
      @required this.desc});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      margin: EdgeInsets.only(bottom: 16.0),
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: Image.network(
              imgUrl,
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width,
            ),
          ),
          Container(
            height: 150.0,
            decoration: BoxDecoration(
              color: Colors.black45.withOpacity(0.4),
              borderRadius: BorderRadius.circular(6),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  title,
                  style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w800),
                ),
                Text(
                  authorName,
                  style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.w600),
                ),
                Text(desc),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
