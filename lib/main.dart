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
    fontFamily: 'Lato'
  ),
));

