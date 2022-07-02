
<<<<<<< HEAD

import 'dart:convert';
import 'package:http/http.dart' as http;

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    this.userId = 0,
    required this.name,
    this.description = "",
    this.password = "",
    required this.email,
  });

  int userId;
  String name;
  String description;
  String password;
  String email;

  factory User.fromJson(Map<String, dynamic> json) => User(
    userId: json["user"]["userId"],
    name: json["user"]["name"],
    description: json["user"]["description"],
    email: json["user"]["email"],
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "name": name,
    "description": description,
    "password": password,
    "email": email,
  };

  Future <User> RegisterUser (String name, String email, String password) async {
    final String apiUrl = "https://takichai-backend.herokuapp.com/api/user";

    final response = await http.post(Uri.parse(apiUrl), body: {
      "name": name,
      "email": email,
      "password": password
    });

    if(response.statusCode == 201){
      final String responseString = response.body;

      return userFromJson(responseString);
    }else{
      return User(email:"", name:"", password:"");
    }

  }
}
=======
//Clase modelo
class User {
  final String name;
  final String email;
  final String description;
  final List<String> subscribers;
  final List<String> subscriptions;
  //agregar en futuro las listas

  const User({
    required this.name,
    required this.email,
    required this.description,
    required this.subscribers,
    required this.subscriptions,

  });

  //Método constructor a partir de json
  factory User.fromJson(Map<Object, dynamic> json) {
    print('fromjson');
    print(json['user']['subscribers']);
    /*
    json['user']['subscribers'].map((suscriber)=>{
      subscribersList.add(suscriber)
    });
     */
    List<String> subscribersList = [];
    for(String sus in json['user']['subscribers']){
      subscribersList.add(sus);
    }

    /*
    json['user']['subscriptions'].map((subscription)=>{
      subscriptionsList.add(subscription)
    });
    */
    List<String>  subscriptionsList = [];
    for(String sus in json['user']['subscriptions']){
      subscriptionsList.add(sus);
    }
    print('lista1');
    print(subscribersList);
    print('lista2');
    print(subscriptionsList);
    return User(
      name: json['user']['name'],
      email: json['user']['email'],
      description: json['user']['description'],
      subscribers: subscribersList,
      subscriptions: subscriptionsList,
    );
  }
}
>>>>>>> da226a4276625b3c1059bafbdbbf34dc30fd664d
