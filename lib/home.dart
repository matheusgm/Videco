import 'package:flutter/material.dart';
import 'package:flutterapp/screens/Perfil/profile.dart';
import 'screens/Metas/metas.dart';
import 'screens/Substituto/substituto.dart';
import 'package:flutterapp/screens/Lugares/homeLugares.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        initialIndex: 2,
        length: 5,
        child: Scaffold(
          body: TabBarView(
            children: [
              Metas(),
              Substituto(),
              Profile(),
              MyHomePage(),
              Container(),
            ],
          ),
          bottomNavigationBar: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.list)),
              Tab(icon: Icon(Icons.autorenew)),
              Tab(icon: Icon(Icons.person)),
              Tab(icon: Icon(Icons.store)),
              Tab(icon: Icon(Icons.map)),
            ],
            labelColor: Colors.black,
            unselectedLabelColor: Colors.white,
            indicatorSize: TabBarIndicatorSize.label,
            indicatorPadding: EdgeInsets.all(8.0),
            indicatorColor: Colors.black,
          ),
          backgroundColor: Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}
