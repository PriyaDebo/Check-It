import 'package:check_it/client/user_service.dart';

class UserBl {

  Future<bool> validSignup(String username, String password) async {
    final res = await UserService().signupUser(username, password);
    if (res == 200) {
      return validLogin(username, password);
    }
    print (res);
    return false;
  }

  Future<bool> validLogin(String username, String password) async {
    final res = await UserService().loginUser(username, password);
    if (res == 200 || res == 201) {
      return true;
    }
    return false;
  }

}