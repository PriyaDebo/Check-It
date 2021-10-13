import 'package:flutter/material.dart';
import 'package:check_it/screens/Home/components/body.dart';

class HomeScreen extends StatelessWidget {
  final String? result;
  final String username;

  const HomeScreen(this.result, this.username);


  @override
  Widget build(BuildContext context) {
    return Body(result, username);
  }
}