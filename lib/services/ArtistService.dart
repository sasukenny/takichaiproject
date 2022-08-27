// Dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';


import '../globals/globalValues.dart';
import '../models/mod_ArtistResumen.dart';
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
    String? token;
    Map<String,Object>query = {
      'id': id
    };
    try{
      SharedPreferences prefs = await SharedPreferences.getInstance();
      token = prefs.getString('token');
      final url = Uri.https('takichai-backend.herokuapp.com','/api/users/subscribe', query);
      final response = await http.patch(url,
        headers: {"Authorization": 'Bearer $token'},
      );
      print(jsonDecode(response.body));
      UserMessage userdata = UserMessage.fromJson(jsonDecode(response.body));
      return userdata;
    }catch(error){
      throw Exception('Failed to suscribe');
    }
  }

  Future<UserMessage> unfollowArtist(String id) async {
    String? token;
    Map<String,Object>query = {
      'id': id
    };
    try{
      SharedPreferences prefs = await SharedPreferences.getInstance();
      token = prefs.getString('token');
      final url = Uri.https('takichai-backend.herokuapp.com', '/api/users/unsubscribe', query );
      final response = await http.patch(url,
        headers: {"Authorization": 'Bearer $token'},
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

  Future<List<Artist_resumen>> getlistFavoriteArtist() async {
    String? token;
    try{
      SharedPreferences prefs = await SharedPreferences.getInstance();
      token = prefs.getString('token');
      final url = Uri.https('takichai-backend.herokuapp.com', '/api/user');

      final response = await http.get(url,
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );
      print(jsonDecode(response.body));
      Map<Object, dynamic> json = jsonDecode(response.body);
      List<Artist_resumen>  subscriptionsList = [];
      for(Map<Object, dynamic> sus in json['user']['subscriptions']){
        Artist_resumen item = Artist_resumen(sus['name'],sus['_id']);
        subscriptionsList.add(item);
      }
      return subscriptionsList;
    }catch(error){
      throw Exception('Failed to load favorite artist list');
    }
  }


}



