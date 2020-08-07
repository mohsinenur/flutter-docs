import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iwalletapp/api/api.dart';
import 'package:iwalletapp/helper/toast_maker.dart';
import 'package:iwalletapp/screens/forgot_password_screen.dart';
import 'package:iwalletapp/screens/home_screen.dart';
import 'package:iwalletapp/widgets/banner.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:shared_preferences/shared_preferences.dart';

bool _isLoading = false;
String otp = "";

class OTPVerificationRegScreen extends StatefulWidget {
  @override
  _OTPVerificationRegScreenState createState() =>
      _OTPVerificationRegScreenState();
}

class _OTPVerificationRegScreenState extends State<OTPVerificationRegScreen> {
  var agentData;
  @override
  void initState() {
    _getAgentInfo();
    super.initState();
  }

  void _getAgentInfo() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var agentJson = localStorage.getString('agent');
    var agent = json.decode(agentJson);
    setState(() {
      agentData = agent;
    });
    print(agent);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              BannerWidget(),
              Container(
                height: 380.0,
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
                                  'OTP Verification',
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                                SizedBox(height: 10.0),
                                Text(
                                  agentData != null
                                      ? 'We will text you on ${agentData['mobile_number']}'
                                      : '',
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
                                  length: 5,
                                  width: MediaQuery.of(context).size.width,
                                  fieldWidth: 45,
                                  style: TextStyle(fontSize: 17),
                                  textFieldAlignment:
                                      MainAxisAlignment.spaceAround,
                                  fieldStyle: FieldStyle.box,
                                  onCompleted: (pin) {
                                    setState(() {
                                      otp = pin;
                                    });
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
                                SizedBox(
                                  width: double.infinity,
                                  child: FlatButton(
                                    color: Color(0xFFFADB39),
                                    splashColor: Colors.grey,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(6.0),
                                    ),
                                    child: _isLoading
                                        ? CircularProgressIndicator(
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                              Color(0xFFFADB39),
                                            ),
                                          )
                                        : Padding(
                                            padding: EdgeInsets.all(20.0),
                                            child: Text(
                                              'VERIFY',
                                              maxLines: 1,
                                              style: TextStyle(
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.w800,
                                              ),
                                            ),
                                          ),
                                    onPressed: _isLoading
                                        ? null
                                        : _handleOtpVerification,
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

  void _handleOtpVerification() async {
    setState(() {
      _isLoading = true;
    });

    if (otp == null || otp == "") {
      ToastMaker().simpleToast('Please enter OTP');
    } else {
      var data = {
        'name': agentData['name'],
        'address': agentData['address'],
        'mobile_number': agentData['mobile_number'],
        'dob': agentData['dob'],
        'email': agentData['email'],
        'password': agentData['password'],
        'password_confirmation': agentData['password_confirmation'],
        'otp': otp,
        'photo': agentData['photo'],
        'verification_doc': agentData['verification_doc'],
      };

      print(data);

      try {
        FormData formData = new FormData.fromMap(data);
        Response response =
            await CallApi().postData(formData, 'wallet/agent-signup-complete');
        Map responseBody = response.data;
        print(responseBody);
        if (responseBody['code'] != null) {
          if (responseBody['code'] == 200) {
            if (responseBody['message'] != null) {
              ToastMaker().simpleToast(responseBody['message']);
            }
            SharedPreferences localStorage =
                await SharedPreferences.getInstance();
            localStorage.setString('agent', json.encode(data));

            await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => HomeScreen(),
              ),
            );
          } else {
            if (responseBody['message'] != null) {
              ToastMaker().simpleToast(responseBody['message']);
            } else {
              ToastMaker().simpleToast('Something went wrong!');
            }
          }
        }
      } catch (e) {
        ToastMaker().simpleToast('Something went wrong!');
      }
    }

    setState(() {
      _isLoading = false;
    });
  }
}
