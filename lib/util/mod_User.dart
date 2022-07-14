import 'package:flutter/material.dart';

import 'package:http/http.dart' as http; //importar para hacer peticiones
import 'dart:convert'; //importar para hacer peticiones

User userFromJson(String str) => User.fromJson(json.decode(str)); //de Json a User
String userToJson(User data) => json.encode(data.toJson()); //de User a Json


//Clase modelo
class User {
  final String name;
  final String email;
  final String password;
  final String description;

  const User({
    required this.name,
    required this.email,
    required this.password,
    required this.description,
  });

  //Método constructor a partir de json
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'],
      email: json['email'],
      password: json['password'],
      description: json['description']
    );
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

  if(response.statusCode == 201){
    final String responseString = response.body;
    return userFromJson(responseString);
  }else{ 
    return const User(name: "name", email: "email", password: "password", description: "");
  }
}


//Login
Future<User> LoginUser(String email, String pw) async{
  const String url = 'https://takichai-backend.herokuapp.com/api/users/login';

  final response = await http.post(Uri.parse(url),body: {
    "email": email,
    "password": pw,
  });

  if(response.statusCode == 200){
    final String responseString = response.body;
    print("Success, user logged");
    User result = userFromJson(responseString);
    print(result.email);
    return result;
  }else{
    print("Error logging");
    return const User(name: "", email: "email", password: "password", description: "");
  }
}