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
        backgroundColor: Colors.lightGreen,
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
            Text(
              'NAME',
              style: TextStyle(
                color: Colors.grey[750],
                letterSpacing: 2.0,
                fontFamily: 'Lato',
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              'Paulo Bessa',
              style: TextStyle(
                  color: Colors.green,
                  letterSpacing: 2.0,
                  fontFamily: 'Lato',
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(height: 30.0),
            Text(
              'CURRENT VIDECO LEVEL',
              style: TextStyle(
                color: Colors.grey[750],
                letterSpacing: 2.0,
                fontFamily: 'Lato',
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              '$videcolevel',
              style: TextStyle(
                  color: Colors.green,
                  letterSpacing: 2.0,
                  fontFamily: 'Lato',
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(height: 30.0),
            Row(
              children: <Widget>[
                Icon(
                    Icons.email,
                    color: Colors.grey[600]
                ),
                SizedBox(width: 10.0,),
                Text(
                  'paulobessamonteiro@gmail.com',
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 18.0,
                    letterSpacing: 1.0,
                  ),
                ),
              ],
            ),
          ],
        ),
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
          ListTile(
            leading: Icon(Icons.message),
            title: Text('Messages'),
          ),
          ListTile(
            leading: Icon(Icons.account_circle),
            title: Text('Profile'),
            onTap: () {
              Navigator.pop(context);
            },

          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
          ),
        ],
      ),
    );
  }

}
