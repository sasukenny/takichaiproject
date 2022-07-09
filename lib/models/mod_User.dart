import 'package:http/http.dart' as http; //importar para hacer peticiones
import 'dart:convert'; //importar para hacer peticiones

User userFromJson(String str) => User.fromJson(json.decode(str)); //de Json a User
String userToJson(User data) => json.encode(data.toJson()); //de User a Json

//Clase modelo
class User {
  final bool publicProfile;
  final String name;
  final String email;
  final String description;
  final List<String> subscribers;
  final List<String> subscriptions;
  final String userId;

  //agregar en futuro las listas

  const User({
    required this.name,
    required this.email,
    required this.description,
    required this.subscribers,
    required this.subscriptions,
    required this.publicProfile,
    required this.userId
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
    List<String>  subscriptionsList = [];
    for(String sus in json['user']['subscriptions']){
      subscriptionsList.add(sus);
    }

    return User(
      name: json['user']['name'],
      email: json['user']['email'],
      description: json['user']['description'],
      subscribers: subscribersList,
      subscriptions: subscriptionsList,
      publicProfile: json['user']['publicProfile'],
      userId: json['user']['userId'],
    );
  }

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "name": name,
    "description": description,
    "email": email,
  };


}
