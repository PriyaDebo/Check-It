import 'dart:async';
import 'dart:convert';

import 'package:check_it/models/users_model.dart';
import 'package:http/http.dart' as http;

class UserService {
  final uriLink = "http://192.168.2.101:3000/users";
  final header = <String, String>{'Content-Type': 'application/json; charset=UTF-8',};

  Future<int> signupUser(String username, String password) async {
    var user = new UserModel(null, username, password);
    final uri = uriLink + "/signup";
    final response = await http.put(
      Uri.parse(uri),
      headers: header,
      body: jsonEncode(user.toJson()),
    );
    return response.statusCode;
    }

  Future<http.Response> loginUser(String username, String password) async {
    var user = new UserModel(null, username, password);
    final uri = uriLink + "/login";
    final response = await http.post(
      Uri.parse(uri),
      headers: header,
      body: jsonEncode(user.toJson()),
    );
    return response;
  }

  Future<UserModel> getUser(String token) async {
    final uri = uriLink + "/protected";
    final response = await http.get(
      Uri.parse(uri),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
    final responseJson = jsonDecode(response.body);
    return UserModel.fromJson(responseJson);
  }
}


