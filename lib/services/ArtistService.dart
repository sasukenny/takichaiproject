// Dart
import 'dart:convert';
import 'package:http/http.dart' as http;


import '../globals/globalValues.dart';
import '../models/mod_User.dart';
import '../models/mod_UserMessage.dart';

class ArtistService {
  Future<User> getArtistData(String id) async {
    try{
      final url = Uri.https('takichai-backend.herokuapp.com', '/api/users/${id}');
      final response = await http.get(url);
      print(jsonDecode(response.body));
      User userdata = User.fromRegister(jsonDecode(response.body));
      return userdata;
    }catch(error){
      throw Exception('Failed to load User');
    }
  }

  Future<UserMessage> followArtist(String id) async {
    try{
      final url = Uri.https('takichai-backend.herokuapp.com', '/api/users/subscribe?id=${id}');
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

  Future<UserMessage> unfollowArtist(String id) async {
    try{
      final url = Uri.https('takichai-backend.herokuapp.com', '/api/users/unsubscribe?id=${id}');
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
  Future<UserMessage?> getListArtist(String id) async {
    return null;
  }
}



