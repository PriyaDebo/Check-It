import 'package:check_it/all_components/checklist_item.dart';
import 'package:check_it/client/list_service.dart';
import 'package:check_it/models/items_model.dart';
import 'package:check_it/operations/secure_bl.dart';
import 'package:http/http.dart';

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

  Future<Response> getAllList() async {
    String? value = await UserSecureStorage.getToken();
    final res = await listService.getAllList(value.toString());
    return res;
  }

  Future<int> updateList(String id, String userId, String listName, Map<String, ChecklistItem> items) async {
    String? value = await UserSecureStorage.getToken();
    List<ItemsModel> listItems = [];
    items.forEach((key, value) {
      var item = ItemsModel(value.item.text.trim(), value.isChecked);
      listItems.add(item);
    });
    final res = await listService.updateList(value.toString(), id, userId, listName, listItems);
    return res;
  }

  Future<int> deleteList(String id) async {
    String? value = await UserSecureStorage.getToken();
    final res = await listService.deleteList(id, value.toString());
    return res;
  }


}

