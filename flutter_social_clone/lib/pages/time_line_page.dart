import 'package:flutter/material.dart';
import 'package:flutter_social_clone/widgets/header_widget.dart';
import 'package:flutter_social_clone/widgets/progress_widget.dart';

class TimeLinePage extends StatefulWidget {
  @override
  _TimeLinePageState createState() => _TimeLinePageState();
}

class _TimeLinePageState extends State<TimeLinePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: header(context, isAppTitle: true),
      body: circularProgress(),
    );
  }
}
