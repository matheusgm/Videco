import 'package:flutter/material.dart';
import 'package:flutterapp/screens/cadastro.dart';
import 'package:flutterapp/screens/character.dart';
import 'package:flutterapp/services/auth.dart';
import 'package:flutterapp/widgetsReutilizados.dart';
import 'package:flutterapp/screens/loading.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  bool loading = false;
  String erroLogin = "";

  // text field controller
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
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
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    _avatarLogin(),
                    SizedBox(height: 20),
                    textFormWidget(
                      "E-mail",
                      TextInputType.emailAddress,
                      emailController,
                      Icons.email,
                      (val) =>
                          textFormValidatorFunction(val, "Email invalido!"),
                    ),
                    SizedBox(height: 10),
                    textFormWidget(
                        "Senha",
                        TextInputType.text,
                        passwordController,
                        Icons.lock,
                        (val) =>
                            textFormValidatorFunction(val, "Senha invalida!"),
                        obscureText: true),
                    containerButton("Recuperar Senha", TextAlign.right, () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Character()));
                    }, alignment: Alignment.centerRight),
                    SizedBox(height: 40),
                    _loginButton("Login", () => submitLoginButton()),
                    Text(
                      erroLogin,
                      style: TextStyle(color: Colors.red, fontSize: 12),
                    ),
                    SizedBox(height: 10),
                    containerButton("Sign-up", TextAlign.center, () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Cadastro()));
                    }),
                  ],
                ),
              ))
        ],
      ),
    );
  }

  void submitLoginButton() async {
    if (_formKey.currentState.validate()) {
      setState(() => loading = true);
      dynamic result = await AuthService().signInWithEmailAndPassword(
          emailController.text.trim(), passwordController.text.trim());
      if (result == null) {
        print("Error ao fazer Login!");
        setState(() => {
              loading = false,
              erroLogin = "Erro ao realizar Login. Tente novamente!"
            });
      }
    }
  }

  String textFormValidatorFunction(val, nome) {
    if (val.isEmpty) {
      return nome;
    } else {
      return null;
    }
  }

  Widget _avatarLogin() {
    return SizedBox(
      width: 128,
      height: 128,
      child: CircleAvatar(
        backgroundImage: AssetImage('assets/Light.jpg'),
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

  Widget textFormWidget(text, textInputType, controller, icon, validator,
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
      validator: validator,
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
