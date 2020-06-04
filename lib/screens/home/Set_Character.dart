import 'package:flutter/material.dart';

class Character extends StatefulWidget {
  @override
  _CharacterState createState() => _CharacterState();
}

class _CharacterState extends State<Character> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[300],
      appBar: AppBar(
        title: Text('Select your goal'),
        centerTitle: true,
        backgroundColor: Colors.lightGreen,
        elevation: 0.0,
      ),

      body: Padding(
        padding: EdgeInsets.fromLTRB(30.0,40.0,30.0,0.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(
                child: Row(
                  children: <Widget>[
                    CircleAvatar(
                      backgroundImage: AssetImage('Assets/Light.jpg'),
                      radius: 60.0,
                    ),
                    FlatButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/home');
                      },
                      child: Text('Light profile',
                      style: TextStyle(
                        fontFamily: 'Lato',
                        letterSpacing: 2.0,
                        fontSize: 16.0,
                      ),
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                height: 60.0,
                color: Colors.grey[900],
              ),
              Row(
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage: AssetImage('Assets/exercice-personne-agee.jpg'),
                    radius: 60.0,
                  ),
                  FlatButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/home');
                    },
                    child: Text('Casual profile',
                      style: TextStyle(
                        fontFamily: 'Lato',
                        letterSpacing: 2.0,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ],
              ),
              Divider(
                height: 60.0,
                color: Colors.grey[900],
              ),
              Row(
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage: AssetImage('Assets/Hardcore.jpg'),
                    radius: 60.0,
                  ),
                  FlatButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/home');
                    },
                    child: Text('Hardcore profile',
                      style: TextStyle(
                        fontFamily: 'Lato',
                        letterSpacing: 2.0,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
    );
  }
}
