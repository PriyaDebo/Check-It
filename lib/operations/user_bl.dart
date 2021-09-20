import 'package:check_it/client/user_service.dart';
import 'package:check_it/models/users_model.dart';

class UserBl {
  UserService userService = new UserService();

  Future<bool> validSignup(String username, String password) async {
    final res = await userService.signupUser(username, password);
    if (res == 200) {
      return validLogin(username, password);
    }
    print (res);
    return false;
  }

  Future<bool> validLogin(String username, String password) async {
    final res = await userService.loginUser(username, password);
    if (res.statusCode == 200 || res.statusCode == 201) {
      final authUser = await authorizedUser(res.body);
      print(authUser);
      return true;
    }
    return false;
  }

  Future<UserModel> authorizedUser(String token) async {
    final res = await userService.getUser(token);
    return res;
  }

}