import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/models/userData.dart';
import 'package:flutterapp/screens/Perfil/fade.dart';
import 'package:flutterapp/services/database.dart';
import 'package:flutterapp/screens/Metas/Lista.dart';

int multiplier = 1;
int day = 1;
int weekN = 0;
int monthN = 0;
bool week = false;
bool month = false;
int expLocal = 0;
int levelLocal = 1;

class Metas extends StatefulWidget {
  @override
  _MetasState createState() => _MetasState();
}

class _MetasState extends State<Metas> {
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Color(0xff4ac3bb), Color(0xffffffff)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter),
          ),
          child: Stack(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 220),
                child: StreamBuilder<UserData>(
                  stream: DatabaseService().userData,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      UserData userData = snapshot.data;
                      expLocal = userData.exp;
                      levelLocal = userData.level;
                      return ListView(children: <Widget>[
                        selecionarMeta(
                            listaMetas[0] + '$day', context, 1.0, userData, 1),
                        selecionarMeta(
                            listaMetas[1] + '$day', context, 1.0, userData, 1),
                        selecionarMeta(
                            listaMetas[2] + '$day', context, 1.0, userData, 1),
                        selecionarMeta(
                            listaMetas[3] + '$day', context, 1.0, userData, 1),
                      ]);
                    } else {
                      return Center(child: CircularProgressIndicator());
                    }
                  },
                ),
              ),
              MyArc(diameter: 300, angle: 0, color: Color(0xffc3c14a)),
            ],
          ),
        ),
      ),
      clipper: BottomWaveClipper(),
    );
  }
}

// Botão da meta
Widget selecionarMeta(text, context, tempo, userdata, bonus) {
  void nivel() {
    expLocal += 5 * multiplier * bonus;
    if (expLocal >= 200 + (levelLocal - 1) * 200) {
      levelLocal += 1;
    }
    userdata.exp = expLocal;
    userdata.level = levelLocal;
    DatabaseService().updateUserData(userdata);
    day += 1;
  }

  return FadeIn(
    tempo,
    Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.transparent,
            spreadRadius: 10,
            blurRadius: 10,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      margin: EdgeInsets.all(4.0),
      height: 80.0,
      width: 370.0,
      child: OutlineButton(
        borderSide: BorderSide(color: Theme.of(context).primaryColor),
        onPressed: () async {
          day == 7 ? week = !week : Container();
          day % 7 == 0 ? weekN += 1 : Container();
          day == 30 ? month = !month : Container();
          day % 30 == 0 ? monthN += 1 : Container();
          multiplier += 1;
          print('Inicio $day');
          nivel();
          print('Após $day');
        },
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        child: ListTile(
          title: Text(
            text,
            style: TextStyle(
                color: Colors.lightGreen[900],
                fontSize: 14.0,
                letterSpacing: 2.0),
          ),
          subtitle: Text(
            '${5 * multiplier * bonus} de experiência',
            style: Theme.of(context).textTheme.bodyText1,
          ),
          leading: Icon(Icons.delete),
          trailing: Icon(Icons.check),
        ),
      ),
    ),
  );
}

class MyArc extends StatelessWidget {
  final double diameter;
  final double angle;
  final Color color;

  const MyArc({Key key, this.diameter = 200, this.angle, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: MyPainter(this.angle, this.color),
      size: Size(diameter, diameter),
    );
  }
}

// This is the Painter class
class MyPainter extends CustomPainter {
  final double angle;
  final Color color;
  MyPainter(this.angle, this.color);
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = this.color;
    canvas.drawArc(
      Rect.fromCenter(
        center: Offset(250 + size.height / 2, -150 + size.width / 2),
        height: size.height,
        width: size.width,
      ),
      this.angle,
      pi,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class BottomWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();
    path.lineTo(0.0, size.height - 20);

    var firstControlPoint = Offset(size.width / 4, size.height);
    var firstEndPoint = Offset(size.width / 2.25, size.height - 30.0);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondControlPoint =
        Offset(size.width - (size.width / 3.25), size.height - 65);
    var secondEndPoint = Offset(size.width, size.height - 40);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    path.lineTo(size.width, size.height - 40);
    path.lineTo(size.width, 0.0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
