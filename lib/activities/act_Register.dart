import 'package:flutter/material.dart';
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
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  UserService userService = UserService();

  late User userRes;

  final _formkey = GlobalKey<FormState>();

  //Init state
  @override
  void initState() {
    super.initState();
  }

  // build
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
                                  controller: nameController,
                                  placeholder: "Nombre",
                                  voidMessage: "Ingrese nombre solo con letras",
                                  regexp: RegExp(r'^[a-z A-Z]+$'),
                                ),
                                inputText(
                                    controller: emailController,
                                    placeholder: "Correo",
                                    voidMessage: "Ingrese un email correcto",
                                    regexp: RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                ),
                                inputText(
                                    controller: passwordController,
                                    placeholder: "Contraseña",
                                    voidMessage: "Ingrese contraseña (mínimo 8 caracteres)",
                                    regexp: RegExp(r'.*'),
                                    obscureText: true
                                ),

                                ////////

                                Container(
                                  margin: EdgeInsets.only(top: 10),
                                  decoration: BoxDecoration(
                                    color: Colors.black54,
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  padding: EdgeInsets.fromLTRB(60,0,60,0),
                                  child: TextButton(
                                    child: const Text(
                                      "Registrarse",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontFamily: 'Montserrat',
                                      ),
                                    ),
                                    onPressed: ()
                                   async {
                                      userRes = await userService.RegisterUser(
                                          nameController.text,
                                          emailController.text,
                                          passwordController.text,
                                          "");

                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => login()),
                                      );
                                    },
                                  )
                                ),
                                Container(
                                    margin: EdgeInsets.only(top: 20),
                                    padding: EdgeInsets.fromLTRB(60,0,60,0),
                                    child: InkWell(
                                      child: const Text('¿Ya tienes una cuenta?'),
                                      onTap: () {
                                        Navigator.push(context, MaterialPageRoute(builder: (context) => const login()),);
                                      },
                                    )
                                )
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