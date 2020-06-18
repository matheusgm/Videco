import 'package:flutter/material.dart';
import 'package:flutterapp/models/userData.dart';
import 'package:flutterapp/services/database.dart';
import 'package:flutterapp/screens/Perfil/fade.dart';
import 'package:flutterapp/screens/Perfil/grafico.dart';

// Criando os dados para o gráfico

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<UserData>(
      stream: DatabaseService().userData,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          UserData userData = snapshot.data;
          return Scaffold(
            body: _bodyProfile(userData),
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  Widget _bodyProfile(UserData userData) {
    return ListView(
      padding: EdgeInsets.all(20.0),
      children: <Widget>[
        Column(
          children: <Widget>[
            FadeIn(
              1,
              Center(
                child: Text(
                  'Perfil',
                  style: TextStyle(
                    fontSize: 38.0,
                    letterSpacing: 2.0,
                    color: Colors.lightGreen[700],
                  ),
                ),
              ),
            ),
            SizedBox(height: 30.0),
            _circleAvatar(),
            Divider(height: 60.0, color: Colors.grey[900]),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    textTituloProfile('NOME'),
                    SizedBox(height: 10.0),
                    textInfoProfile(userData.nome),
                    SizedBox(height: 30.0),
                    textTituloProfile('NÍVEL'),
                    SizedBox(height: 10.0),
                    textInfoProfile(userData.level.toString()),
                    SizedBox(height: 30.0),
                    textTituloProfile('EXPERIÊNCIA'),
                    SizedBox(height: 10.0),
                    textInfoProfile(userData.exp.toString()),
                    SizedBox(height: 30.0),
                  ],
                ),
                SizedBox(height: 50, width: 70),
                Column(
                  children: <Widget>[
                    Text('Até o próximo nível'),
                    GraficoN(userData),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text("Volume de CO2 salvo"),
                Text("Água salva"),
              ],
            ),
            Row(
              children: <Widget>[
                SizedBox(width: 20),
                GraficoCO2(userData),
                GraficoAGUA(userData),
              ],
            )
          ],
        ),
      ],
    );
  }

  Widget _circleAvatar() {
    return FadeIn(
      2,
      Center(
        child: CircleAvatar(
          backgroundImage: AssetImage('assets/Perfil.jpeg'),
          radius: 70.0,
        ),
      ),
    );
  }

  Widget textProfile(texto, color, {spacing = 1.0, size = 14.0}) {
    return Text(
      texto,
      style: Theme.of(context)
          .textTheme
          .bodyText1
          .copyWith(fontSize: size, letterSpacing: spacing, color: color),
    );
  }

  Widget textTituloProfile(texto) {
    return textProfile(texto, Colors.grey[750], spacing: 2.0);
  }

  Widget textInfoProfile(texto) {
    return textProfile(texto, Colors.green, spacing: 2.0, size: 28.0);
  }

  Widget tileProfile(title, icon, onClick) {
    return ListTile(
      leading: Icon(icon),
      title: Text(
        title,
        style: Theme.of(context).textTheme.bodyText1,
      ),
      onTap: onClick,
    );
  }
}
