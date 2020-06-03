import 'package:flutter/material.dart';
import './pages/profile.dart';
import './pages/home.dart';
import './pages/loading.dart';
import './pages/Set_Character.dart';
import './pages/open.dart';


void main() => runApp(MaterialApp(
  initialRoute: '/opening',
  routes: {
    '/': (context) => Loading(),
    '/character': (context) => Character(),
    '/opening': (context) => Opening(),
    '/home': (context) => Home(),
    '/profile': (context) => Profile(),
  },
));

