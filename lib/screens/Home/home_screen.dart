import 'package:flutter/material.dart';
import 'package:check_it/screens/Home/components/body.dart';

class HomeScreen extends StatelessWidget {
  final String? userId;
  final String username;

  const HomeScreen(this.userId, this.username);


  @override
  Widget build(BuildContext context) {
    return Body(userId, username);
  }
}