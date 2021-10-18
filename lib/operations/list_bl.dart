import 'dart:convert';

import 'package:check_it/all_components/checklist_item.dart';
import 'package:check_it/client/list_service.dart';
import 'package:check_it/models/alllists_model.dart';
import 'package:check_it/models/items_model.dart';

class ListBl {
  ListService listService = new ListService();

  Future<bool> createList(String userId, String listName, Map<String, ChecklistItem> items) async {
    List<ItemsModel> listItems = [];
    items.forEach((key, value) {
      var item = ItemsModel(value.item.text.trim(), value.isChecked);
      listItems.add(item);
    });
    final res = await listService.createList(null, userId, listName, listItems);
    return res == 200;
  }

  Future<AllListsModel> getAllList(String userId) async {
     final res = await listService.getAllList(userId);
     final responseJson = jsonDecode(res.body);
     return AllListsModel.fromJson(responseJson);
  }

  Future<bool> updateList(String id, String userId, String listName, Map<String, ChecklistItem> items) async {
    List<ItemsModel> listItems = [];
    items.forEach((key, value) {
      var item = ItemsModel(value.item.text.trim(), value.isChecked);
      listItems.add(item);
    });
    final res = await listService.updateList(id, userId, listName, listItems);
    return res == 200;
  }

  Future<bool> deleteList(String id) async {
    final res = await listService.deleteList(id);
    return res == 200;
  }


}

