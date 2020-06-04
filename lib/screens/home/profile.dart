import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  int videcolevel = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: Text('Videco ID Card'),
        centerTitle: true,
        elevation: 0.0,
      ),
      drawer: drawerWidget(),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            videcolevel += 1;
          });
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.grey[800],
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(30.0,40.0,30.0,0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: CircleAvatar(
                backgroundImage: AssetImage('Assets/Perfil.jpeg'),
                radius: 50.0,
              ),
            ),
            Divider(
              height: 60.0,
              color: Colors.grey[900],
            ),
            textProfile('NAME',Colors.grey[750],spacing:2.0),

            SizedBox(height: 10.0),
            textProfile('Paulo Bessa',Colors.green,spacing:2.0,size: 28.0),

            SizedBox(height: 30.0),
            textProfile('CURRENT VIDECO LEVEL',Colors.grey[750],spacing:2.0),
            
            SizedBox(height: 10.0),
            textProfile('$videcolevel',Colors.green,spacing:2.0,size:28.0),
            
            SizedBox(height: 30.0),
            Row(
              children: <Widget>[
                Icon(
                    Icons.email,
                    color: Colors.grey[600]
                ),
                SizedBox(width: 10.0,),
                textProfile('paulobessamonteiro@gmail.com',Colors.grey[600],size:18.0),
                
              ],
            ),
            
          ],
        ),
      ),
    );
  }

  Widget textProfile(texto, color, {spacing = 1.0, size = 14.0, FontWeight weight = FontWeight.normal}){
    return Text(
      texto,
      style: TextStyle(
        color: color,
        letterSpacing: spacing,
        fontSize: size,
        fontWeight: weight,
      ),
    );
  }

  Widget drawerWidget(){
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.lightGreen[700],
            ),
            child: Text(
              'Drawer Header',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          tileProfile('Messages', Icons.message, (){}),
          tileProfile('Profile', Icons.account_circle, (){Navigator.pop(context);}),
          tileProfile('Settings', Icons.settings,(){})
        ],
      ),
    );
  }

  Widget tileProfile(title, icon, onClick){
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: onClick,
    );
  }

}
