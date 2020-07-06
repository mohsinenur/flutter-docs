import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iwalletapp/screens/forgot_password_screen.dart';
import 'package:iwalletapp/screens/home_screen.dart';
import 'package:iwalletapp/widgets/header_appbar.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';

class OTPVerificationCollectScreen extends StatefulWidget {
  @override
  _OTPVerificationCollectScreenState createState() =>
      _OTPVerificationCollectScreenState();
}

class _OTPVerificationCollectScreenState
    extends State<OTPVerificationCollectScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              HeaderAppbarWidget(headerName: 'OTP Verification'),
              Container(
                height: 400.0,
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
                                  'Collect due ৳5,000.00',
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                                SizedBox(height: 10.0),
                                Text(
                                  'We will text you on +880 1716609651',
                                  style: TextStyle(
                                    color: Color(0xFF62636B),
                                    fontSize: 16.0,
                                  ),
                                ),
                                SizedBox(height: 40.0),
                                Text(
                                  'ENTER OTP',
                                  style: TextStyle(
                                    fontSize: 13.0,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                SizedBox(height: 10.0),
                                OTPTextField(
                                  length: 4,
                                  width: MediaQuery.of(context).size.width,
                                  fieldWidth: 50,
                                  style: TextStyle(fontSize: 17),
                                  textFieldAlignment:
                                      MainAxisAlignment.spaceAround,
                                  fieldStyle: FieldStyle.box,
                                  onCompleted: (pin) {
                                    print('collected');
                                  },
                                ),
                                SizedBox(height: 30.0),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => HomeScreen(),
                                      ),
                                    );
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.fromLTRB(
                                        0.0, 10.0, 10.0, 10.0),
                                    child: GestureDetector(
                                      child: Text(
                                        'RESEND CODE',
                                        style: TextStyle(
                                          fontSize: 16.0,
                                          color: Color(0xFF989BA7),
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (_) =>
                                                ForgotPasswordScreen(),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                                SizedBox(height: 40.0),
                                RawMaterialButton(
                                  fillColor: Color(0xFFFADB39),
                                  splashColor: Colors.grey[100],
                                  padding: EdgeInsets.all(10.0),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(6.0),
                                  ),
                                  onPressed: () {
                                    _collectionSuccessModal(context);
                                  },
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

  void _collectionSuccessModal(context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext buildContext) {
        return Container(
          height: MediaQuery.of(context).size.width,
          decoration: new BoxDecoration(
            color: Colors.white,
            borderRadius: new BorderRadius.only(
              topLeft: const Radius.circular(15.0),
              topRight: const Radius.circular(15.0),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(30.0),
            child: Column(
              children: <Widget>[
                Image(
                  image: AssetImage('assets/images/collection_success.png'),
                  height: 120.0,
                ),
                SizedBox(height: 20.0),
                Text(
                  'Successfully Done!',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 25.0,
                  ),
                ),
                SizedBox(height: 10.0),
                Text(
                  'Due collected successfully. The amount will be credited in total collection amount',
                  style: TextStyle(
                    color: Color(0xFF989BA7),
                    fontWeight: FontWeight.w400,
                    fontSize: 16.0,
                  ),
                ),
                SizedBox(height: 20.0),
                RawMaterialButton(
                  fillColor: Color(0xFFFADB39),
                  splashColor: Colors.grey[100],
                  padding: EdgeInsets.all(10.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => HomeScreen(),
                      ),
                    );
                  },
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: const <Widget>[
                        Text(
                          'DONE',
                          maxLines: 1,
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    ).whenComplete(() {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => HomeScreen(),
        ),
      );
    });
  }
}
