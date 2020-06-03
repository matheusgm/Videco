import 'package:flutter/material.dart';

class Opening extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: openAppBar(),
      body: Container(
        color: Colors.grey[400],
        child: ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 60, left: 30, right: 30),
              child: Column(
                children: [
                  SizedBox(
                    width: 128,
                    height: 128,
                    child:  CircleAvatar(
                      backgroundImage: AssetImage('Assets/Light.jpg'),
                      radius: 50.0,
                    ),
                    //Image.asset('Assets/Light.jpg')

                  ),
                  SizedBox(
                    height: 20,
                  ),
                  textFormWidget("E-mail",TextInputType.emailAddress),
                  SizedBox(
                    height: 10,
                  ),
                  textFormWidget("Senha",TextInputType.text, obscureText:true),
                  
                  containerButton("Recuperar Senha",TextAlign.right,(){Navigator.pushNamed(context, "/wrap");},alignment: Alignment.centerRight),

                  SizedBox(
                    height: 40,
                  ),
                  Container(
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
                              "Login",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 20,
                              ),
                              textAlign: TextAlign.left,
                            ),
                            Container(
                              child: SizedBox(
                                child: Image.asset("Assets/Hardcore.jpg"),
                                height: 28,
                                width: 28,
                              ),
                            )
                          ],
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, "/profile");
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  containerButton("Sign-up",TextAlign.center,(){Navigator.pushNamed(context, "/character");}),
                  
                ]
              ,),
            )
          ],
        ),
      ),
    );
  }

  Widget openAppBar(){
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

  Widget textFormWidget(text, textInputType,{obscureText = false}){
    return TextFormField(
      // autofocus: true,
      keyboardType: textInputType,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: text,
        labelStyle: TextStyle(
          color: Colors.black38,
          fontWeight: FontWeight.w400,
          fontSize: 20,
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.lightGreen[700]),
        ),
      ),
      style: TextStyle(fontSize: 20),
      cursorColor: Colors.lightGreen[700],
    );
  }

  Widget containerButton(texto,textAlign,onClick,{alignment = Alignment.center}){
    return Container(
      height: 40,
      alignment: alignment,
      child: FlatButton(
        child: Text(
          texto,
          textAlign: textAlign,
        ),
        onPressed: onClick,
      ),
    );
  }

}

