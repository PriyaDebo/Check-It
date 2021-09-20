import 'package:check_it/operations/user_bl.dart';
import 'package:flutter/material.dart';
import 'package:check_it/Screens/Login/components/body.dart';

class LoginScreen extends StatelessWidget {

  final UserBl userBl;

  const LoginScreen(this.userBl);

  @override
  Widget build(BuildContext context) {
    return Body(userBl);
  }
}