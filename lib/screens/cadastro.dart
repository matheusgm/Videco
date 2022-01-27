import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/models/userData.dart';
import 'package:flutterapp/widgetsReutilizados.dart';
import 'package:flutterapp/services/auth.dart';

import 'loading.dart';

class Cadastro extends StatefulWidget {
  @override
  _CadastroState createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  // text field controller
  final nomeController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final dataNascimentoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
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
                _textFormCadastro(
                  "Nome",
                  "",
                  Icons.person,
                  nomeController,
                  (val) {
                    return val.isEmpty ? "Nome invalido" : null;
                  },
                ),
                _textFormCadastro(
                  "Email",
                  "example@example.com",
                  Icons.email,
                  emailController,
                  (val) {
                    return val.isEmpty ? "Email invalido" : null;
                  },
                ),
                _textFormCadastro(
                  "Senha",
                  "",
                  Icons.lock,
                  passwordController,
                  (val) {
                    return val.isEmpty ? "Senha invalida" : null;
                  },
                  obscureText: true,
                ),
                _textFormCadastro(
                  "Data de Nascimento",
                  "00/00/0000",
                  Icons.date_range,
                  dataNascimentoController,
                  (val) {
                    return val.isEmpty ? "Data de Nascimento invalida" : null;
                  },
                ),
                SizedBox(height: 40),
                _buttonCadastro("Cadastrar", () => sumbitCadastroButton())
              ],
            ),
          ),
        )
      ],
    );
  }

  void sumbitCadastroButton() async {
    if (_formKey.currentState.validate()) {
      setState(() => loading = true);
      dynamic result = await AuthService().registerWithEmailAndPassword(
          emailController.text.trim(), passwordController.text.trim());
      if (result == null) {
        print("Error ao cadastrar!");
      } else {
        UserData userData = UserData(
            nome: nomeController.text,
            dataNascimento: dataNascimentoController.text);
        await FirebaseFirestore.instance
            .collection('usuarios')
            .doc(result.uid)
            .set(userData.toJson());
        Navigator.pop(context);
      }
    } else {
      print("form key erro");
    }
    setState(() => {loading = false});
  }

  Widget _textFormCadastro(
      label, hintText, icon, TextEditingController controller, validator,
      {obscureText = false}) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: label,
        hintText: hintText,
        icon: Icon(icon),
      ),
      obscureText: obscureText,
      cursorColor: Theme.of(context).primaryColor,
      controller: controller,
      validator: validator,
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
