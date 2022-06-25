import 'package:flutter/material.dart';

import '../components/comp_buttonLogin.dart';
import '../components/comp_inputText.dart';

class register extends StatefulWidget {
  const register({Key? key}) : super(key: key);
  @override
  _registerState createState() => _registerState();
}

class _registerState extends State<register> {
  TextEditingController name = new TextEditingController();
  TextEditingController phone = new TextEditingController();
  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();

  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
      child:
       Container(
        child: Scaffold(
          body: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 50, left: 20, right: 20, bottom: 50),
                  child: Center(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('../assets/images/logoTakiChai.png', height: 200),
                            inputText(
                                controller: name,
                                placeholder: "Nombre",
                                voidMessage: "Ingrese nombre solo con letras",
                                regexp: new RegExp(r'^[a-z A-Z]+$'),
                            ),
                            inputText(
                                controller: phone,
                                placeholder: "Celular",
                                voidMessage: "Ingrese número de celular correcto",
                                regexp: new RegExp(r'^[0-9]{9}$')
                            ),
                            inputText(
                                controller: email,
                                placeholder: "Correo",
                                voidMessage: "Ingrese un email correcto",
                                regexp: new RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            ),
                            inputText(
                                controller: password,
                                placeholder: "Contraseña",
                                voidMessage: "Ingrese contraseña (mínimo 8 caracteres)",
                                regexp: new RegExp(r"^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$"),
                                obscureText: true
                            ),
                            buttonLogin(
                                formkey: _formkey,
                                name: "Registrarse"
                            ),
                          ]
                      )
                  ),
                ),
              ]
          ),
        )
       )

    );
  }
}