import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import './item_substituto.dart';
import '../../design/bezier_curves.dart';

class ItemComodos extends StatefulWidget {
  final comodo;
  ItemComodos({@required this.comodo});
  @override
  _ItemComodosState createState() => _ItemComodosState();
}

class _ItemComodosState extends State<ItemComodos> {
  var comodo;

  @override
  void initState() {
    super.initState();
    comodo = widget.comodo;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Comodo"),
      ),
      body: Column(
        children: <Widget>[
          Stack(
            alignment: Alignment.bottomLeft,
            children: <Widget>[
              Container(
                child: ClipPath(
                  child: Container(
                    padding: EdgeInsets.all(10.0),
                    width: double.infinity,
                    height: 200,
                    decoration: BoxDecoration(
                      //color: Theme.of(context).primaryColor,
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.lightGreen, Colors.green],
                      ),
                    ),
                    // child: Image.asset(
                    //   'assets/comodos/${comodo["img"]}',
                    //   width: 150,
                    //   height: 150,
                    //   alignment: Alignment.topRight,
                    // ),
                  ),
                  clipper: BottomWaveClipper1(),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 65, bottom: 5),
                // color: Colors.brown,
                child: Text(
                  "${comodo["nome"]}",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                    letterSpacing: 1.5,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: FutureBuilder(
              future: Firestore.instance
                  .collection("produtos_substitutos")
                  .where("comodoID", isEqualTo: comodo.documentID)
                  .orderBy("nome", descending: false)
                  .getDocuments(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                } else {
                  var produtos = snapshot.data.documents;
                  return ListView.separated(
                    itemCount: produtos.length,
                    separatorBuilder: (BuildContext ctxt, int index) =>
                        Divider(),
                    itemBuilder: (BuildContext ctxt, int index) {
                      return _listItemComodo(produtos[index]);
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _listItemComodo(produto) {
    return ListTile(
      title: Text("${produto["nome"]}"),
      subtitle: Text("Subtitulo"),
      trailing: Icon(Icons.chevron_right),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ((ItemSubstituto(
              produto: produto,
            ))),
          ),
        );
      },
    );
  }
}
