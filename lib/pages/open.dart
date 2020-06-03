import 'package:flutter/material.dart';

class Opening extends StatefulWidget {
  @override
  _OpeningState createState() => _OpeningState();
}

class _OpeningState extends State<Opening> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: openAppBar(),
      backgroundColor: Colors.grey[400],
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              buttonWidget('Sign in','/character'),
              buttonWidget('Log in','/profile'),
            ],
          ),
        ],
      ),
    );
  }

  Widget openAppBar(){
    return AppBar(
      title: Text('Videco',
      style: TextStyle(
        fontSize: 24.0,
        fontFamily: 'Lato',
        letterSpacing: 2.0,
      ),
      ),
      centerTitle: true,
      backgroundColor: Colors.lightGreen[700],
      automaticallyImplyLeading: false,
    );
  }

  Widget buttonWidget(texto,rota){
    return RaisedButton(
      onPressed: () {
        Navigator.pushNamed(context, rota);
      },
      child: Text(texto,
        style: TextStyle(
          fontFamily: 'Lato',
          fontSize: 25.0,
          letterSpacing: 2.0,
          color: Colors.lightGreen[700]
        ),
      ),
    );
  }

}

