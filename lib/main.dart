import 'package:flutter/material.dart';
import 'screens/home/profile.dart';
import 'screens/home/character.dart';
import 'screens/home/login.dart';
import 'screens/home/cadastro.dart';


void main() => runApp(MaterialApp(
  initialRoute: '/',
  routes: {
    '/': (context) => Login(),
    '/character': (context) => Character(),
    '/profile': (context) => Profile(),
    '/cadastro': (context) => Cadastro(),
  },
  theme: ThemeData(
    primaryColor: Colors.lightGreen[700],
    fontFamily: 'Lato',
    backgroundColor: Colors.grey[300],
    /* textTheme: TextTheme(
      headline3: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
      headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
    ), */
  ),
));

