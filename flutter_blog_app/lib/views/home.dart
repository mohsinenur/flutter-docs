import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blog_app/services/crud.dart';
import 'package:flutter_blog_app/views/create_blog.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  CrudMethods crudMethods = new CrudMethods();
  Stream blogStream;

  Widget BlogsList() {
    return Container(
      child: blogStream != null
          ? StreamBuilder(
              stream: blogStream,
              builder: (context, snapshot) {
                if (snapshot.data == null)
                  return Container(
                    alignment: Alignment.center,
                    child: CircularProgressIndicator(),
                  );

                return ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        _showBlogsModal(
                          snapshot.data.documents[index].data['title'],
                          snapshot.data.documents[index].data['authorName'],
                          snapshot.data.documents[index].data['desc'],
                          snapshot.data.documents[index].data['imageUrl'],
                        );
                      },
                      child: BlogTile(
                        imgUrl: snapshot.data.documents[index].data['imageUrl'],
                        title: snapshot.data.documents[index].data['title'],
                        authorName:
                            snapshot.data.documents[index].data['authorName'],
                        desc: snapshot.data.documents[index].data['desc'],
                      ),
                    );
                  },
                  itemCount: snapshot.data.documents.length,
                );
              },
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
        blogStream = result;
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
              'Instant',
              style: TextStyle(
                fontSize: 22.0,
                color: Colors.white,
              ),
            ),
            Text(
              'Ly',
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

  void _showBlogsModal(
      String title, String authorName, String desc, String imageUrl) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.black26,
      builder: (BuildContext buildContext) {
        return Container(
          height: MediaQuery.of(context).copyWith().size.height * 0.93,
          decoration: new BoxDecoration(
            color: Colors.white,
            borderRadius: new BorderRadius.only(
              topLeft: const Radius.circular(15.0),
              topRight: const Radius.circular(15.0),
            ),
          ),
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(150, 10, 150, 10),
                child: Container(
                  height: 8.0,
                  width: 80.0,
                  decoration: BoxDecoration(
                    color: Colors.grey[500],
                    borderRadius: BorderRadius.all(
                      Radius.circular(8.0),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: ListView(
                  children: <Widget>[
                    Stack(
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(30.0),
                              bottomRight: Radius.circular(30.0),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black26,
                                offset: Offset(0.0, 2.0),
                                blurRadius: 6.0,
                              )
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(30.0),
                              bottomRight: Radius.circular(30.0),
                            ),
                            child: CachedNetworkImage(
                              width: MediaQuery.of(context).size.width,
                              imageUrl: imageUrl,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              title,
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 35.0,
                                letterSpacing: 1.2,
                              ),
                            ),
                            Row(
                              children: <Widget>[
                                Icon(
                                  Icons.alternate_email,
                                  color: Colors.grey,
                                  size: 15.0,
                                ),
                                SizedBox(
                                  width: 5.0,
                                ),
                                Text(
                                  authorName,
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 20.0,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              desc,
                              style: TextStyle(
                                  fontSize: 17.0, color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
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
            child: CachedNetworkImage(
              imageUrl: imgUrl,
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width,
            ),
          ),
          Positioned(
            left: 16,
            bottom: 16.0,
            child: Container(
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ]),
              child: Text(
                title,
                style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
              ),
            ),
          )
        ],
      ),
    );
  }
}
