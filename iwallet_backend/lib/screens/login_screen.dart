import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iwalletapp/api/api.dart';
import 'package:iwalletapp/helper/check_internet.dart';
import 'package:iwalletapp/helper/toast_maker.dart';
import 'package:iwalletapp/screens/otp_verification_screen.dart';
import 'package:iwalletapp/screens/registration_screen.dart';
import 'package:iwalletapp/widgets/banner.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'forgot_password_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  bool _isLoading = false;
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
                height: 520.0,
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
                                  'Welcome Back!',
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                                SizedBox(height: 10.0),
                                Text(
                                  'Sign in to continue',
                                  style: TextStyle(
                                    color: Color(0xFF62636B),
                                    fontSize: 16.0,
                                  ),
                                ),
                                SizedBox(height: 40.0),
                                Text(
                                  'PHONE NUMBER',
                                  style: TextStyle(
                                    fontSize: 13.0,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                SizedBox(height: 10.0),
                                TextField(
                                  controller: phoneController,
                                  minLines: 1,
                                  maxLines: 1,
                                  autocorrect: false,
                                  decoration: InputDecoration(
                                    hintText: 'Enter phone number',
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
                                  'PASSWORD',
                                  style: TextStyle(
                                    fontSize: 13.0,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                SizedBox(height: 10.0),
                                TextField(
                                  controller: passwordController,
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
                                              'LOGIN',
                                              maxLines: 1,
                                              style: TextStyle(
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.w800,
                                              ),
                                            ),
                                          ),
                                    onPressed: _isLoading ? null : _handleLogin,
                                  ),
                                ),
                                SizedBox(height: 10.0),
                                Center(
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (_) =>
                                              ForgotPasswordScreen(),
                                        ),
                                      );
                                    },
                                    child: Padding(
                                      padding: EdgeInsets.all(10.0),
                                      child: Text(
                                        'Forgot Password?',
                                        style: TextStyle(
                                          fontSize: 16.0,
                                          color: Color(0xFF989BA7),
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 20.0),
                                RawMaterialButton(
                                  splashColor: Color(0xFFEAEAEC),
                                  padding: EdgeInsets.all(10.0),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(6.0),
                                    side: BorderSide(color: Color(0xFFEAEAEC)),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.max,
                                      children: const <Widget>[
                                        Text(
                                          'CREATE AN ACCOUNT',
                                          maxLines: 1,
                                          style: TextStyle(
                                            fontSize: 16.0,
                                            color: Colors.grey,
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
                                        builder: (_) => RegistrationScreen(),
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

  void _handleLogin() async {
    bool internetConnected = await CheckInternet().checkInternet();

    if (internetConnected != true) {
      return ToastMaker().simpleErrorToast('Check your internet connection.');
    }
    FocusScope.of(context).requestFocus(FocusNode());

    setState(() {
      _isLoading = true;
    });

    var data = {
      'mobile_number': phoneController.text,
      'password': passwordController.text,
    };

    try {
      FormData formData = new FormData.fromMap(data);
      Response response = await CallApi().postData(formData, 'login');
      Map responseBody = response.data;
      print(responseBody);
      if (responseBody['code'] != null) {
        if (responseBody['code'] == 200) {
          print(responseBody['code']);
          if (responseBody['message'] != null) {
            ToastMaker().simpleToast(responseBody['message']);
          }
          SharedPreferences localStorage =
              await SharedPreferences.getInstance();
          localStorage.setString('agent', jsonEncode(data));
          print(data);
          await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => OTPVerificationScreen(),
            ),
          );
        } else {
          if (responseBody['message'] != null) {
            ToastMaker().simpleErrorToast(responseBody['message']);
          } else {
            ToastMaker().simpleErrorToast('Something went wrong!');
          }
        }
      }
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      print(e);
      ToastMaker().simpleErrorToast('Something went wrong!!');
    }

    setState(() {
      _isLoading = false;
    });
  }
}
