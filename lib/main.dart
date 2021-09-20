import 'package:check_it/Screens/Login/login_screen.dart';
import 'package:check_it/constants.dart';
import 'package:check_it/operations/user_bl.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  final UserBl userBl = new UserBl();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Check It!',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: kDarkBlue,
        scaffoldBackgroundColor: kWhite,
      ),
      home: LoginScreen(userBl),
    );
  }
}
