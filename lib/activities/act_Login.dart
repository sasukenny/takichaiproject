import 'package:flutter/material.dart';
import '../components/comp_inputText.dart';
import '../components/comp_buttonLogin.dart';
import '../util/mod_User.dart'; //modelo de la data de llegada


class login extends StatefulWidget {
  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<login> {

  late Future<User> futureUser;

  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();

  final _formkey = GlobalKey<FormState>();

  //Init state
  @override
  void initState() {
    super.initState();
  }

  //build
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
                                  controller: email,
                                  placeholder: "Correo",
                                  voidMessage: "Ingrese un email correcto",
                                  regexp: new RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              ),
                              inputText(
                                  controller: password,
                                  placeholder: "Contraseña",
                                  voidMessage: "Ingrese contraseña correcta",
                                  regexp: new RegExp(".*"),
                                  obscureText: true
                              ),
                              buttonLogin(
                                  user: User(
                                      name: "",
                                      password: password.text,
                                      email: email.text,
                                      description: ""
                                  ),
                                  formkey: _formkey,
                                  name: "Iniciar sesión"
                              ),
                            ]
                        )
                    ),
                  ),
                ]
            ),
          ]
      ),
    );
  }
}