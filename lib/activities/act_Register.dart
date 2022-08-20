import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../components/comp_inputText.dart';
import '../models/mod_User.dart';
import '../services/UserService.dart';
import 'act_Login.dart';

class register extends StatefulWidget {
  const register({Key? key}) : super(key: key);
  @override
  _registerState createState() => _registerState();
}

class _registerState extends State<register> {
  TextEditingController nameController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  UserService userService = UserService();

  late User userRes;
  var logger = Logger(
    filter: null, // Use the default LogFilter (-> only log in debug mode)
    printer: PrettyPrinter(), // Use the PrettyPrinter to format and print log
    output: null, // Use the default LogOutput (-> send everything to console)
  );
  final _formkey = GlobalKey<FormState>();

  //Init state
  @override
  void initState() {
    super.initState();
  }

  // build
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          padding: const EdgeInsets.fromLTRB(10, 80, 10, 50),
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color.fromRGBO(24, 24, 36, 1.0),Color.fromRGBO(8, 13, 25, 1.0)],
            ),
          ),
            child: Form(
              key: _formkey,
              child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.fromLTRB(7, 0, 7, 30),
                      child: Image.asset('../assets/images/logoTakiChai.png', height: 200),
                    ),
                    inputText(
                      controller: nameController,
                      placeholder: "Nombre",
                      voidMessage: "Ingrese nombre solo con letras",
                      regexp: new RegExp(r'^[a-z A-Z]+$'),
                    ),
                    inputText(
                        controller: emailController,
                        placeholder: "Correo",
                        voidMessage: "Ingrese un email correcto",
                        regexp: new RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                    ),
                    inputText(
                        controller: passwordController,
                        placeholder: "Contraseña",
                        voidMessage: "Ingrese contraseña (mínimo 8 caracteres)",
                        regexp: new RegExp(r'.*'),
                        obscureText: true
                    ),
                    Container(
                        padding: EdgeInsets.all(7),
                        child: ElevatedButton(
                          style: raisedButtonStyle,
                          child: Text(
                            "Registrarse",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontFamily: 'Montserrat',
                            ),
                          ),
                        onPressed: ()
                       async {
                            try {
                              userRes = await userService.RegisterUser(
                                  nameController.text,
                                  emailController.text,
                                  passwordController.text,
                                  "");
                              SharedPreferences prefs = await SharedPreferences.getInstance();
                              logger.d("Debug log");
                              logger.d(prefs.getString('userID'));
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => login()),
                              );
                            }
                            catch (e) {
                              print(e);
                            }
                        },
                      )
                    ),
                    Container(
                        margin: EdgeInsets.only(top: 15),
                        padding: EdgeInsets.fromLTRB(0,10,0,10),
                        child: InkWell(
                          child: const Text('¿Ya tienes una cuenta?',style: TextStyle(color: Colors.white)),
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const login()),);
                          },
                        )
                    )
                  ],
              ),
            ),
        ),

    );
  }
  final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
    primary: Colors.black87,
    onPrimary: Colors.grey[300],
    padding: EdgeInsets.fromLTRB(40, 15, 40, 15),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(5)),
    ),
    side: BorderSide(width: 1.5, color: Color.fromRGBO(255, 255, 255, 0)),
  );
}