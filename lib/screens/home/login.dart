import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/models/user.dart';
import 'package:flutterapp/services/auth.dart';

import '../../widgetsReutilizados.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

showAlertDialog(BuildContext context){
  AlertDialog alert=AlertDialog(
    content: new Row(
        children: [
           CircularProgressIndicator(),
           Container(margin: EdgeInsets.only(left: 5),child:Text("Loading" )),
        ],),
  );
  showDialog(barrierDismissible: false,
    context:context,
    builder:(BuildContext context){
      return alert;
    },
  );
}

class _LoginState extends State<Login> {
  final AuthService _auth = AuthService();

  // text field controller
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WidgetsReutilizados.openAppBar("Videco"),
      body: _bodyLogin(),
    );
  }

  Widget _bodyLogin() {
    return Container(
      child: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 60, left: 30, right: 30),
            child: Column(
              children: [
                _avatarLogin(),
                SizedBox(
                  height: 20,
                ),
                textFormWidget("E-mail", TextInputType.emailAddress,
                    emailController, Icons.email),
                SizedBox(
                  height: 10,
                ),
                textFormWidget(
                    "Senha", TextInputType.text, passwordController, Icons.lock,
                    obscureText: true),
                containerButton("Recuperar Senha", TextAlign.right, () {
                  Navigator.pushNamed(context, "/character");
                }, alignment: Alignment.centerRight),
                SizedBox(
                  height: 40,
                ),
                _loginButton("Login", () async {
                  showAlertDialog(context);
                  dynamic result = await _auth.signInWithEmailAndPassword(
                      emailController.text.trim(),
                      passwordController.text.trim());
                  if (result == null) {
                    print("Error ao fazer Login!");
                  } else {
                    User user = User(uid: result.uid);
                    await Firestore.instance
                        .collection('usuarios')
                        .document(user.uid)
                        .get()
                        .then((data) => {
                              if (data.exists) {user.fromJson(data.data)}
                            });
                    Navigator.pushNamed(context, "/profile", arguments: user);
                  }
                  /* User user = User();
                  user.nome = "teste";
                  user.email = "email teste";
                  user.dataNascimento = "data teste";
                  Navigator.pushNamed(context, "/profile", arguments: user); */
                }),
                SizedBox(
                  height: 10,
                ),
                containerButton("Sign-up", TextAlign.center, () {
                  Navigator.pushNamed(context, "/cadastro");
                }),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _avatarLogin() {
    return SizedBox(
      width: 128,
      height: 128,
      child: CircleAvatar(
        backgroundImage: AssetImage('Assets/Light.jpg'),
        radius: 50.0,
      ),
    );
  }

  Widget _loginButton(texto, onPressed) {
    return Container(
      height: 60,
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: [0.3, 1],
          colors: [
            Colors.lightGreen[800],
            Colors.lightGreen[600],
          ],
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(5),
        ),
      ),
      child: SizedBox.expand(
        child: FlatButton(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                texto,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 20,
                ),
                textAlign: TextAlign.left,
              ),
            ],
          ),
          onPressed: onPressed,
        ),
      ),
    );
  }

  Widget textFormWidget(text, textInputType, controller, icon,
      {obscureText = false}) {
    return TextFormField(
      // autofocus: true,
      controller: controller,
      keyboardType: textInputType,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: text,
        icon: Icon(icon),
      ),
      cursorColor: Colors.lightGreen[700],
    );
  }

  Widget containerButton(texto, textAlign, onClick,
      {alignment = Alignment.center}) {
    return Container(
      height: 40,
      alignment: alignment,
      child: FlatButton(
        child: Text(
          texto,
          textAlign: textAlign,
        ),
        onPressed: onClick,
      ),
    );
  }
}
