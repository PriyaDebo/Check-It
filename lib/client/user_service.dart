import 'dart:async';
import 'dart:convert';

import 'package:check_it/models/users_model.dart';
import 'package:http/http.dart' as http;

class UserService {
  final uriLink = "http://192.168.0.103:3000/users";
  final header = <String, String>{'Content-Type': 'application/json; charset=UTF-8',};

  Future<int> signupUser(String username, String password) async {
    var user = new UserModel(username, password, null);
    final uri = uriLink + "/signup";
    final response = await http.put(
      Uri.parse(uri),
      headers: header,
      body: jsonEncode(user.toJson()),
    );
    print (response.body);
    return response.statusCode;
    }

  Future<int> loginUser(String username, String password) async {
    var user = new UserModel(username, password, null);
    final uri = uriLink + "/login";
    final response = await http.post(
      Uri.parse(uri),
      headers: header,
      body: jsonEncode(user.toJson()),
    );
    return response.statusCode;
  }
}


