import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; //importar para hacer peticiones
import 'dart:convert';

import 'package:logger/logger.dart'; //importar para hacer peticiones

//Clase modelo
class Artist_resumen {
  String name = "";
  String userid = "";
  var logger = Logger(
    filter: null, // Use the default LogFilter (-> only log in debug mode)
    printer: PrettyPrinter(), // Use the PrettyPrinter to format and print log
    output: null, // Use the default LogOutput (-> send everything to console)
  );

  Artist_resumen(this.name, this.userid);

  //Método constructor a partir de json
  Artist_resumen.fromProfileData(Map<Object, dynamic> json) {

    List<String> subscribersList = [];
    print(json['user']['subscribers']);
    for(Map<Object, dynamic>  sus in json['user']['subscribers']){
      logger.d("mi suscriptor: " + sus['name']);
      subscribersList.add(sus['name']);
    }
    logger.d("ccc");
    userid = json["user"]["userId"];
    name = json["user"]["name"];
  }

}
