import 'package:flutter/material.dart';

import 'package:http/http.dart' as http; //importar para hacer peticiones
import 'dart:convert'; //importar para hacer peticiones

User userFromJson(String str) => User.fromJson(json.decode(str)); //de Json a User
String userToJson(User data) => json.encode(data.toJson()); //de User a Json


//Clase modelo
class User {
  final String userId;
  final String name;
  final String email;
  final String? password;
  final String description;

  const User({
    this.userId = "",
    required this.name,
    required this.email,
    required this.password,
    required this.description,
  });

  //Método constructor a partir de json
  factory User.fromJson(Map<String, dynamic> json) {
    User usuario = User(
      userId: json["user"]["userId"],
      name: json["user"]["name"],
      description: json["user"]["description"],
      password: json["user"]["password"],
      email: json["user"]["email"],
    );
    print(usuario.userId);
    return usuario;
  }

  //Para retornar JSON
  Map<String, dynamic> toJson() => {
    "name": name,
    "email": email,
    "password": password,
    "description": description
  };

}

//Registrar
Future<User> RegisterUser(String name, String email, String pw, String desc) async{
  const String url = 'https://takichai-backend.herokuapp.com/api/users';

  final response = await http.post(Uri.parse(url),body: {
    "name": name,
    "email": email,
    "password": pw,
    "description": desc
  });

  final String responseString = response.body;
  return userFromJson(responseString);
}