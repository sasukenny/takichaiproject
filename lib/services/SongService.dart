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


  Future<void> CreateSong(String name, String genre, String description, String? song, String? image ) async{
    try{
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('token');
      final url = Uri.https('takichai-backend.herokuapp.com','/api/songs');
      final response = await http.post(url,
          headers: {
            'Authorization': 'Bearer $token',
          },
          body:{
            'name': '$name',
            'year': '2000',
            'description': '$description',
            'genre': '$genre',
            'mood': 'Melancolía',
            'instrumental': 'false',
            'img': image,
            'song': song
      });
      logger.d("aaa");
      //print(jsonDecode(response.body));
      //logger.d(jsonDecode(response.body));
      //return newUser;
    }catch(error){
      throw Exception(error);
    }
  }
  
  Future<void> NewSong(String name, String genre, String description,File song, String image) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    try{
      //////////////////
      var request = http.MultipartRequest('POST', Uri.https('takichai-backend.herokuapp.com','/api/songs'));
      Map<String, String> headers = { "Authorization": "Bearer $token"};
      request.headers.addAll(headers);
      request.fields.addAll({
        'name': name,
        'year': '2000',
        'description': description,
        'genre': genre,
        'mood': 'Melancolía',
        'instrumental': 'false',
        'img': 'data:image/jpeg;base64,'+ image,
      });
      logger.d("a1");
      var stream  = new http.ByteStream(song.openRead());
      stream.cast();
      var length = await song.length();
      print(length);
      request.files.add(await http.MultipartFile('song', stream, length, filename: song.path));
      logger.d(song.path);
      logger.d("a2");
      /*
      var streamImg  = new http.ByteStream(image.openRead());
      stream.cast();
      var lengthImg = await image.length();
      request.files.add(await http.MultipartFile('img', streamImg, lengthImg, filename: image.path));
      //logger.d(image.path);
      logger.d("a3");*/
      http.StreamedResponse response = await request.send();
      logger.d(request.files.toString());
      logger.d(request.fields);
      logger.d(request.files[0].filename);
      logger.d(response.request.toString());
      logger.d(response.request);

      if (response.statusCode == 200) {
        String str = await response.stream.bytesToString();
        print("yeihhh");
        //Song newSong = Song.fromNewSong(jsonDecode(str));
        //return newSong;
      }
      else {
        logger.d(response.reasonPhrase);
      }
      ////////////////
    }catch(error){
      logger.d(error);
      throw Exception(error);
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
      //final url = Uri.https('takichai-backend.herokuapp.com','/api/songs', query);
      final url = Uri.https('takichai-recommendations.herokuapp.com','/v1/recomendations');
      final response = await http.get(url, headers: {"Authorization": 'Bearer $token'});
      Map<Object, dynamic> json = jsonDecode(response.body);

      for(Map<Object, dynamic> a in json['items']){
        logger.d(a);
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
            a['songId'],
            /**/
        );
        logger.d("1");
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

  Future<Song> getSong(String songId) async{
    String? token;
    Song dataSong;
    try{
      SharedPreferences prefs = await SharedPreferences.getInstance();
      token = prefs.getString('token');
      final url = Uri.https('takichai-backend.herokuapp.com','/api/song/$songId');
      final response = await http.get(url, headers: {"Authorization": 'Bearer $token'});
      Map<Object, dynamic> json = jsonDecode(response.body);

      Map<Object, dynamic> a =  json['song'];
      logger.d(a);
      Song item = Song(
        a['name'],
        a['songUrl'],
        a['year'],
        a['genre'],
        a['description'],
        a['author']['name'],
        a['popularity'],
        a['imageUrl'],
        a['duration'],
        a['instrumental'],
        a['mood'],
        a['songId'],
        /**/
      );
      logger.d("1");
      print('item: '+ item.name);
      dataSong = item;
    }
    catch(error){
      logger.e(error);
      throw Exception('Failed to load User');
    }
    return dataSong;
  }


  Future<List<Song>> getSimilarSongs(String songId) async{
    String? token;
    List<Song> songs = [];
    try{
      SharedPreferences prefs = await SharedPreferences.getInstance();
      token = prefs.getString('token');
      final url = Uri.https('takichai-recommendations.herokuapp.com','/v1/recomendations/$songId');
      final response = await http.get(url, headers: {"Authorization": 'Bearer $token'});
      Map<Object, dynamic> json = jsonDecode(response.body);
      for(Map<Object, dynamic> a in json['items']){
        logger.d(a);
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
          a['songId'],
        );
        logger.d("1");
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

