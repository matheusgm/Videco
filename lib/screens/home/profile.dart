import 'package:flutter/material.dart';
import 'package:flutterapp/models/user.dart';
import 'package:flutterapp/models/userData.dart';
import 'package:flutterapp/screens/loading.dart';
import 'package:flutterapp/services/auth.dart';
import 'package:flutterapp/services/database.dart';
import 'package:provider/provider.dart';
import '../../widgetsReutilizados.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final AuthService _auth = AuthService();

  int videcolevel = 0;

  @override
  Widget build(BuildContext context) {
    User user = Provider.of<User>(context);
    //print("Email: ${user.email}");
    return StreamBuilder<UserData>(
        stream: DatabaseService(uid: user.uid).userData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            UserData userData = snapshot.data;
            //print(userData.nome + " - " + userData.dataNascimento);
            return Scaffold(
              appBar: WidgetsReutilizados.openAppBar("Videco ID Card"),
              drawer: drawerWidget(),
              floatingActionButton: _floatingActionButton(),
              body: _bodyProfile(user, userData),
            );
          } else {
            return Loading();
          }
        });
  }

  Widget _bodyProfile(User user, UserData userData) {
    return ListView(
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _circleAvatar(),
              Divider(
                height: 60.0,
                color: Colors.grey[900],
              ),
              textTituloProfile('NAME'),
              SizedBox(height: 10.0),
              textInfoProfile(userData.nome),
              SizedBox(height: 30.0),
              textTituloProfile('CURRENT VIDECO LEVEL'),
              SizedBox(height: 10.0),
              textInfoProfile('$videcolevel'),
              SizedBox(height: 30.0),
              Row(
                children: <Widget>[
                  Icon(Icons.email, color: Colors.grey[600]),
                  SizedBox(
                    width: 10.0,
                  ),
                  textProfile(user.email, Colors.grey[600], size: 18.0),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _circleAvatar() {
    return Center(
      child: CircleAvatar(
        backgroundImage: AssetImage('Assets/Perfil.jpeg'),
        radius: 50.0,
      ),
    );
  }

  Widget _floatingActionButton() {
    return FloatingActionButton(
      onPressed: () {
        setState(() {
          videcolevel += 1;
        });
      },
      child: Icon(Icons.add),
      backgroundColor: Colors.grey[800],
    );
  }

  Widget textProfile(texto, color, {spacing = 1.0, size = 14.0}) {
    return Text(
      texto,
      style: TextStyle(
        color: color,
        letterSpacing: spacing,
        fontSize: size,
      ),
    );
  }

  Widget textTituloProfile(texto) {
    return textProfile(texto, Colors.grey[750], spacing: 2.0);
  }

  Widget textInfoProfile(texto) {
    return textProfile(texto, Colors.green, spacing: 2.0, size: 28.0);
  }

  Widget drawerWidget() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
            ),
            child: Text(
              'Drawer Header',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          tileProfile('Messages', Icons.message, () {}),
          tileProfile('Profile', Icons.account_circle, () {
            Navigator.pop(context);
          }),
          tileProfile('Settings', Icons.settings, () {}),
          tileProfile('Logout', Icons.exit_to_app, () async {
            await _auth.signOut();
          })
        ],
      ),
    );
  }

  Widget tileProfile(title, icon, onClick) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: onClick,
    );
  }
}
