import 'package:flutter/material.dart';
import 'package:flutterapp/screens/login.dart';
import 'package:flutterapp/services/auth.dart';
import 'home.dart';
import 'models/user.dart';
import 'package:provider/provider.dart';

import 'services/database.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  bool perfilVar = false;
  bool metasVar = false;

  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        home: Wrapper(),
        theme: ThemeData(
          primaryColor: Colors.lightGreen[700],
          fontFamily: 'Poppins',
          textTheme: TextTheme(
            bodyText1:
                TextStyle(fontWeight: FontWeight.w500, color: Colors.grey[700]),
          ),
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
    print("Usuario: " + user.toString());

    if (user == null) {
      return Login();
    } else {
      DatabaseService.uid = user.uid;
      return Home();
    }
  }
}
