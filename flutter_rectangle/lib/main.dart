import 'package:flutter/material.dart';
import 'package:flutterrectangle/category_route.dart';

void main() {
  runApp(UnitConverter());
}

class UnitConverter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Unit Converter',
      home: CategoryRoute(),
    );
  }
}