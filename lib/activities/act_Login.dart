import 'package:flutter/material.dart';
import '../components/comp_inputText.dart';
import '../components/comp_buttonLogin.dart';

class login extends StatefulWidget {
  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<login> {
  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();

  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
      child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 50, left: 20, right: 20, bottom: 50),
              child: Center(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('../assets/music.jpg', height: 200),
                        inputText(
                            controller: email,
                            placeholder: "Correo",
                            voidMessage: "Ingrese el email"
                        ),
                        inputText(
                            controller: password,
                            placeholder: "Contraseña",
                            voidMessage: "Ingrese la contraseña"
                        ),
                        buttonLogin(
                            formkey: _formkey,
                            name: "Iniciar sesión"
                        ),
                      ]
                  )
              ),
            ),
          ]
      ),
    );
  }
}