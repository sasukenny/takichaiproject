import 'package:http/http.dart' as http; //importar para hacer peticiones
import 'dart:convert'; //importar para hacer peticiones
import '../globals/globalValues.dart';

User userFromProfileData(String str) => User.fromProfileData(json.decode(str));
User userFromRegister(String str) => User.fromRegister(json.decode(str));
User userFromLogin(String str) => User.fromLogin(json.decode(str));
User userFromEditProfile(String str) => User.fromEditProfile(json.decode(str));
//de Json a User
String userToJson(User data) => json.encode(data.toJson()); //de User a Json

//Clase modelo
class User {
  String userId = "";
  bool publicProfile = true;
  String name = "";
  String email = "";
  String description = "";
  List<String> subscribers = [];
  List<String> subscriptions = [];
  String token = "";

  User(
    this.name,
    this.email,
    this.description,
    this.subscribers,
    this.subscriptions,
    this.publicProfile,
    this.userId,
      this.token
  );

  //Método constructor a partir de register
  User.fromRegister(Map<Object, dynamic> json) {
    description = "";
    userId = json["user"]["userId"];
    name = json["user"]["name"];
    description = json["user"]["description"];
    email = json["user"]["email"];
  }

  //Método constructor a partir de login
  User.fromLogin(Map<Object, dynamic> json) {
    description = "";
    userId = json["user"]["userId"];
    name = json["user"]["name"];
    description = json["user"]["description"];
    email = json["user"]["email"];
    token = json["token"];
  }

  //Método constructor a para la data de perfil
  User.fromProfileData(Map<Object, dynamic> json) {

    List<String> subscribersList = [];
    for(String sus in json['user']['subscribers']){
      subscribersList.add(sus);
    }
    List<String>  subscriptionsList = [];
    for(String sus in json['user']['subscriptions']){
      subscriptionsList.add(sus);
    }

    subscribers = subscribersList;
    subscriptions = subscriptionsList;
    description = json['user']['description'];
    userId = json["user"]["userId"];
    name = json["user"]["name"];
    description = json["user"]["description"];
    email = json["user"]["email"];
    publicProfile = json['user']['publicProfile'];
  }

  User.fromEditProfile(Map<Object, dynamic> json) {

    description = json['user']['description'];
    userId = json["user"]["userId"];
    publicProfile = json['user']['publicProfile'];
    // name = json["user"]["name"];
    // description = json["user"]["description"];
    // email = json["user"]["email"];
  }

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "description": description,
    "publicProfile": publicProfile,
  };

}
