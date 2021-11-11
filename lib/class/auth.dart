import 'dart:convert';

import 'package:fluttertwo/class/user.dart';
import 'package:http/http.dart' as http;

Future<User?> getUser(email, password) async {
  const String apiUrl = "http://localhost:8080/user/login";

  try {
    var response = await http.post(Uri.parse(apiUrl), body: {'email': email, 'password' : password});
    if (response.statusCode == 200) {
      User tmp = User.fromJson(jsonDecode(response.body)['message']);

      return (tmp);
    } else {
      throw Exception('Failed to get User');
    }
  } catch(e) {
    if (e.toString() == 'Exception: Failed to get User') {
      throw Exception('Failed to get User');
    }
    throw Exception('Invalid internet connexion or API is down');
  }
}