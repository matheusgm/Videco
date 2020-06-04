import 'package:flutter/material.dart';
import 'screens/home/profile.dart';
import 'screens/home/home.dart';
import 'screens/home/Set_Character.dart';
import 'screens/home/open.dart';
import 'screens/wrapper.dart';
import 'screens/home/cadastro.dart';


void main() => runApp(MaterialApp(
  initialRoute: '/',
  routes: {
    '/': (context) => Opening(),
    '/character': (context) => Character(),
    '/home': (context) => Home(),
    '/profile': (context) => Profile(),
    '/wrap': (context) => Wrapper(),
    '/cadastro': (context) => Cadastro(),
  },
  theme: ThemeData(
    primaryColor: Colors.lightGreen[700],
    fontFamily: 'Lato'
  ),
));

