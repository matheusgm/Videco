import 'package:flutter/material.dart';
import 'package:flutterapp/screens/login.dart';
import 'package:flutterapp/services/auth.dart';
import 'home.dart';
import 'models/user.dart';
import 'package:provider/provider.dart';

import 'services/userDatabase.dart';

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
          primaryColor: Color(0xff76b041),
          fontFamily: 'Poppins',
          textTheme: TextTheme(
            bodyText1:
                TextStyle(fontWeight: FontWeight.w500, color: Colors.grey[700]),
                bodyText2:
                TextStyle(fontWeight: FontWeight.w500, color: Color(0xff76b041))
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
      UserDatabaseService.uid = user.uid;
      return Home();
    }
  }
}
