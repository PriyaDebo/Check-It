import 'package:check_it/screens/Newlist/components/body.dart';
import 'package:flutter/material.dart';

class NewList extends StatelessWidget {
  final String? id;
  final String username;
  const NewList(this.id, this.username);


  @override
  Widget build(BuildContext context) {
    return Body(id, username);
  }
}