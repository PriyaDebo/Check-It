import 'package:check_it/models/checklists_model.dart';
import 'package:check_it/screens/Newlist/components/body.dart';
import 'package:flutter/material.dart';

class NewList extends StatelessWidget {
  final String? id;
  final String username;
  final CheckListModel? checklist;
  const NewList(this.checklist, this.id, this.username);


  @override
  Widget build(BuildContext context) {
    return Body(checklist, id, username);
  }
}