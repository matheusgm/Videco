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
      backgroundColor: Colors.white,
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
                _textInputHome("CPF","000.000.000-00",Icons.format_list_numbered),
                _textInputHome("RG","00.000.000-0",Icons.format_list_numbered),
                _textInputHome("Data de Nascimento","00/00/0000",Icons.date_range),
                _textInputHome("Número da Certidão de Nascimento","",Icons.format_list_numbered),
                _textInputHome("Horário de Emissão","HH:mm",Icons.date_range),
                _textInputHome("Data de Emissão","00/00/0000",Icons.date_range),

                _buttonCadastro("Enviar Dados",() {})

              ],
            ),
          )
      ],
    );
  }

  Widget _textInputHome(label,hintText,icon){
    return TextField(
            decoration: InputDecoration(
              labelText: label,
              hintText: hintText,
              icon: Icon(icon)
            ),
          );
  }

  Widget _buttonCadastro(title,onPressed){
    return RaisedButton(
      onPressed: onPressed,
      child: Text(
        title,
        style: TextStyle(fontSize: 12)
      ),
    );
  }

}


