import 'package:flutter/material.dart';
import 'package:flutterapp/screens/home/login.dart';
import 'package:flutterapp/services/auth.dart';
import 'models/user.dart';
import 'package:provider/provider.dart';

import 'screens/home/profile.dart';

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

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    print("Usuario: "+user.toString());

    // return either the Home or Login widget
    if (user == null) {
      return Login();
    } else {
      return Profile();
    }
  }
}
