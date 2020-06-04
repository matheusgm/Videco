import 'package:flutter/material.dart';
import 'package:flutterapp/models/user.dart';
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
  final emailController= TextEditingController();
  final passwordController= TextEditingController();
  final dataNascimentoController= TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _construirAppBar(),
      body: _construirBody(),
      backgroundColor: Colors.grey[300],
    );
  }

  Widget _construirAppBar(){
    return AppBar(
      title: Text('Videco',
      style: TextStyle(
        fontSize: 24.0,
        letterSpacing: 2.0,
      ),
      ),
      centerTitle: true,
      automaticallyImplyLeading: false,
    );
  }

  Widget _construirBody(){
    return ListView(
      children: [
        Padding(
            padding: EdgeInsets.all(30),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[

                  _textInputHome("Nome","",Icons.person,nomeController),
                  _textInputHome("Email","example@example.com",Icons.email,emailController),
                  _textInputHome("Senha","",Icons.lock,passwordController,obscureText:true),
                  _textInputHome("Data de Nascimento","00/00/0000",Icons.date_range,dataNascimentoController),

                  SizedBox(
                      height: 40,
                  ),

                  _buttonCadastro("Cadastrar",() async {
                    if(_formKey.currentState.validate()){
                      dynamic result = await _auth.registerWithEmailAndPassword(emailController.text.trim(), passwordController.text.trim());
                      if(result == null) {
                        print("Error ao cadastrar!");
                      }else{
                        User user = result;
                        user.nome = nomeController.text;
                        user.email = emailController.text;
                        user.password = passwordController.text;
                        user.dataNascimento = dataNascimentoController.text;
                        await Firestore.instance.collection('usuarios').document(user.uid).setData(user.toJson());
                        Navigator.pushNamed(context, "/");
                      }
                    }else{
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

  Widget _textInputHome(label,hintText,icon,TextEditingController controller,{obscureText=false}){
    return TextField(
            decoration: InputDecoration(
              labelText: label,
              hintText: hintText,
              icon: Icon(icon)
            ),
            obscureText: obscureText,
            cursorColor: Colors.lightGreen[700],
            controller: controller,
          );
  }

  Widget _buttonCadastro(texto,onClick){
    return  Container(
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
                onPressed: onClick,
              ),
            ),
          );
  }

}


