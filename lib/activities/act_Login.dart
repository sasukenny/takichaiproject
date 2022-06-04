import 'package:flutter/material.dart';

class login extends StatefulWidget {
  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<login> {
  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        margin: EdgeInsets.only(top: 50, left: 20, right: 20, bottom: 50),
        child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Image.asset('../assets/music.jpg', height: 200), //cambia el nombre de tu imagen
            Container(
                margin: EdgeInsets.fromLTRB(50,50,50,50),
                padding: EdgeInsets.fromLTRB(50,0,50,0),
                decoration: BoxDecoration(
                  color: Color.fromRGBO(245, 245, 245, 1),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: TextEmail()
            ),
            Container(
                margin: EdgeInsets.fromLTRB(50,0,50,0),
                padding: EdgeInsets.fromLTRB(50,0,50,0),
                decoration: BoxDecoration(
                  color: Color.fromRGBO(245, 245, 245, 1),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: TextPassword()
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
            SizedBox(
              height: 50,
            ),
            Text("¿Nuevo usuario? Crea una cuenta !")
          ]),
        ),
      ),
    );
  }

  Widget TextEmail() {
    return TextField(
      controller: email,
      decoration: InputDecoration(
        hintText: "Correo",
      ),

    );
  }

  Widget TextPassword(){
    return TextField(
      controller: password,
      obscureText: true,
      decoration: InputDecoration(
          hintText: "Contraseña"
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
      onPressed: () {},
    );
  }
}