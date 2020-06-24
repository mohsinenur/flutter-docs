import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'dart:async';

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
      title: 'Mookul App',
      theme: ThemeData(
        primaryColor: Color(0xFF3EBACE),
        accentColor: Color(0xFFD8ECF1),
        scaffoldBackgroundColor: Color(0xFFF3F5F7),
      ),
      home: SafeArea(
        child: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final flutterWebViewPlugin = FlutterWebviewPlugin();
  StreamSubscription _onDestroy;
  StreamSubscription<WebViewHttpError> _onHttpError;
  StreamSubscription<String> _onUrlChanged;
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();

    flutterWebViewPlugin.close();

    _onDestroy = flutterWebViewPlugin.onDestroy.listen((_) {
      if (mounted) {
        // Actions like show a info toast.
        _scaffoldKey.currentState.showSnackBar(
            const SnackBar(content: const Text('Webview Destroyed')));
      }
    });

    _onHttpError =
        flutterWebViewPlugin.onHttpError.listen((WebViewHttpError error) {
          if (mounted) {
            // Actions like show a info toast.
            _scaffoldKey.currentState.showSnackBar(
                const SnackBar(content: const Text('Check Network Connection!')));
          }
        });
    _onUrlChanged = flutterWebViewPlugin.onUrlChanged.listen((String url) {

      if (mounted) {
        print('11111');

      }else{
        print('222');
      }
    });
  }

  @override
  void dispose() {
    // Every listener should be canceled, the same should be done with this stream.
    _onDestroy.cancel();
//    _onUrlChanged.cancel();
    _onHttpError.cancel();
    _onUrlChanged.cancel();

    flutterWebViewPlugin.dispose();

    super.dispose();
  }

  Future<bool> _onWillPop() async {
    return (await showDialog(
      context: context,
      builder: (context) => new AlertDialog(
        title: new Text('Are you sure?'),
        content: new Text('Do you want to exit an App'),
        actions: <Widget>[
          new FlatButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: new Text('No'),
          ),
          new FlatButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: new Text('Yes'),
          ),
        ],
      ),
    )) ?? false;
  }


  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      key: _scaffoldKey,
      url: 'https://web.mookul.com',
      withLocalStorage: true,
      hidden: true,
    );
  }
}
