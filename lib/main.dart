import 'package:flutter/material.dart';
import 'package:flutterapp/services/auth.dart';
import 'package:flutterapp/wraper.dart';
import 'models/user.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        home: Wrapper(),
        theme: ThemeData(
          primaryColor: Colors.lightGreen[700],
          fontFamily: 'Lato',
          backgroundColor: Colors.grey[300],
        ),
      ),
    );
  }
}
