import 'package:flutter/material.dart';
import '../components/comp_inputText.dart';


class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);
  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<login> {


  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

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
                                  controller: emailController,
                                  placeholder: "Correo",
                                  voidMessage: "Ingrese un email correcto",
                                  regexp: new RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              ),
                              inputText(
                                  controller: passwordController,
                                  placeholder: "Contraseña",
                                  voidMessage: "Ingrese contraseña correcta",
                                  regexp: new RegExp(".*"),
                                  obscureText: true
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 10),
                                decoration: BoxDecoration(
                                  color: Colors.black54,
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                padding: EdgeInsets.fromLTRB(60,0,60,0),
                                child: FlatButton(
                                  child: Text(
                                    "Iniciar sesión",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontFamily: 'Montserrat',
                                    ),
                                  ),
                                  onPressed: ()
                                  async {
                                    print(_formkey.currentState.toString());
                                    if(_formkey.currentState!.validate())
                                    {
                                      final User userRes = await LoginUser(
                                          emailController.text,
                                          passwordController.text,
                                      );
                                      // print(userRes);
                                    }
                                  },
                                ),
                              )
                            ]
                        )
                    ),
                  ),
                ]
            ),
          ),
        )

    );
  }
}