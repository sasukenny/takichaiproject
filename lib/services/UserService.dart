// Dart
import 'dart:convert';
import 'package:http/http.dart' as http;


import '../globals/globalValues.dart';
import '../models/mod_User.dart';
import '../models/mod_UserMessage.dart';

class UserService {
  Future <User> RegisterUser (String name, String email, String password) async {
    final String apiUrl = "https://takichai-backend.herokuapp.com/api/user";

    final response = await http.post(Uri.parse(apiUrl), body: {
      "name": name,
      "email": email,
      "password": password
    });

    if(response.statusCode == 201){
      final String responseString = response.body;
      User userdata = User.fromJson(jsonDecode(response.body));
      return userdata;
    }else{
      return User(email:"", name:"",description: "", subscribers: [], subscriptions: [], userId: '', publicProfile: true);
    }

  }
  Future<User> getUserData(String id) async {
    try{
      final url = Uri.https('takichai-backend.herokuapp.com', '/api/users/${id}');
      final response = await http.get(url);
      print(jsonDecode(response.body));
      User userdata = User.fromJson(jsonDecode(response.body));
      return userdata;
    }catch(error){
      throw Exception('Failed to load User');
    }
  }
  Future<User> getArtistData() async {
    try{
      final url = Uri.https('takichai-backend.herokuapp.com', '/api/users/62bf6513929a04ce7230db56');
      final response = await http.get(url);
      print(jsonDecode(response.body));
      User userdata = User.fromJson(jsonDecode(response.body));
      return userdata;
    }catch(error){
      throw Exception('Failed to load User');
    }
  }

  Future<UserMessage> followArtist() async {
    try{
      final url = Uri.https('takichai-backend.herokuapp.com', '/api/users/subscribe?id=62bf6513929a04ce7230db56');
      final response = await http.patch(url,
        headers: {"Authorization": "$authToken"},
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
        headers: {"Authorization": "$authToken"},
      );
      print(jsonDecode(response.body));
      UserMessage userdata = UserMessage.fromJson(jsonDecode(response.body));
      return userdata;
    }catch(error){
      throw Exception('Failed to unsuscribe');
    }
  }
}



