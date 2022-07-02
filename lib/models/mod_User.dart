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