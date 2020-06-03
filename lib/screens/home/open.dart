import 'package:flutter/material.dart';

class Opening extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      ),
      backgroundColor: Colors.grey[400],
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              RaisedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/character');
                },
                child: Text('Sign in',
                  style: TextStyle(
                    fontFamily: 'Lato',
                    fontSize: 30.0,
                    letterSpacing: 2.0,
                    color: Colors.lightGreen[700]
                  ),
                ),
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/home');
                },
                child: Text('Log in',
                  style: TextStyle(
                      fontFamily: 'Lato',
                      fontSize: 30.0,
                      letterSpacing: 2.0,
                      color: Colors.lightGreen[700]
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

