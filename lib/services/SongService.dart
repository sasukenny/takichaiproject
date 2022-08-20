// Dart
import 'dart:convert';
import 'dart:core';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/mod_Song.dart';

class SongService{
  var logger = Logger(
    filter: null, // Use the default LogFilter (-> only log in debug mode)
    printer: PrettyPrinter(), // Use the PrettyPrinter to format and print log
    output: null, // Use the default LogOutput (-> send everything to console)
  );

  Future<Song> NewSong(String name, String genre, String description) async{
    try{

      final url = Uri.https('takichai-backend.herokuapp.com', '/api/songs');

      final response = await http.post(url, body:{
        "name": name,
        "genre": genre,
        "description": description,
        "songUrl": "",
        "year": "2000",
         "language": "Spansish",
        "popularity":"high",
        "imageUrl":"image",
        "duration":"duration",
        "instrumental":"false",
        "mood":"good"
      });
      print("3");
      print(response.body);
      Song newSong = Song.fromNewSong(jsonDecode(response.body));
      print("4");
      return newSong;
    }catch(error){
      print(error);
      throw Exception('Failed to register new Song');
    }
  }

}



