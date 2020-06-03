import 'package:flutter/material.dart';

class Cadastro extends StatefulWidget {
  @override
  _CadastroState createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {

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
        fontFamily: 'Lato',
        letterSpacing: 2.0,
      ),
      ),
      centerTitle: true,
      backgroundColor: Colors.lightGreen[700],
      automaticallyImplyLeading: false,
    );
  }

  Widget _construirBody(){
    return ListView(
      children: [
        Padding(
            padding: EdgeInsets.all(30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[

                _textInputHome("Nome","",Icons.person),
                _textInputHome("Email","example@example.com",Icons.email),
                _textInputHome("Senha","",Icons.lock,obscureText:true),
                _textInputHome("CPF","000.000.000-00",Icons.format_list_numbered),
                _textInputHome("Data de Nascimento","00/00/0000",Icons.date_range),

                SizedBox(
                    height: 40,
                ),

                _buttonCadastro("Cadastrar",() {})

              ],
            ),
          )
      ],
    );
  }

  Widget _textInputHome(label,hintText,icon,{obscureText=false}){
    return TextField(
            decoration: InputDecoration(
              labelText: label,
              hintText: hintText,
              icon: Icon(icon)
            ),
            obscureText: obscureText,
            cursorColor: Colors.lightGreen[700],
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


