// Dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:takichaiproject/models/mod_Users.dart';

import '../globals/globalValues.dart';
import '../models/mod_UserMessage.dart';

class UserService {
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



