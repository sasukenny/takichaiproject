// Dart
import 'dart:convert';
import 'package:http/http.dart' as http;


import '../globals/globalValues.dart';
import '../models/mod_User.dart';
import '../models/mod_UserMessage.dart';


class UserService {
  //Registrer a new user
  Future<User> RegisterUser(String name, String email, String pw, String desc) async{
    try{
      final url = Uri.https('takichai-backend.herokuapp.com', '/api/users');
      final response = await http.post(url, body:{
        "name": name,
        "email": email,
        "password": pw,
        "description": desc
      });
      //print(jsonDecode(response.body));
      User newUser = User.fromRegister(jsonDecode(response.body));
      return newUser;
    }catch(error){
      throw Exception('Failed to register new User');
    }
  }

  //Login user
  Future<User> LoginUser(String email, String pw) async{
    try{
      final url = Uri.https('takichai-backend.herokuapp.com', '/api/users/login');
      final response = await http.post(url, body:{
        "email": email,
        "password": pw,
      });
      //print(jsonDecode(response.body));
      User newUser = User.fromLogin(jsonDecode(response.body));

        globalVariables.add(newUser);
      return newUser;
    }catch(error){
      throw Exception('Failed to login User');
    }
  }

  //Get User Data
  Future<User> getUserData(String id) async {
    try{
      final url = Uri.https('takichai-backend.herokuapp.com', '/api/users/${id}');
      final response = await http.get(url);
      print(jsonDecode(response.body));
      User userdata = User.fromProfileData(jsonDecode(response.body));
      return userdata;
    }catch(error){
      throw Exception('Failed to load User');
    }
  }
  Future<User> getArtistData() async {
    try{
      int id = globalVariables[0].userId;
      final url = Uri.https('takichai-backend.herokuapp.com', '/api/users/${id}');
      final response = await http.get(url);
      print(jsonDecode(response.body));
      User userdata = User.fromProfileData(jsonDecode(response.body));
      return userdata;
    }catch(error){
      throw Exception('Failed to load User');
    }
  }

  Future<UserMessage> followArtist() async {
    try{
      final url = Uri.https('takichai-backend.herokuapp.com', '/api/users/subscribe?id=62bf6513929a04ce7230db56');
      final response = await http.patch(url,
        headers: {"Authorization": "$globalVariables[0].token"},
      );
      print(jsonDecode(response.body));
      UserMessage userdata = UserMessage.fromJson(jsonDecode(response.body));
      return userdata;
    }catch(error){
      throw Exception('Failed to suscribe');
    }
  }

  Future<UserMessage> unfollowArtist() async {
    try{
      final url = Uri.https('takichai-backend.herokuapp.com', '/api/users/subscribe?id=62bf6513929a04ce7230db56');
      final response = await http.patch(url,
        headers: {"Authorization": "$globalVariables[0].token"},
      );
      print(jsonDecode(response.body));
      UserMessage userdata = UserMessage.fromJson(jsonDecode(response.body));
      return userdata;
    }catch(error){
      throw Exception('Failed to unsuscribe');
    }
  }
}



