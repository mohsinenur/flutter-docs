import 'package:flutter/material.dart';

class HeaderAppbarWidget extends StatefulWidget {
  final String headerName;

  const HeaderAppbarWidget({Key key, this.headerName}) : super(key: key);
  @override
  _HeaderAppbarWidgetState createState() => _HeaderAppbarWidgetState();
}

class _HeaderAppbarWidgetState extends State<HeaderAppbarWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(
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
                children: <Widget>[
                  InkWell(
                    onTap: () => Navigator.pop(context),
                    child: CircleAvatar(
                      radius: 18,
                      backgroundColor: Color(0xFF343434),
                      child: IconButton(
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                          size: 18.0,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      widget.headerName,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
