// Dart
import 'dart:convert';
import 'dart:core';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/mod_User.dart';



class UserService {
  var logger = Logger(
    filter: null, // Use the default LogFilter (-> only log in debug mode)
    printer: PrettyPrinter(), // Use the PrettyPrinter to format and print log
    output: null, // Use the default LogOutput (-> send everything to console)
  );
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
      throw Exception(error);
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
      print(jsonDecode(response.body));
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
      logger.e(error);
      throw Exception(error);
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
      return userdata;
    }catch(error){
      throw Exception(error);
    }
  }

  Future<User> getMyData() async {
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
      User userdata = User.fromProfileData(jsonDecode(response.body));
      /*updating data*/
      prefs.setString('userID', userdata.userId);
      prefs.setBool('publicProfile', userdata.publicProfile);
      prefs.setString('name', userdata.name);
      prefs.setString('email', userdata.email);
      prefs.setString('description', userdata.description);
      prefs.setStringList('subscribers', userdata.subscribers);
      prefs.setStringList('subscriptions', userdata.subscriptions);
      return userdata;
    }catch(error){
      throw Exception(error);
    }
  }

  //get all user - then this will become getAllArtist
  Future<List<User>> getAllUsers() async {
    try{
      final url = Uri.https('takichai-backend.herokuapp.com', '/api/users/');
      final response = await http.get(url);
      List<User> users = [];
      Map<Object, dynamic> json = jsonDecode(response.body);
      //User a = json['users'][0];
      for(Map<Object, dynamic> a in json['users']){
        List<String> subscribersList = [];
        for(String sus in a['subscribers']){
          subscribersList.add(sus);
        }
        List<String>  subscriptionsList = [];
        for(String sus in a['subscriptions']){
          subscriptionsList.add(sus);
        };
        User useritem = User(
            a['name'],
            a['email'],
            a['description'],
            subscribersList,
            subscriptionsList,
            a['publicProfile'],
            a['userId'],
            "");
        users.add(useritem);
      }
      return users;
    }catch(error){
      logger.e(error);
      throw Exception(error);
    }
  }


  //Edit Profile user
  Future<User> EditProfile(String pw, String description, String publicProfile, String? token) async{
    print(token);
    try{
      final url = Uri.https('takichai-backend.herokuapp.com', '/api/users');
      final response = await http.put(
          url,
          body:{
            "password": pw,
            "description": description,
            "publicProfile": publicProfile,

      }, headers: {
            'Accept': 'application/json',
            'Authorization': token ?? "",
      });
      //print(jsonDecode(response.body));
      User userRes = User.fromEditProfile(jsonDecode(response.body));
      /*storing on localstorage*/
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('userId', userRes.userId);
      prefs.setBool('publicProfile', userRes.publicProfile);
      // prefs.setString('name', userRes.name);
      // prefs.setString('email', userRes.email);
      prefs.setString('description', userRes.description);
      // prefs.setStringList('subscribers', userRes.subscribers);
      // prefs.setStringList('subscriptions', userRes.subscriptions);
      prefs.setString('token', userRes.token);
      return userRes;
    }catch(error){
      logger.e(error);
      throw Exception(error);
    }
  }
}



