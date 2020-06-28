import 'package:flutter/material.dart';

class BannerWidget extends StatefulWidget {
  @override
  _BannerWidgetState createState() => _BannerWidgetState();
}

class _BannerWidgetState extends State<BannerWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image(
          height: 200.0,
          width: MediaQuery.of(context).size.width,
          image: AssetImage('assets/images/background.png'),
          fit: BoxFit.cover,
        ),
        Container(
          padding: EdgeInsets.only(
            top: 10.0,
          ),
          height: 200.0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image(
                    image: AssetImage('assets/images/logo.png'),
                    width: 60.0,
                  ),
                  SizedBox(width: 10.0),
                  Text(
                    'i-insurance',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
    ;
  }
}
