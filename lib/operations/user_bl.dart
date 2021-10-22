import 'package:check_it/client/user_service.dart';
import 'package:check_it/models/users_model.dart';
import 'package:check_it/operations/secure_bl.dart';

class UserBl {
  UserService userService = new UserService();

  Future<String?> validSignup(String username, String password) async {
    final res = await userService.signupUser(username, password);
    if (res == 200) {
      return validLogin(username, password);
    }
    print (res);
    return "FAIL";
  }

  Future<String?> validLogin(String username, String password) async {
    final res = await userService.loginUser(username, password);
    if (res.statusCode == 200 || res.statusCode == 201) {
      final authUser = await authorizedUser(res.body);
      return authUser.id;
    }
    return "FAIL";
  }

  Future<UserModel> authorizedUser(String token) async {
    final res = await userService.getUser(token);
    UserSecureStorage.setToken(token);
    UserSecureStorage.setUsername(res.username);
    UserSecureStorage.setUserId(res.id.toString());
    return res;
  }
}