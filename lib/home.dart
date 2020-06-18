import 'package:flutter/material.dart';
import 'package:flutterapp/screens/Perfil/profile.dart';
import 'screens/Metas/meta.dart';
import 'screens/Substituto/substituto.dart';

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
              Text("4"),
              Text("5"),
            ],
          ),
          bottomNavigationBar: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.list)),
              Tab(icon: Icon(Icons.autorenew)),
              Tab(icon: Icon(Icons.person)),
              Tab(icon: Icon(Icons.store)),
              Tab(icon: Icon(Icons.settings)),
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
