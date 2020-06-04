import 'package:flutter/material.dart';
import 'package:flutterapp/models/user.dart';
import '../../widgetsReutilizados.dart';
import './../../services/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Cadastro extends StatefulWidget {
  @override
  _CadastroState createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  // text field controller
  final nomeController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final dataNascimentoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WidgetsReutilizados.openAppBar("Videco"),
      body: _bodyCadastro(),
    );
  }

  Widget _bodyCadastro() {
    return ListView(
      children: [
        Padding(
          padding: EdgeInsets.all(30),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                _textInputCadastro("Nome", "", Icons.person, nomeController),
                _textInputCadastro("Email", "example@example.com", Icons.email,
                    emailController),
                _textInputCadastro("Senha", "", Icons.lock, passwordController,
                    obscureText: true),
                _textInputCadastro("Data de Nascimento", "00/00/0000",
                    Icons.date_range, dataNascimentoController),
                SizedBox(
                  height: 40,
                ),
                _buttonCadastro("Cadastrar", () async {
                  if (_formKey.currentState.validate()) {
                    dynamic result = await _auth.registerWithEmailAndPassword(
                        emailController.text.trim(),
                        passwordController.text.trim());
                    if (result == null) {
                      print("Error ao cadastrar!");
                    } else {
                      User user = result;
                      user.nome = nomeController.text;
                      user.email = emailController.text;
                      user.password = passwordController.text;
                      user.dataNascimento = dataNascimentoController.text;
                      await Firestore.instance
                          .collection('usuarios')
                          .document(user.uid)
                          .setData(user.toJson());
                      Navigator.pushNamed(context, "/");
                    }
                  } else {
                    print("form key erro");
                  }
                })
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget _textInputCadastro(label, hintText, icon, TextEditingController controller,
      {obscureText = false}) {
    return TextField(
      decoration: InputDecoration(
          labelText: label, hintText: hintText, icon: Icon(icon)),
      obscureText: obscureText,
      cursorColor: Theme.of(context).primaryColor,
      controller: controller,
    );
  }

  Widget _buttonCadastro(texto, onPressed) {
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
}
