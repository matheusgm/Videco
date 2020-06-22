import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/models/meta.dart';
import 'package:flutterapp/models/metaUsuario.dart';
import 'package:flutterapp/models/userData.dart';
import 'package:flutterapp/screens/Perfil/fade.dart';
import 'package:flutterapp/services/MetaDatabase.dart';
import 'package:flutterapp/services/metaUsuarioDatabase.dart';
import 'package:flutterapp/services/userDatabase.dart';
import '../../design/bezier_curves.dart';
import '../../design/arcPainter.dart';

class Metas extends StatefulWidget {
  @override
  _MetasState createState() => _MetasState();
}

class _MetasState extends State<Metas> {
  int multiplier = 1;
  int bonus = 1;
  int day = 1;
  int expLocal = 0;
  int levelLocal = 1;
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xff4ac3bb), Color(0xffffffff)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Stack(
            children: <Widget>[
              MyArc(diameter: 300, angle: 0, color: Color(0xffc3c14a)),
              Container(
                margin: EdgeInsets.only(top: 220),
                child: StreamBuilder<List<Meta>>(
                  stream: MetaDatabaseService().meta,
                  builder: (context, snapshotMeta) {
                    if (snapshotMeta.hasData) {
                      return StreamBuilder<List<MetaUsuario>>(
                          stream: MetaUsuarioDatabaseService().metaUsuario,
                          builder: (context, snapshotMetaUsuario) {
                            if (snapshotMetaUsuario.hasData) {
                              List<Meta> metas = snapshotMeta.data;
                              List<MetaUsuario> metasUsuario =
                                  snapshotMetaUsuario.data;

                              bool existeMeta;
                              for (Meta m in metas) {
                                existeMeta = false;
                                for (MetaUsuario mu in metasUsuario) {
                                  if (m.id == mu.metaID) {
                                    mu.meta = m;
                                    existeMeta = true;
                                    break;
                                  }
                                }
                                if (!existeMeta) {
                                  metasUsuario.add(MetaUsuario(
                                      metaID: m.id,
                                      userID: UserDatabaseService.uid,
                                      meta: m));
                                }
                              }
                              return ListView.builder(
                                itemCount: metas.length,
                                itemBuilder: (context, index) {
                                  return selecionarMeta(
                                      metasUsuario[index], context, 1.0);
                                },
                              );
                            } else {
                              return Center(child: CircularProgressIndicator());
                            }
                          });
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

// Botão da meta
  Widget selecionarMeta(MetaUsuario metaUsuario, context, double tempoFadeIn) {
    void realizouMeta() async {
      UserData userData = await UserDatabaseService().getUserData();
      userData.exp += metaUsuario.meta.exp;
      if (userData.exp >= userData.level * 200) {
        userData.level += 1;
      }

      if (metaUsuario.qntAtual == metaUsuario.qntTotal) {
        metaUsuario.qntTotal += 1;
      }
      metaUsuario.qntAtual += 1;

      if (metaUsuario.id == null) {
        MetaUsuarioDatabaseService().metaUsuarioCreate(metaUsuario);
      } else {
        MetaUsuarioDatabaseService().metaUsuarioUpdate(metaUsuario);
      }
      UserDatabaseService().updateUserData(userData);
    }

    return FadeIn(
      tempoFadeIn,
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
        child: OutlineButton(
          borderSide: BorderSide(color: Theme.of(context).primaryColor),
          onPressed: () async {
            // multiplier += 1;
            // print('Inicio $day');
            realizouMeta();
            // print('Após $day');
          },
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          child: ListTile(
            title: Text(
              metaUsuario.meta.nome,
              style: TextStyle(
                  color: Colors.lightGreen[900],
                  fontSize: 14.0,
                  letterSpacing: 1.0),
            ),
            subtitle: Text(
              '${metaUsuario.qntAtual} dia (recorde: ${metaUsuario.qntTotal} dias) - ${metaUsuario.meta.exp} exp',
              style: Theme.of(context).textTheme.bodyText1,
            ),
            //leading: Icon(Icons.delete),
            trailing: Icon(Icons.check),
          ),
        ),
      ),
    );
  }
}
