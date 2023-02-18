import 'package:http/http.dart' as http;
import 'dart:convert';

import 'user.dart';
import '../Globals/cookies.dart';
import '../Globals/user.dart';

Future<User> login(String username, String password) async {
  Map<String, String> sendHeader = {
    'Content-Type': 'application/json; charset=UTF-8',
  };
  if (cookie != "") {
    sendHeader = {
      'Content-Type': 'application/json; charset=UTF-8',
      'Cookie': cookie,
    };
  }

  final response = await http.get(
      Uri.parse(
          'http://10.0.2.2:5000/login?username=$username&password=$password'),
      headers: sendHeader);

  List<String> header = response.headers['set-cookie']!.split(';');
  refreshCookie(header[0], header[1].split('=')[1]);

  if (response.statusCode == 201) {
    isLoggedIn = true;
    return User.fromJson(jsonDecode(response.body));
  } else if (response.statusCode == 401) {
    throw Exception('Wrong username and password');
  } else {
    throw Exception('Failed to login');
  }
}

Future<bool> logout() async {
  if (!isLoggedIn) {
    return false;
  }

  Map<String, String> sendHeader = {
    'Content-Type': 'application/json; charset=UTF-8',
    'Cookie': cookie,
  };

  final response = await http.post(Uri.parse('http://10.0.2.2:5000/logout'),
      headers: sendHeader);

  if (response.statusCode == 201) {
    isLoggedIn = false;
    return true;
  } else {
    throw Exception('Different Repsonse code: ${response.statusCode}');
  }
}
