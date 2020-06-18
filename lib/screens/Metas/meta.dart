import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/models/userData.dart';
import 'package:flutterapp/screens/Perfil/fade.dart';
import 'package:flutterapp/services/userDatabase.dart';
import 'package:flutterapp/screens/Metas/Lista.dart';
import '../../design/bezier_curves.dart';
import '../../design/arcPainter.dart';

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
              MyArc(diameter: 300, angle: 0, color: Color(0xffc3c14a)),
              Container(
                margin: EdgeInsets.only(top: 220),
                child: StreamBuilder<UserData>(
                  stream: UserDatabaseService().userData,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      UserData userData = snapshot.data;
                      expLocal = userData.exp;
                      levelLocal = userData.level;
                      return ListView(
                        children: <Widget>[
                          selecionarMeta(listaMetas[0] + '$day', context, 1.0,
                              userData, 1),
                          selecionarMeta(listaMetas[1] + '$day', context, 1.0,
                              userData, 1),
                          selecionarMeta(listaMetas[2] + '$day', context, 1.0,
                              userData, 1),
                          selecionarMeta(listaMetas[3] + '$day', context, 1.0,
                              userData, 1),
                        ],
                      );
                    } else {
                      return Center(child: CircularProgressIndicator());
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      clipper: BottomWaveClipper2(),
    );
  }
}

// Botão da meta
Widget selecionarMeta(text, context, tempo, UserData userdata, bonus) {
  void nivel() {
    expLocal += 5 * multiplier * bonus;
    if (expLocal >= 200 + (levelLocal - 1) * 200) {
      levelLocal += 1;
    }
    userdata.exp = expLocal;
    userdata.level = levelLocal;
    UserDatabaseService().updateUserData(userdata);
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


