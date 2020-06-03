import 'package:flutter/material.dart';
import 'package:flutterapp/pages/profile.dart';
import 'package:flutterapp/pages/home.dart';
import 'package:flutterapp/pages/loading.dart';
import 'package:flutterapp/pages/Set_Character.dart';
import 'package:flutterapp/pages/open.dart';


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

