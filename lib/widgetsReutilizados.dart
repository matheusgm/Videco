import 'package:flutter/material.dart';

class WidgetsReutilizados{

  static Widget openAppBar(String title){
    return AppBar(
      title: Text(title,
        style: TextStyle(
          fontSize: 24.0,
          letterSpacing: 2.0,
        ),
      ),
      centerTitle: true,
      elevation: 0.0,
    );
  }

}