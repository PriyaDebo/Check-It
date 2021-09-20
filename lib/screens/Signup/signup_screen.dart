import 'package:check_it/operations/user_bl.dart';
import 'package:flutter/material.dart';
import 'package:check_it/Screens/Signup//components/body.dart';

class SignUpScreen extends StatelessWidget {

  final UserBl userBl;

  const SignUpScreen(this.userBl);


  @override
  Widget build(BuildContext context) {
    return Body(userBl);
  }
}