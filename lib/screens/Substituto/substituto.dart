import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './item_substituto.dart';

import 'item_comodos.dart';

class Substituto extends StatefulWidget {
  @override
  _SubstitutoState createState() => _SubstitutoState();
}

class _SubstitutoState extends State<Substituto> {
  var comodos = [
    {
      "nome": "Banheiro",
      "img": "banheiro.png",
    },
    {
      "nome": "Cozinha",
      "img": "cozinha.png",
    },
    {
      "nome": "Sala de Estar",
      "img": "sala.png",
    },
    {
      "nome": "Sala de Jantar",
      "img": "sala_de_jantar.png",
    },
    {
      "nome": "Quarto",
      "img": "quarto.png",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Substituto"),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: List.generate(comodos.length, (index) {
          return Card(
            margin: EdgeInsets.all(10),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            //color: Colors.grey[300],
            child: InkResponse(
              child: _cardComodo(comodos[index]["nome"], comodos[index]["img"]),
              onTap: () {
                //print(index);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        ((ItemComodos(comodo: comodos[index]))),
                  ),
                );
              },
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
              // side: BorderSide(
              //   width: 5,
              //   color: json[index]["ja_tem"] ? Colors.green : Colors.red,
              // ),
            ),
            elevation: 5,
          );
        }),
      ),
    );
  }

  Widget _cardComodo(nome, img) {
    return Container(
      child: Stack(
        alignment: Alignment.topLeft,
        children: <Widget>[
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              margin: EdgeInsets.only(right: 5.0, bottom: 5.0),
              // color: Colors.orange,
              child: Image(
                image: AssetImage('Assets/comodos/$img'),
                width: 180,
                height: 120,
                alignment: Alignment.bottomRight,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 10.0, top: 20.0),
            // color: Colors.blue,
            child: Text(
              "$nome",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.white70,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
      decoration: BoxDecoration(
        //color: Theme.of(context).primaryColor,
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.lightGreen, Colors.green]),
      ),
    );
  }
}
