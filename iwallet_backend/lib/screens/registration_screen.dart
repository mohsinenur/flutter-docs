import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iwalletapp/api/api.dart';
import 'package:iwalletapp/helper/toast_maker.dart';
import 'package:iwalletapp/screens/otp_verification_reg_screen.dart';
import 'package:iwalletapp/widgets/header_appbar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  DateTime selectedDate = DateTime.now();
  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController attachmentController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  bool _isLoading = false;

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1900, 8),
        lastDate: DateTime(2100));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
        dobController.text = "${selectedDate.toLocal()}".split(' ')[0];
      });
  }

  @override
  void initState() {
    super.initState();
    dobController.text = "${selectedDate.toLocal()}".split(' ')[0];
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
              HeaderAppbarWidget(headerName: 'Registration'),
              Container(
                height: 1120.0,
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
                                  'Create an account',
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                                SizedBox(height: 10.0),
                                Text(
                                  'Sign up to continue',
                                  style: TextStyle(
                                    color: Color(0xFF62636B),
                                    fontSize: 16.0,
                                  ),
                                ),
                                SizedBox(height: 20.0),
                                Center(
                                  child: Image(
                                    image: AssetImage(
                                        'assets/images/add_photo.png'),
                                    width: 100.0,
                                  ),
                                ),
                                SizedBox(height: 20.0),
                                Text(
                                  'NAME',
                                  style: TextStyle(
                                    fontSize: 13.0,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                SizedBox(height: 10.0),
                                TextField(
                                  controller: nameController,
                                  minLines: 1,
                                  maxLines: 1,
                                  autocorrect: false,
                                  decoration: InputDecoration(
                                    hintText: 'Enter name',
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
                                  'ADDRESS',
                                  style: TextStyle(
                                    fontSize: 13.0,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                SizedBox(height: 10.0),
                                TextField(
                                  controller: addressController,
                                  minLines: 1,
                                  maxLines: 1,
                                  autocorrect: false,
                                  decoration: InputDecoration(
                                    hintText: 'Enter address',
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
                                  'DATE OF BIRTH',
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
                                    hintText: 'Enter date',
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
                                    suffixIcon: FlatButton(
                                      onPressed: () => _selectDate(context),
                                      child: Icon(
                                        Icons.calendar_today,
                                        color: Color(0xFFBABFCC),
                                      ),
                                    ),
                                  ),
                                  autofocus: false,
                                  controller: dobController,
                                ),
                                SizedBox(height: 20.0),
                                Text(
                                  'EMAIL',
                                  style: TextStyle(
                                    fontSize: 13.0,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                SizedBox(height: 10.0),
                                TextField(
                                  controller: emailController,
                                  minLines: 1,
                                  maxLines: 1,
                                  autocorrect: false,
                                  decoration: InputDecoration(
                                    hintText: 'Enter email',
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
                                  'ATTACHMENT',
                                  style: TextStyle(
                                    fontSize: 13.0,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                SizedBox(height: 10.0),
                                TextField(
                                  controller: attachmentController,
                                  minLines: 1,
                                  maxLines: 1,
                                  autocorrect: false,
                                  decoration: InputDecoration(
                                    hintText: 'NID/Passport/License (anyone)',
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
                                Text(
                                  'CONFIRM PASSWORD',
                                  style: TextStyle(
                                    fontSize: 13.0,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                SizedBox(height: 10.0),
                                TextField(
                                  controller: confirmPasswordController,
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
                                    padding: EdgeInsets.all(20.0),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(6.0),
                                    ),
                                    child: Text(
                                      _isLoading
                                          ? 'REGISTRATION...'
                                          : 'REGISTRATION',
                                      maxLines: 1,
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ),
                                    onPressed:
                                        _isLoading ? null : _handleRegistration,
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

  void _handleRegistration() async {
    setState(() {
      _isLoading = true;
    });

    var data = {
      'name': nameController.text,
      'address': addressController.text,
      'mobile_number': phoneController.text,
      'dob': dobController.text,
      'email': emailController.text,
      'password': passwordController.text,
      'password_confirmation': confirmPasswordController.text,
    };

    try {
      FormData formData = new FormData.fromMap(data);
      Response response =
          await CallApi().postData(formData, 'wallet/agent-signup');
      Map responseBody = response.data;
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
              builder: (_) => OTPVerificationRegScreen(),
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

    setState(() {
      _isLoading = false;
    });
  }
}
