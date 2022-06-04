import 'package:flutter/material.dart';

class act_Login extends StatefulWidget {
  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<act_Login> {
  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();

  final _formkey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
      child: Column(
          children:<Widget> [
            Container(
              margin: EdgeInsets.only(top: 50, left: 20, right: 20, bottom: 50),
              child: Center(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('../assets/music.jpg', height: 200),
                        Container(
                          margin: EdgeInsets.fromLTRB(50,50,50,50),
                          padding: EdgeInsets.fromLTRB(50,0,50,0),
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(245, 245, 245, 1),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: TextFormField(
                              decoration: InputDecoration(
                                hintText: "Correo",
                              ),
                              validator:(value) {
                                if(value!.isEmpty)
                                {
                                  return 'Ingrese el email';
                                }
                              }
                          ),
                        ),

                        Container(
                          margin: EdgeInsets.fromLTRB(50,0,50,0),
                          padding: EdgeInsets.fromLTRB(50,0,50,0),
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(245, 245, 245, 1),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: TextFormField(
                              obscureText: true,
                              decoration: InputDecoration(
                                hintText: "Contraseña",
                              ),
                              validator:(value) {
                                if(value!.isEmpty)
                                {
                                  return 'Ingrese la contraseña';
                                }
                              }
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 70),
                          decoration: BoxDecoration(
                            color: Colors.black54,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          padding: EdgeInsets.fromLTRB(60,0,60,0),
                          child: Button(),
                        ),
                      ]
                  )
              ),
            ),
          ]
      ),
    );
  }


  Widget Button(){
    return FlatButton(
      child: Text(
        'Iniciar sesión',
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontFamily: 'Montserrat',
        ),
      ),
      onPressed: ()
      {
        if(_formkey.currentState!.validate())
        {
          Scaffold.of(context).showSnackBar(
              SnackBar(content:Text("Accesando al Sistema"))
          );
        }
      },
    );
  }
}