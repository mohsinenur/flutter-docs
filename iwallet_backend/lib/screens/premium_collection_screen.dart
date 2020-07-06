import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iwalletapp/screens/client_premium_info_screen.dart';
import 'package:iwalletapp/widgets/header_appbar.dart';

class PremiumCollectionScreen extends StatefulWidget {
  @override
  _PremiumCollectionScreenState createState() =>
      _PremiumCollectionScreenState();
}

class _PremiumCollectionScreenState extends State<PremiumCollectionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              HeaderAppbarWidget(headerName: 'Premium Collection'),
              Container(
                height: 460.0,
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'Required input fields',
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                                SizedBox(height: 40.0),
                                Text(
                                  'POLICY NO.',
                                  style: TextStyle(
                                    fontSize: 13.0,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                SizedBox(height: 10.0),
                                TextField(
                                  minLines: 1,
                                  maxLines: 1,
                                  autocorrect: false,
                                  decoration: InputDecoration(
                                    hintText: 'Enter policy number',
                                    filled: true,
                                    fillColor: Color(0xFFFFFFFF),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(5.0)),
                                      borderSide: BorderSide(
                                        color: Color(0xFFEAEAEC),
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(5.0)),
                                      borderSide: BorderSide(
                                        color: Color(0xFFEAEAEC),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 20.0),
                                Text(
                                  'YEAR OF BIRTH',
                                  style: TextStyle(
                                    fontSize: 13.0,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                SizedBox(height: 10.0),
                                TextField(
                                  minLines: 1,
                                  maxLines: 1,
                                  autocorrect: false,
                                  decoration: InputDecoration(
                                    hintText: 'Enter year',
                                    filled: true,
                                    fillColor: Color(0xFFFFFFFF),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(5.0)),
                                      borderSide: BorderSide(
                                        color: Color(0xFFEAEAEC),
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(5.0)),
                                      borderSide: BorderSide(
                                        color: Color(0xFFEAEAEC),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 20.0),
                                SizedBox(height: 10.0),
                                TextField(
                                  minLines: 1,
                                  maxLines: 1,
                                  autocorrect: false,
                                  obscureText: true,
                                  decoration: InputDecoration(
                                    hintText: 'Enter password',
                                    filled: true,
                                    fillColor: Color(0xFFFFFFFF),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(5.0)),
                                      borderSide: BorderSide(
                                        color: Color(0xFFEAEAEC),
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(5.0)),
                                      borderSide: BorderSide(
                                        color: Color(0xFFEAEAEC),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 20.0),
                                RawMaterialButton(
                                  fillColor: Color(0xFFFADB39),
                                  splashColor: Colors.grey,
                                  padding: EdgeInsets.all(10.0),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(6.0),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.max,
                                      children: const <Widget>[
                                        Text(
                                          'SUBMIT',
                                          maxLines: 1,
                                          style: TextStyle(
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.w800,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) =>
                                            ClientPremiumInfoScreen(),
                                      ),
                                    );
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
