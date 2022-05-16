import 'package:flutter/material.dart';
import 'package:flutterapp/models/userData.dart';
import 'package:flutterapp/services/auth.dart';
import 'package:flutterapp/services/userDatabase.dart';
import 'package:flutterapp/screens/Perfil/fade.dart';
import 'package:flutterapp/screens/Perfil/grafico.dart';
import '../../design/bezier_curves.dart';

// Criando os dados para o gráfico

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<UserData>(
      stream: UserDatabaseService().userData,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          UserData userData = snapshot.data;
          UserData ud = new UserData();
          ud.nome = "Matheus";
          ud.dataNascimento = "01061997";
          ud.exp = 80;
          ud.level = 4;

          return ClipPath(
            child: Scaffold(
              body: _bodyProfile(ud),
            ),
            clipper: BottomWaveClipper2(),
          );
        } else {
          UserData ud = new UserData();
          ud.nome = "Matheus";
          ud.dataNascimento = "01061997";
          ud.exp = 80;
          ud.level = 4;
          return _bodyProfile(ud);
          // return Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  Widget _bodyProfile(UserData userData) {
    return Stack(
      children: <Widget>[
        ListView(
          padding: EdgeInsets.all(20.0),
          children: <Widget>[
            Column(
              children: <Widget>[
                // FadeIn(
                //   1,
                Center(
                  child: Text(
                    'Perfil',
                    style: Theme.of(context).textTheme.bodyText2.copyWith(
                          fontSize: 38.0,
                          letterSpacing: 2.0,
                        ),
                  ),
                ),
                // ),
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
                    SizedBox(height: 50, width: 30),
                  ],
                ),
              ],
            ),
          ],
        ),
        _caixa(userData),
        _bolinhas()
      ],
    );
  }

  Widget _subbolinhas() {
    return Container(
        height: 7,
        width: 7,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          shape: BoxShape.circle,
        ));
  }

  Widget _bolinhas() {
    double _screenHeigth = MediaQuery.of(context).size.height;
    return Positioned(
        top: _screenHeigth * 0.73,
        left: _screenHeigth * 0.319,
        child: Row(
          children: <Widget>[
            _subbolinhas(),
            SizedBox(
              width: 4,
            ),
            _subbolinhas(),
            SizedBox(
              width: 4,
            ),
            _subbolinhas()
          ],
        ));
  }

  Widget _subcaixa(entrada) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Theme.of(context).primaryColor.withOpacity(0.5),
        ),
        height: 200.0,
        width: 190.0,
        child: entrada,
      ),
    );
  }

  Widget _caixa(userdata) {
    double _screenHeigth = MediaQuery.of(context).size.height;
    return Positioned(
      height: _screenHeigth * 0.27,
      top: _screenHeigth * 0.45,
      left: _screenHeigth * 0.19,
      right: _screenHeigth * 0.04,
      child: PageView(
        physics: BouncingScrollPhysics(),
        children: <Widget>[
          _subcaixa(GraficoN(userdata)),
          _subcaixa(GraficoCO2(userdata)),
          _subcaixa(GraficoAGUA(userdata))
        ],
      ),
    );
  }

  Widget _circleAvatar() {
    return
        // FadeIn(
        //   2,
        Center(
      child: CircleAvatar(
        backgroundImage: AssetImage('assets/Perfil.jpeg'),
        radius: 70.0,
      ),
    );
    // );
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
    return textProfile(texto, Color.fromRGBO(0, 0, 0, 0.8),
        spacing: 2.0, size: 28.0);
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
