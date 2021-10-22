import 'dart:async';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class UserSecureStorage {

  static final _storage = FlutterSecureStorage();
  static const _jwtToken = 'jwtToken';
  static const _username = 'username';
  static const _userId = 'userId';

  static Future setToken(String token) async =>
      await _storage.write(key: _jwtToken, value: token);

  static Future setUsername(String username) async =>
    await _storage.write(key: _username, value: username);

  static Future setUserId(String userId) async =>
    await _storage.write(key: _userId, value: userId);

  static Future<String?> getToken() async =>
      await _storage.read(key: _jwtToken);

  static Future<String?> getUsername() async =>
      await _storage.read(key: _username);

  static Future<String?> getUserId() async =>
      await _storage.read(key: _userId);

  static Future deleteAll() async =>
      await _storage.deleteAll();
}