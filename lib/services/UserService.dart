// Dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:takichaiproject/models/mod_User.dart';

class UserService {
  Future<User> getUserData() async {
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
}



