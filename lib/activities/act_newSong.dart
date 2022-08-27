import 'dart:convert';
import 'dart:io';

// import 'package:takichaiproject/activities/act_mySongs.dart';
// import 'package:takichaiproject/services/UserService.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:logger/logger.dart';
import 'package:open_file/open_file.dart';

import '../Wrapper/wrapper.dart';
// import '../components/comp_inputText.dart';
import '../models/mod_Song.dart';
import '../services/SongService.dart';

class newSong extends StatefulWidget {
  const newSong({Key? key}) : super(key: key);
  @override
  _newSongState createState() => _newSongState();
}

class _newSongState extends State<newSong> {

  //Variables
  String _name = "";
  String _description = "";
  String _language = "Español";
  String _mood = "Alegre";
  String _genre = "Huayno";
  String _songURL = "";
  String _imageURL = "";
  bool _instrumental = false;
  late File _song;
  late File _img;
  String _songBase64 = "";
  String _imgBase64 = "";

  var logger = Logger(
    filter: null, // Use the default LogFilter (-> only log in debug mode)
    printer: PrettyPrinter(), // Use the PrettyPrinter to format and print log
    output: null, // Use the default LogOutput (-> send everything to console)
  );
  late Future<Song> songRes;

  @protected
  @mustCallSuper
  initState() {
    logger.d("Inicando registro");
  }
  SubmitSong() async {
    SongService songService = SongService();
    await songService.NewSong("Kennecio", "rock", "description",_song,_imgBase64);
    logger.d("response: " );
  }
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();


  // TEXT FIELDS

  Widget _buildName(){
    return Container (
      margin: EdgeInsets.fromLTRB(50,0,50,20),
      padding: EdgeInsets.fromLTRB(50,0,50,0),
      decoration: BoxDecoration(
        color: Color.fromRGBO(245, 245, 245, 1),
        borderRadius: BorderRadius.circular(50),
      ),
        child: TextFormField(
          style: const TextStyle(
            color: Colors.white
          ),
          decoration: const InputDecoration(
            labelText: "Título",
            hintStyle: TextStyle(
              color: Colors.white
            ),
            fillColor: Colors.blue
          ),
          validator: (String? value){
            return (value == null) ? 'El título es obligatorio' : null;
          },
          onChanged: (String? value){
            _name = value!;
          },
        ),
    );
  }

  Widget _buildDescription(){
    return Container (
      margin: EdgeInsets.fromLTRB(50,0,50,20),
      padding: EdgeInsets.fromLTRB(50,0,50,0),
      decoration: BoxDecoration(
        color: Color.fromRGBO(245, 245, 245, 1),
        borderRadius: BorderRadius.circular(50),
      ),
      child: TextFormField(
        style: const TextStyle(
            color: Colors.white,

        ),
        decoration: const InputDecoration(
          labelText: "Descripción de la canción",
          fillColor: Colors.blue
        ),
        onChanged: (String? value){
          _description = value!;
        },
      ),
    );
  }

// DROPDOWNS
  Widget _buildLanguage(){
    return Container (
      margin: EdgeInsets.fromLTRB(35,0,35,20),
      padding: EdgeInsets.fromLTRB(50,0,25,0),
      decoration: BoxDecoration(
        color: Color.fromRGBO(245, 245, 245, 1),
        borderRadius: BorderRadius.circular(50),
      ),
      child:  DropdownButton(
        value: _language,
        items: <String>['Español', 'English', 'Quechua/RunaSimi', 'Aymara']
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        icon: const Icon(Icons.arrow_downward),
        style: const TextStyle(color: Colors.black),
        onChanged:(String? newValue){
          value:newValue;
          setState(() {
            _language = newValue!;
          });
        },
      ),
    );
  }

  Widget _buildMood(){
    return Container (
      margin: EdgeInsets.fromLTRB(35,0,35,20),
      padding: EdgeInsets.fromLTRB(50,0,25,0),
      decoration: BoxDecoration(
      color: Color.fromRGBO(245, 245, 245, 1),
      borderRadius: BorderRadius.circular(50),
      ),
      child:  DropdownButton(
          value: _mood,
          items: <String>['Alegre', 'Triste', 'Melancólico', 'Reflexivo']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          icon: const Icon(Icons.arrow_downward),
          style: const TextStyle(color: Colors.black),
          onChanged:(String? newValue){
            setState(() {
              _mood = newValue!;
            });
          },
        ),
    );
  }

  Widget _buildGenre(){
    return Container (
      margin: EdgeInsets.fromLTRB(35,0,35,20),
      padding: EdgeInsets.fromLTRB(50,0,25,0),
      decoration: BoxDecoration(
      color: Color.fromRGBO(245, 245, 245, 1),
      borderRadius: BorderRadius.circular(50),
      ),
      child:  DropdownButton(
          value: _genre,
          items: <String>['Huayno', 'Sikuri', 'Selvática', 'Cumbia', 'Afroperuana', 'Rock', 'Otro']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          icon: const Icon(Icons.arrow_downward),
          style: const TextStyle(color: Colors.black),
          onChanged:(String? newValue){
            setState(() {
              _genre = newValue!;
            });
          },
        ),
    );
  }


  Widget _buildSong(){
    return ElevatedButton(
      child: const Text("Agregue la canción"),
      onPressed: () async {
        final response = await FilePicker.platform.pickFiles();
        if(response == null){
          print("result null");
          return;
        }
        print("result song" );
        PlatformFile songFile = response.files.first;
        final File fileForFirebase = File(songFile.path!);
        _song = fileForFirebase;
        OpenFile.open(songFile.path!); //Para simulador movil cambiar bytes.toString() por path
        //OpenFile.open(songFile.bytes.toString());
        logger.d("werty");
        List<int> fileBytes = await fileForFirebase.readAsBytes();
        _songBase64 = base64Encode(fileBytes);
        logger.d(_songBase64);
        _songURL = songFile.path!; //Para simulador movil cambiar bytes.toString() por path
        //_songURL = songFile.bytes.toString()!; //Para simulador movil cambiar bytes.toString() por path

      },
    );
  }

    Widget _buildImage(){
    return ElevatedButton(
      child: const Text("Agregue la portada"),
      onPressed: () async {
        final response = await FilePicker.platform.pickFiles();
        if(response == null){
          return;
        }
        print("result img" );
        final imageFile = response.files.first;
        final File fileForFirebase = File(imageFile.path!);
        _img = fileForFirebase;
        OpenFile.open(imageFile.path!); //Para simulador movil cambiar bytes.toString() por path
        //OpenFile.open(imageFile.bytes.toString());

        _imageURL = imageFile.path!; //Para simulador movil cambiar bytes.toString() por path
        //_songURL = imageFile.bytes.toString()!; //Para simulador movil cambiar bytes.toString() por path
        logger.d("werty");
        List<int> fileBytes = await fileForFirebase.readAsBytes();
        _imgBase64 = base64Encode(fileBytes);
        logger.d(_imgBase64);
      },
    );
  }

  Widget _buildInstrumental(){
    return
      FlutterSwitch(
      width: 50.0,
      height: 25.0,
      valueFontSize: 25.0,
      toggleSize: 25.0,
      value: _instrumental,
      borderRadius: 10.0,
      padding: 8.0,
      showOnOff: true,
      onToggle: (val) {
        setState(() {
          _instrumental = val;
        });
      },
    );
  }

  Widget _buildSubmit(){
    return ElevatedButton(
        child: Text("Listo"),
        onPressed: (){
          print( "_name:" + _name );
          print("_description:" + _description);
          print("_language: " + _language);
          print("_mood: " +  _mood);
          print("_genre: " +  _genre);
          print("_songURL: " +  _songURL );
          print("_imageURL: " +  _imageURL);
          print("_instrumental: " + _instrumental.toString());
          SubmitSong();
        });
  }

  TextStyle labels = const TextStyle(
    color: Colors.white,
    fontSize: 16);

  @override
  Widget build(BuildContext context) {
    return Wrapper(activitieChild: elements(context));
  }

  Container elements(BuildContext context){
    return Container(
        padding: const EdgeInsets.fromLTRB(10, 80, 10, 10),
        height: MediaQuery.of(context).size.height,
        child:SingleChildScrollView(
          child:
          Form(
            key: _formkey,
            child:
            Column(
              children: [

                Text("Nombre de la canción", style: labels),
                Container(
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                        child: _buildName()
                ),

                Text("Descripción", style: labels),
                Container(
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                    child:_buildDescription()
                ),

                Text("Idioma", style: labels),
                Container(
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                    child: _buildLanguage(),
                ),

                Text("Ánimo", style: labels),
                Container(
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                    child: _buildMood(),
                ),

                Text("Género", style: labels),
                Container(
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                    child:_buildGenre(),
                ),

                Text("Archivo de canción", style: labels),
                Container(
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                    child:_buildSong(),
                ),

                Text("Archivo de imagen", style: labels),
                Container(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                  child:_buildImage(),
                ),

                Text("Instrumental", style: labels),
                Container(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                  child:_buildInstrumental(),
                ),

                Container(
                  padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
                  child:_buildSubmit(),
                ),
                //Submit button

              ],
            ),
          )

      )
    );
  }
}