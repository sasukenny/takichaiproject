import 'package:http/http.dart' as http; //importar para hacer peticiones
import 'package:takichaiproject/services/UserService.dart';
import 'dart:convert'; //importar para hacer peticiones
import 'mod_User.dart';

//Song songFromNewSong(String str) => Song.fromNewSong(jsonDecode(str));
//Song songFromGetSong(String str) => Song.fromGetSong(jsonDecode(str));

//Clase modelo
class Song {
  String name = "";
  String songUrl = "";
  int year = 0;
  String genre = "";
  String description = "";
  //User author = User.emptyUser();
  String author = "";
  String popularity = '0';
  String? imageUrl ;
  String duration = '';
  bool instrumental = false;
  String mood = '';
  String songId = '';
/**/

  Song(
      this.name,
      this.songUrl,
      this.year,
      this.genre,
      this.description,
      this.author,
      this.popularity,
      this.imageUrl,
      this.duration,
      this.instrumental,
      this.mood,
      this.songId
      /**/
      );

  //Método constructor a partir de nueva canción
  Song.fromNewSong(Map<Object, dynamic> json) {
    name = json["song"]["name"];
    songUrl = json["song"]["songUrl"];
    year = json["song"]["year"];
    genre = json["song"]["genre"];
    description = json["song"]["description"];
    //author = User.fromProfileData(json["song"]["author"]);
    author = json["song"]["author"]['_id'];
    popularity = json["song"]["popularity"];
    imageUrl = json["song"]["imageUrl"];
    duration = json["song"]["duration"];
    instrumental = json["song"]["instrumental"];
    mood = json["song"]["mood"];
    /**/
  }
/*
  Song.emptySong(){
    name = "";
    songUrl = "";
    year = 0;
    genre = "";
    description = "";
    //author = User.emptyUser();
    author = "";
    language = "esp";
    popularity = "";
    imageUrl = "";
    duration = "";
    instrumental = false;
    mood = "";
  }



  //Método constructor a partir de register
  Song.fromGetSong(Map<Object, dynamic> json) {
    name = json["song"]["name"];
    songUrl = json["song"]["songUrl"];
    year = json["song"]["year"];
    genre = json["song"]["genre"];
    description = json["song"]["description"];
    author = json["song"]["author"]['_id'];
    language = json["song"]["language"];
    imageUrl = json["song"]["imageUrl"];
    duration = json["song"]["duration"];
    instrumental = json["song"]["instrumental"];
    mood = json["song"]["mood"];
  }

  Song.fromGetSonglist(Map<Object, dynamic> json) {
    name = json["song"]["name"];
    songUrl = json["song"]["songUrl"];
    year = json["song"]["year"];
    genre = json["song"]["genre"];
    description = json["song"]["description"];
    author = json["song"]["author"];
    language = json["song"]["language"];
    imageUrl = json["song"]["imageUrl"];
    duration = json["song"]["duration"];
    instrumental = json["song"]["instrumental"];
    mood = json["song"]["mood"];
  }

  Map<String, dynamic> toJson() => {
    "name": name,
    "songUrl": songUrl,
    "year": year,
    "genre": genre,
    "description": description,
    //"author": author.toJson(),
    "author": author,
    "language": language,
    "popularity": popularity,
    "imageUrl": imageUrl,
    "duration": duration,
    "instrumental": instrumental,
    "mood": mood
  };
*/
}
