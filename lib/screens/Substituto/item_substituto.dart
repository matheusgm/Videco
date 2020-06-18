import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ItemSubstituto extends StatefulWidget {
  ItemSubstituto({this.produto});
  final produto;
  @override
  _ItemSubstitutoState createState() => _ItemSubstitutoState();
}

class _ItemSubstitutoState extends State<ItemSubstituto> {
  var produto;
  @override
  void initState() {
    super.initState();
    produto = widget.produto;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.lightGreen[200],
      appBar: AppBar(
        title: Text(produto["nome"]),
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: 200,
            // color: Colors.purple,
            child:
                cardItem("banheiro.png", produto["descricao_impacto_negativo"]),
          ),
          Expanded(
            child: ListView.separated(
              //padding: EdgeInsets.all(20.0),
              itemCount: produto["subprodutos"].length,
              separatorBuilder: (context, index) => Divider(height: 0.0),
              itemBuilder: (BuildContext ctxt, int index) {
                var subprodutos = produto["subprodutos"][index];
                return Container(
                  margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: ExpansionTile(
                    title: Text(
                      "${subprodutos["nome"]}",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    subtitle: _subtitleItem(subprodutos),
                    children: <Widget>[
                      _impactoPositivoItens(
                          subprodutos["descricao_impacto_positivo"])
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

  Widget _subtitleItem(subprodutos) {
    return Row(
      children: <Widget>[
        Column(
          children: <Widget>[
            ratingBar(Icons.spa, Colors.green[600],
                double.parse(subprodutos["valor_impacto_positivo"].toString())),
            Text(
              "Impacto Positivo",
              style: TextStyle(fontSize: 10, color: Colors.grey),
            ),
          ],
        ),
        SizedBox(width: 20.0),
        Column(
          children: <Widget>[
            ratingBar(Icons.attach_money, Colors.yellow[600],
                double.parse(subprodutos["valor_custo"].toString())),
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
                    image: AssetImage('assets/comodos/$img'),
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
