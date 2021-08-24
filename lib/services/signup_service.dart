import 'dart:async';
import 'dart:convert';

import 'package:check_it/models/users_model.dart';
import 'package:http/http.dart' as http;

Future<UserModel> createUser(String username, String password) async {
  final response = await http.put(
    Uri.parse("http://192.168.0.103:3000/users/signup"),
    headers: <String, String> {
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String> {
      'username': username,
      'password': password,
  }),
  );

  if (response.statusCode == 201 || response.statusCode == 200) {
    print("Okay");
    return UserModel.fromJson(jsonDecode(response.body));
  } else {
    print(response.statusCode);
    throw Exception('Username Exists. Failed to create new User');
  }
}


