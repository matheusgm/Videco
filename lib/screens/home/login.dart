import 'package:flutter/material.dart';
import 'package:flutterapp/models/user.dart';
import 'package:flutterapp/services/auth.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final AuthService _auth = AuthService();

  final emailController= TextEditingController();
  final passwordController= TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: openAppBar(),
      body: Container(
        color: Colors.grey[300],
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
                  textFormWidget("E-mail",TextInputType.emailAddress,emailController),
                  SizedBox(
                    height: 10,
                  ),
                  textFormWidget("Senha",TextInputType.text,passwordController, obscureText:true),
                  
                  containerButton("Recuperar Senha",TextAlign.right,(){Navigator.pushNamed(context, "/character");},alignment: Alignment.centerRight),

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
                      child: _loginButton(),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  containerButton("Sign-up",TextAlign.center,(){Navigator.pushNamed(context, "/cadastro");}),
                  
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
        letterSpacing: 2.0,
      ),
      ),
      centerTitle: true,
      automaticallyImplyLeading: false,
    );
  }

  Widget _loginButton(){
    return FlatButton(
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
              child: CircleAvatar(
                backgroundImage: AssetImage('Assets/Hardcore.jpg'),
                radius: 50.0,
              ),
              height: 28,
              width: 28,
            ),
          )
        ],
      ),
      onPressed: () async {
        dynamic result = await _auth.signInWithEmailAndPassword(emailController.text.trim(), passwordController.text.trim());
        if(result == null) {
          print("Error ao fazer Login!");
        }else{
          User user = result;
          Navigator.pushNamed(context, "/profile");
        }
        
      },
    );
  }

  Widget textFormWidget(text, textInputType,controller,{obscureText = false}){
    return TextFormField(
      // autofocus: true,
      controller: controller,
      keyboardType: textInputType,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: text,
        labelStyle: TextStyle(
          color: Colors.black38,
          fontWeight: FontWeight.w400,
          fontSize: 20,
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

