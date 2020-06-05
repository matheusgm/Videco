import 'package:flutter/material.dart';
import 'package:flutterapp/screens/home/login.dart';
import 'package:flutterapp/screens/home/profile.dart';
import 'package:provider/provider.dart';

import 'models/user.dart';

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
