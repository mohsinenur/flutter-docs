import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iwalletapp/screens/login_screen.dart';
import 'package:iwalletapp/screens/my_profile_screen.dart';
import 'package:iwalletapp/screens/premium_collection_screen.dart';
import 'package:iwalletapp/screens/transaction_history_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(
                      left: 20.0,
                      right: 20.0,
                      top: 40.0,
                    ),
                    height: 120.0,
                    color: Colors.black,
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            InkWell(
                              child: Row(
                                children: <Widget>[
                                  Image(
                                    height: 35.0,
                                    image: AssetImage(
                                      'assets/images/logo.png',
                                    ),
                                  ),
                                  SizedBox(width: 10.0),
                                  Text(
                                    'i-insurance',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => LoginScreen(),
                                  ),
                                );
                              },
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => MyProfileScreen(),
                                  ),
                                );
                              },
                              child: Hero(
                                tag: 'my_profile',
                                child: CircleAvatar(
                                  radius: 21.0,
                                  backgroundColor: Color(0xFFFADB39),
                                  child: CircleAvatar(
                                    radius: 19.0,
                                    backgroundColor: Colors.black,
                                    child: CircleAvatar(
                                      radius: 17.0,
                                      backgroundImage: NetworkImage(
                                          'https://i.imgur.com/Vd79XwN.jpg'),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
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
                    Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 20.0),
                          child: Column(
                            children: <Widget>[
                              Text(
                                'WALLET BALANCE',
                                style: TextStyle(
                                    color: Colors.grey, fontSize: 15.0),
                              ),
                              SizedBox(height: 10.0),
                              Text(
                                '৳15,000.00',
                                style: TextStyle(
                                    fontSize: 40.0,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Container(
                                padding: EdgeInsets.all(10.0),
                                decoration: BoxDecoration(
                                  color: Color(0xfff1f7ff),
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                child: Text(
                                  'EARNED MONEY ৳2,500.00',
                                  style: TextStyle(
                                    fontSize: 15.0,
                                    color: Color(0xff0068ff),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          color: Color(0xffeaeaec),
                          height: 40.0,
                        ),
                        Stack(
                          children: <Widget>[
                            Container(
                              height: 180,
                              width: double.infinity,
                              margin:
                                  EdgeInsets.fromLTRB(20.0, 30.0, 20.0, 10.0),
                              decoration: BoxDecoration(
                                color: Color(0xff0068ff),
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(
                                    100.0, 30.0, 20.0, 20.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      'Premium Collection',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20.0,
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(height: 10.0),
                                    Text(
                                      '18 COLLECTED TODAY',
                                      style: TextStyle(
                                        fontSize: 13,
                                        color: Color(0xff99c3ff),
                                      ),
                                    ),
                                    SizedBox(height: 30.0),
                                    InkWell(
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 5.0, horizontal: 10.0),
                                        decoration: BoxDecoration(
                                          color: Color(0xff267fff),
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Text(
                                              'COLLECT NOW',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 14.0,
                                                fontWeight: FontWeight.bold,
                                                letterSpacing: 1.5,
                                              ),
                                            ),
                                            Icon(
                                              FontAwesomeIcons
                                                  .longArrowAltRight,
                                              size: 30.0,
                                              color: Colors.white,
                                            ),
                                          ],
                                        ),
                                      ),
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (_) =>
                                                PremiumCollectionScreen(),
                                          ),
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              left: 20.0,
                              bottom: 40.0,
                              child: Image(
                                width: 100.0,
                                image: AssetImage(
                                    'assets/images/premium_collection.png'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ],
                        ),
                        Stack(
                          children: <Widget>[
                            Container(
                              height: 180,
                              width: double.infinity,
                              margin:
                                  EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                              decoration: BoxDecoration(
                                color: Color(0xfffadb39),
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(
                                    100.0, 30.0, 20.0, 20.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      'Transaction History',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20.0,
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(height: 10.0),
                                    Text(
                                      'SEE DAILY BASIS TRANSACTION',
                                      style: TextStyle(
                                        fontSize: 13,
                                        color: Color(0xff6d5c0f),
                                      ),
                                    ),
                                    SizedBox(height: 30.0),
                                    InkWell(
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 5.0, horizontal: 10.0),
                                        decoration: BoxDecoration(
                                          color: Color(0xffe5b209),
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Text(
                                              'VIEW ALL',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 14.0,
                                                fontWeight: FontWeight.bold,
                                                letterSpacing: 1.5,
                                              ),
                                            ),
                                            Icon(
                                              FontAwesomeIcons
                                                  .longArrowAltRight,
                                              size: 30.0,
                                              color: Colors.white,
                                            ),
                                          ],
                                        ),
                                      ),
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (_) =>
                                                TransactionHistoryScreen(),
                                          ),
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              left: 20.0,
                              bottom: 40.0,
                              child: Image(
                                width: 100.0,
                                image: AssetImage(
                                    'assets/images/transaction_history.png'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ],
                        ),
                      ],
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
