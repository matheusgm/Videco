import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ItemSubstituto extends StatefulWidget {
  ItemSubstituto({this.json});
  final json;
  @override
  _ItemSubstitutoState createState() => _ItemSubstitutoState(this.json);
}

class _ItemSubstitutoState extends State<ItemSubstituto> {
  _ItemSubstitutoState(this.json);
  var json;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.lightGreen[200],
      appBar: AppBar(
        title: Text(json["nome"]),
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: 200,
            // color: Colors.purple,
            child: cardItem(json["img"], json["descricao"]),
          ),
          Expanded(
            child: ListView.separated(
              //padding: EdgeInsets.all(20.0),
              itemCount: 10,
              separatorBuilder: (context, index) => Divider(height: 0.0),
              itemBuilder: (BuildContext ctxt, int index) {
                return Container(
                  margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: ExpansionTile(
                    title: Text(
                      "Titulo",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    subtitle: _subtitleItem(),
                    children: <Widget>[
                      _impactoPositivoItens(json["descricao"])
                    ],
                    //backgroundColor: Colors.green[100],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _impactoPositivoItens(descricaoPositiva) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Text(descricaoPositiva),
    );
  }

  Widget _subtitleItem() {
    return Row(
      children: <Widget>[
        Column(
          children: <Widget>[
            ratingBar(Icons.spa, Colors.green[600], 3.0),
            Text(
              "Impacto Positivo",
              style: TextStyle(fontSize: 10, color: Colors.grey),
            ),
          ],
        ),
        SizedBox(width: 20.0),
        Column(
          children: <Widget>[
            ratingBar(Icons.attach_money, Colors.yellow[600], 4.5),
            Text(
              "Custo",
              style: TextStyle(fontSize: 10, color: Colors.grey),
            ),
          ],
        ),
      ],
    );
  }

  Widget ratingBar(icon, color, rating) {
    return RatingBarIndicator(
      rating: rating,
      itemBuilder: (context, index) => Icon(
        icon,
        color: color,
      ),
      itemCount: 5,
      itemSize: 20.0,
      direction: Axis.horizontal,
    );
  }

  Widget cardItem(img, descricaoNegativa) {
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Container(
        // color: Colors.lightGreen,
        child: Row(
          children: <Widget>[
            Container(
              // color: Colors.red,
              margin: EdgeInsets.only(left: 10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image(
                    image: AssetImage('Assets/comodos/$img'),
                    width: 130,
                    height: 130,
                  )
                ],
              ),
            ),
            _impactoNegativoItens(descricaoNegativa),
          ],
        ),
        decoration: BoxDecoration(
          //color: Theme.of(context).primaryColor,
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.lightGreen, Colors.green]),
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 5,
      margin: EdgeInsets.all(10.0),
    );
  }

  Widget _impactoNegativoItens(descricaoNegativa) {
    return Expanded(
      child: Container(
        // color: Colors.yellow,
        margin:
            EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0, bottom: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Impacto Negativo:",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text(
              descricaoNegativa,
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
    );
  }
}
