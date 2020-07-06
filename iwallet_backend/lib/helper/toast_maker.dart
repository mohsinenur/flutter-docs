import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ToastMaker {
  simpleToast(text) {
    return FlutterToast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_LONG,
//      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 2,
      backgroundColor: Colors.grey,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }
}
