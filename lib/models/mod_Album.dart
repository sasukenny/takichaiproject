import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; //importar para hacer peticiones
import 'dart:convert'; //importar para hacer peticiones

//Clase modelo
class Album {
  final int userId;
  final int id;
  final String title;

  const Album({
    required this.userId,
    required this.id,
    required this.title,
  });

  //Método constructor a partir de json
  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
    );
  }
}

//Definir la llamada asíncrona
Future<Album> fetchAlbum(String url) async {
  final response = await http
      .get(Uri.parse(url));
  if (response.statusCode == 200) {
    return Album.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load album');
  }
}

Widget fBuilder(futureAlbum){
  return FutureBuilder<Album>(
    future: futureAlbum,
    builder: (context, snapshot) {
      if (snapshot.hasData) {
        return Text(snapshot.data!.title);
      } else if (snapshot.hasError) {
        return Text('${snapshot.error}');
      }
      // By default, show a loading spinner.
      return const CircularProgressIndicator();
    },
  );
}