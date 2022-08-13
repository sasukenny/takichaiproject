import 'package:flutter/material.dart';
import 'package:takichaiproject/activities/act_mySongs.dart';
import 'package:takichaiproject/services/UserService.dart';
import '../components/comp_inputText.dart';
import '../models/mod_Song.dart';
import '../services/SongService.dart';

class newSong extends StatefulWidget {
  const newSong({Key? key}) : super(key: key);
  @override
  _newSongState createState() => _newSongState();
}

class _newSongState extends State<newSong> {
  //Campos al registrar una canción
  TextEditingController nameController = TextEditingController();
  TextEditingController genreController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController languageController = TextEditingController();
  TextEditingController imageUrlController = TextEditingController();
  TextEditingController instrumentalController = TextEditingController();
  TextEditingController moodController = TextEditingController();
  SongService songService = SongService();

  late Future<Song> songRes;


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
                                  controller: nameController,
                                  placeholder: "Nombre",
                                  voidMessage: "Ingrese nombre",
                                  regexp: RegExp(r'.*'),
                                ),
                                inputText(
                                    controller: genreController,
                                    placeholder: "Género",
                                    voidMessage: "Ingrese un email correcto",
                                    regexp: RegExp(r'.*')
                                ),
                                inputText(
                                    controller: descriptionController,
                                    placeholder: "Description",
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
                                      {
                                        songService.NewSong(
                                          nameController.text,
                                          genreController.text,
                                          descriptionController.text);

                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) => MySongs()),
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
                                        Navigator.push(context, MaterialPageRoute(builder: (context) => const MySongs()),);
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