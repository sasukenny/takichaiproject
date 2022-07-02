// Dart
import 'dart:convert';
import 'package:http/http.dart' as http;

class UserService {
  Future<String> _getUserData() async {
    final url = Uri.https('https://takichai-backend.herokuapp.com', '/api/users/62bf6513929a04ce7230db56');
    final response = await http.get(url);
    String ip = jsonDecode(response.body)['origin'];
    return ip;
  }
}



