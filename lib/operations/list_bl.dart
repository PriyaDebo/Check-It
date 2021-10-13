import 'dart:convert';

import 'package:check_it/all_components/checklist_item.dart';
import 'package:check_it/client/list_service.dart';
import 'package:check_it/models/alllists_model.dart';
import 'package:check_it/models/items_model.dart';

class ListBl {
  ListService listService = new ListService();

  Future<bool> createList(String userId, String listName, Map<String, ChecklistItem> items) async {
    List<ItemsModel> listItems = [];
    for (int i = 0; i < items.length; i++) {
      print(items.values.elementAt(i).item.text.trim());
      listItems.elementAt(i).itemName = items.values.elementAt(i).item.text.trim();
      listItems.elementAt(i).isChecked = items.values.elementAt(i).isChecked;
      print(items.values);
    }
    final res = await listService.createList(null, userId, listName, listItems);
    print("here");
    print(res);
    return res == 200;
  }

  Future<AllListsModel> getAllList(String userId) async {
     final res = await listService.getAllList(userId);
     final responseJson = jsonDecode(res.body);
     return AllListsModel.fromJson(responseJson);
  }
}

