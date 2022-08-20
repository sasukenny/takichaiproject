import 'package:flutter/material.dart';

import '../Wrapper/wrapper.dart';
// import 'package:takichaiproject/activities/act_mySongs.dart';
// import 'package:takichaiproject/services/UserService.dart';
import 'package:file_picker/file_picker.dart';
import 'package:open_file/open_file.dart';


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
  
  late Future<Song> songRes;

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();


  // TEXT FIELDS

  Widget _buildName(){
    return TextFormField(
      style: const TextStyle(
        color: Colors.white
      ),
      decoration: const InputDecoration(
        labelText: "Título de la canción",
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
    );
  }

  Widget _buildDescription(){
    return TextFormField(
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
    );
  }

// DROPDOWNS
  Widget _buildLanguage(){
    return DropdownButton(
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
    );
  }

  Widget _buildMood(){
    return DropdownButton(
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
    );
  }

  Widget _buildGenre(){
    return DropdownButton(
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
    );
  }


  Widget _buildSong(){
    return ElevatedButton(
      child: const Text("Agregue la canción"),
      onPressed: () async {
        final response = await FilePicker.platform.pickFiles();
        if(response == null){
          return;
          print("result null");
        }
        final songFile = response.files.first;

          OpenFile.open(songFile.bytes.toString()); //Para simulador movil cambiar bytes.toString() por path
          _songURL = songFile.bytes.toString(); //Para simulador movil cambiar bytes.toString() por path


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
        final imageFile = response.files.first;

          OpenFile.open(imageFile.bytes.toString()); //Para simulador movil cambiar bytes.toString() por path
          _songURL = imageFile.bytes.toString(); //Para simulador movil cambiar bytes.toString() por path

      },
    );
  }

  Widget _buildInstrumental(){
    return TextField();
  }

  Widget _buildSubmit(){
    return ElevatedButton(
        child: Text("Listo"),
        onPressed: (){
          print(_name + ": _name");
          print(_description + ": _description");
          print(_language + ": _language");
          print(_mood + ": _mood");
          print(_genre + ": _genre");
          print(_songURL + ": _songUrl");
          print(_imageURL + ": _imageUrl");
        });
  }

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
                //Input Texts
                _buildName(),
                _buildDescription(),
                //Dropdowns
                _buildLanguage(),
                _buildMood(),
                _buildGenre(),
                //FilePickers
                _buildSong(),
                _buildImage(),
                //Submit button
                _buildSubmit()
              ],
            ),
          )

      )
    );
  }
}