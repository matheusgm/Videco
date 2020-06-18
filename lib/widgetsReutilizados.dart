import 'package:flutter/material.dart';

class WidgetsReutilizados{

  static Widget openAppBar(String title){
    return AppBar(
      title: Text(title,
        style: TextStyle(
          fontSize: 24.0,
          letterSpacing: 5.0,
          fontFamily: 'Poppins',
        ),
      ),
      centerTitle: true,
      elevation: 0.0,
    );
  }
}