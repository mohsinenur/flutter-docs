import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iwalletapp/widgets/header_appbar.dart';

class MyProfileScreen extends StatefulWidget {
  @override
  _MyProfileScreenState createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              HeaderAppbarWidget(headerName: 'My Profile'),
              Container(
                height: 640.0,
                transform: Matrix4.translationValues(0.0, -20.0, 0.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(
                        left: 20.0,
                        right: 20.0,
                        top: 30.0,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            width: MediaQuery.of(context).size.width,
                            child: Column(
                              children: <Widget>[
                                Hero(
                                  tag: 'my_profile',
                                  child: CircleAvatar(
                                    radius: 40.0,
                                    backgroundImage: NetworkImage(
                                        'https://i.imgur.com/Vd79XwN.jpg'),
                                  ),
                                ),
                                SizedBox(height: 15.0),
                                Text(
                                  'Nur Mohsin',
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                                SizedBox(height: 20.0),
                                Container(
                                  padding: EdgeInsets.all(10.0),
                                  decoration: BoxDecoration(
                                    color: Color(0xfff1f7ff),
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      Column(
                                        children: <Widget>[
                                          Text(
                                            'EARNED MONEY ৳2,500.00',
                                            style: TextStyle(
                                              fontSize: 14.0,
                                              color: Color(0xff0068ff),
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 20.0),
                                Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Divider(
                                        color: Colors.grey,
                                      ),
                                      SizedBox(height: 20.0),
                                      Text(
                                        'ADDRESS',
                                        style: TextStyle(
                                          color: Color(0xFF989BA7),
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      SizedBox(height: 5.0),
                                      Text(
                                        '44, Road 8, Block D, Mirpur 2, Dhaka',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w800,
                                        ),
                                      ),
                                      SizedBox(height: 20.0),
                                      Divider(
                                        color: Colors.grey,
                                      ),
                                      SizedBox(height: 20.0),
                                      Text(
                                        'PHONE NUMBER',
                                        style: TextStyle(
                                          color: Color(0xFF989BA7),
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      SizedBox(height: 5.0),
                                      Text(
                                        '+8801716690867',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w800,
                                        ),
                                      ),
                                      SizedBox(height: 20.0),
                                      Divider(
                                        color: Colors.grey,
                                      ),
                                      SizedBox(height: 20.0),
                                      Text(
                                        'DATE OF BIRTH',
                                        style: TextStyle(
                                          color: Color(0xFF989BA7),
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      SizedBox(height: 5.0),
                                      Text(
                                        '26 March, 1993',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w800,
                                        ),
                                      ),
                                      SizedBox(height: 20.0),
                                      Divider(
                                        color: Colors.grey,
                                      ),
                                      SizedBox(height: 20.0),
                                      Text(
                                        'EMAIL',
                                        style: TextStyle(
                                          color: Color(0xFF989BA7),
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      SizedBox(height: 5.0),
                                      Text(
                                        'mohsin@gmail.com',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w800,
                                        ),
                                      ),
                                      SizedBox(height: 20.0),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
