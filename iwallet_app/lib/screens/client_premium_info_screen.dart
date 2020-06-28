import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iwalletapp/screens/otp_verification_collect_screen.dart';
import 'package:iwalletapp/widgets/header_appbar.dart';

class ClientPremiumInfoScreen extends StatefulWidget {
  @override
  _ClientPremiumInfoScreenState createState() =>
      _ClientPremiumInfoScreenState();
}

class _ClientPremiumInfoScreenState extends State<ClientPremiumInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              HeaderAppbarWidget(headerName: 'Client Premium Info'),
              Container(
                height: 680.0,
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
                              children: <Widget>[
                                CircleAvatar(
                                  radius: 50.0,
                                  backgroundColor: Colors.white,
                                  child: Image.asset(
                                      'assets/images/client_img.png'),
                                ),
                                SizedBox(height: 15.0),
                                Text(
                                  'Rashedul Islam khan',
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                                SizedBox(height: 5.0),
                                Text(
                                  '01716607590',
                                  style: TextStyle(
                                    color: Color(0xFF62636B),
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(height: 5.0),
                                Text(
                                  '44, Road 8, Block D, Mirpur 2, Dhaka',
                                  style: TextStyle(
                                    color: Color(0xFF62636B),
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(height: 30.0),
                                Table(
                                  border: TableBorder.all(),
                                  children: [
                                    TableRow(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 30.0),
                                          child: Column(
                                            children: <Widget>[
                                              Text(
                                                'Policy no.',
                                                style: TextStyle(
                                                  color: Color(0xFF62636B),
                                                  fontSize: 15.0,
                                                ),
                                              ),
                                              Text(
                                                '884353484',
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 16.0,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 30.0),
                                          child: Column(
                                            children: <Widget>[
                                              Text(
                                                'Policy type',
                                                style: TextStyle(
                                                  color: Color(0xFF62636B),
                                                  fontSize: 15.0,
                                                ),
                                              ),
                                              Text(
                                                'Property insurance',
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 16.0,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    TableRow(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 30.0),
                                          child: Column(
                                            children: <Widget>[
                                              Text(
                                                'Open date',
                                                style: TextStyle(
                                                  color: Color(0xFF62636B),
                                                  fontSize: 15.0,
                                                ),
                                              ),
                                              Text(
                                                '20 MAY 2020',
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 16.0,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 30.0),
                                          child: Column(
                                            children: <Widget>[
                                              Text(
                                                'Validity',
                                                style: TextStyle(
                                                  color: Color(0xFF62636B),
                                                  fontSize: 15.0,
                                                ),
                                              ),
                                              Text(
                                                '15 JUNE 2020',
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 16.0,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(height: 20.0),
                                Container(
                                  padding: EdgeInsets.only(
                                      left: 5.0,
                                      top: 20.0,
                                      right: 5.0,
                                      bottom: 20.0),
                                  decoration: BoxDecoration(
                                    color: Color(0xfff1f7ff),
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.max,
                                    children: <Widget>[
                                      Column(
                                        children: <Widget>[
                                          Text(
                                            '৳5,000.00',
                                            style: TextStyle(
                                              fontSize: 35.0,
                                              color: Color(0xff0068ff),
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                          Text(
                                            'TOTAL PAYABLE DUE',
                                            style: TextStyle(
                                              fontSize: 12.0,
                                              color: Color(0xff0068ff),
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 60.0),
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
                                          'COLLECT NOW',
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
                                            OTPVerificationCollectScreen(),
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
