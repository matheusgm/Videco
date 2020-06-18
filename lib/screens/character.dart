import 'package:flutter/material.dart';
import 'package:flutterapp/widgetsReutilizados.dart';

class Character extends StatefulWidget {
  @override
  _CharacterState createState() => _CharacterState();
}

class _CharacterState extends State<Character> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WidgetsReutilizados.openAppBar("Select your goal"),
      body: _bodyCharacter(),
    );
  }

  Widget _bodyCharacter() {
    return ListView(
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _goalsCharacter(
                'Light profile',
                'assets/Light.jpg',
                () {},
              ),
              Divider(
                height: 60.0,
                color: Colors.grey[900],
              ),
              _goalsCharacter(
                'Casual profile',
                'assets/exercice-personne-agee.jpg',
                () {},
              ),
              Divider(
                height: 60.0,
                color: Colors.grey[900],
              ),
              _goalsCharacter(
                'Hardcore profile',
                'assets/Hardcore.jpg',
                () {},
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _goalsCharacter(String title, String imagePath, onPressed) {
    return Row(
      children: <Widget>[
        CircleAvatar(
          backgroundImage: AssetImage(imagePath),
          radius: 60.0,
        ),
        FlatButton(
          onPressed: onPressed,
          child: Text(
            title,
            style: TextStyle(
              letterSpacing: 2.0,
              fontSize: 16.0,
            ),
          ),
        ),
      ],
    );
  }
}
