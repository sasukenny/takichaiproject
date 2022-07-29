// Dart
import 'dart:convert';
import 'dart:core';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';



import '../models/mod_User.dart';



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
      User userRes = User.fromLogin(jsonDecode(response.body));
      /*storing on localstorage*/
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('userId', userRes.userId);
      prefs.setBool('publicProfile', userRes.publicProfile);
      prefs.setString('name', userRes.name);
      prefs.setString('email', userRes.email);
      prefs.setString('description', userRes.description);
      prefs.setStringList('subscribers', userRes.subscribers);
      prefs.setStringList('subscriptions', userRes.subscriptions);
      prefs.setString('token', userRes.token);
      return userRes;
    }catch(error){
      throw Exception('Failed to login User');
    }
  }

  //logout user
  Future<void> LogoutUser() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('userId');
    prefs.remove('publicProfile');
    prefs.remove('name');
    prefs.remove('email');
    prefs.remove('description');
    prefs.remove('subscribers');
    prefs.remove('subscriptions');
    prefs.remove('token');
  }

  //Get and Update User Data
  Future<User> getUserData(String id) async {
    try{
      final url = Uri.https('takichai-backend.herokuapp.com', '/api/users/${id}');
      final response = await http.get(url);
      print(jsonDecode(response.body));
      User userdata = User.fromProfileData(jsonDecode(response.body));
      /*updating data*/
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('userID', userdata.userId);
      prefs.setBool('publicProfile', userdata.publicProfile);
      prefs.setString('name', userdata.name);
      prefs.setString('email', userdata.email);
      prefs.setString('description', userdata.description);
      prefs.setStringList('subscribers', userdata.subscribers);
      prefs.setStringList('subscriptions', userdata.subscriptions);
      prefs.setString('token', userdata.token);
      return userdata;
    }catch(error){
      throw Exception('Failed to load User');
    }
  }

}



