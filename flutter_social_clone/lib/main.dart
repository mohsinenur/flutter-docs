import 'package:flutter/material.dart';
import 'package:flutter_social_clone/pages/home_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mookul',
      theme: ThemeData(
        primarySwatch: Colors.grey,
        cardColor: Colors.white70,
        accentColor: Colors.black,
        scaffoldBackgroundColor: Colors.black,
        dialogBackgroundColor: Colors.black,
      ),
      home: HomePage(),
    );
  }
}
