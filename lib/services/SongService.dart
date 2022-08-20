// Dart
import 'dart:convert';
import 'dart:core';
import 'dart:io';

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
    String? token;
    try{
      //////////////////
      var request = http.MultipartRequest('POST', Uri.https('takichai-backend.herokuapp.com','/api/songs'));
      request.fields.addAll({
        'name': '$name',
        'genre': '$genre',
        'description': '$description',
        'year': '2000',
        'mood': 'Melancolía',
        'instrumental': 'false'
      });
      request.files.add(await http.MultipartFile.fromPath('img', '../assets/images/logoTakiChai.png'));
      request.files.add(await http.MultipartFile.fromPath('song', '../assets/songs/Via Crisis.mpeg'));

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        String str = await response.stream.bytesToString();
        print(str);
        Song newSong = Song.fromNewSong(jsonDecode(str));
        return newSong;
      }
      else {
        print(response.reasonPhrase);
        throw Exception('Failed to register new Song');
      }
      ////////////////
      /*
      SharedPreferences prefs = await SharedPreferences.getInstance();
      token = prefs.getString('token');
      final url = Uri.https('takichai-backend.herokuapp.com', '/api/songs');

      print("name: "+ name);
      print("genre: "+ genre);
      print("description: "+ description);

      final response = await http.post(url, body:{
        "name": '$name',
        "genre": '$genre',
        "description": '$description',
        "songUrl": "",
        "year": "2000",
         "language": "Spansish",
        "popularity":"high",
        "imageUrl":"image",
        "duration":"duration",
        "instrumental":"false",
        "mood":"good"
      },headers: {
        'Content-type': 'multipart/form-data',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      });
      print(response.body);
      Song newSong = Song.fromNewSong(jsonDecode(response.body));
      return newSong;*/
    }catch(error){
      print(error);
      throw Exception('Failed to register new Song');
    }
  }


  Future<List<Song>> getAllSongs() async{
    String? token;
    Map<String,Object>query = {
      'userId': "62bf6513929a04ce7230db56"
    };
    List<Song> songs = [];
    try{
      SharedPreferences prefs = await SharedPreferences.getInstance();
      token = prefs.getString('token');
      final url = Uri.https('takichai-backend.herokuapp.com','/api/songs', query);
      final response = await http.get(url, headers: {"Authorization": 'Bearer $token'});
      Map<Object, dynamic> json = jsonDecode(response.body);

      for(Map<Object, dynamic> a in json['songs']){
        print(a);
        Song item = Song(
            a['name'],
            a['songUrl'],
            a['year'],
            a['genre'],
            a['description'],
            a['author'],
            a['popularity'],
            a['imageUrl'],
            a['duration'],
            a['instrumental'],
            a['mood'],
            /**/
        );
        print('item: '+ item.name);
        songs.add(item);
      }
    }
    catch(error){
    logger.e(error);
    throw Exception('Failed to load User');
    }
    return songs;
  }

}



