import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; //importar para hacer peticiones
import 'dart:convert'; //importar para hacer peticiones

//Clase modelo
class Artist_resumen {
  final String name;
  final String description;
  final List<String> songs;
  //agregar en futuro las listas
  const Artist_resumen({
    required this.name,
    required this.description,
    required this.songs,
  });

  //Método constructor a partir de json
  factory Artist_resumen.fromJson(Map<Object, dynamic> json) {
    print('fromjson');

    List<String> songList = [];
    for(String sus in json['user']['songs']){
      songList.add(sus);
    }
    print('lista1');
    print(songList);

    return Artist_resumen(
      name: json['user']['name'],
      description: json['user']['description'],
      songs: songList,

    );
  }
}
