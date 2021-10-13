import 'dart:async';
import 'dart:convert';

import 'package:check_it/models/checklists_model.dart';
import 'package:check_it/models/items_model.dart';
import 'package:http/http.dart' as http;

class ListService {
  final uriLink = "http://192.168.0.106:3000/checklists";
  final header = <String, String>{'Content-Type': 'application/json; charset=UTF-8',};

  Future<int> createList(String? id, String userId, String name, List<ItemsModel> items) async {
    var checklist = new CheckListModel(id, userId, name, items);
    final uri = uriLink + "/create";
    final response = await http.put(
      Uri.parse(uri),
      headers: header,
      body: jsonEncode(checklist.toJson()),
    );
    return response.statusCode;
  }

  Future<CheckListModel> updateList(String id, String userId, String name, List<ItemsModel> items) async {
    var checklist = new CheckListModel(id, userId, name, items);
    final uri = uriLink + "/update/id/" + id;
    final response = await http.patch(
      Uri.parse(uri),
      headers: header,
      body: jsonEncode(checklist.toJson()),
    );
    final responseJson = jsonDecode(response.body);
    return CheckListModel.fromJson(responseJson);
  }

  Future<bool> deleteList(String id, String userId, String name, List<ItemsModel> items) async {
    var checklist = new CheckListModel(id, userId, name, items);
    final uri = uriLink + "/update";
    final response = await http.patch(
      Uri.parse(uri),
      headers: header,
      body: jsonEncode(checklist.toJson()),
    );
    return response.statusCode == 200;
  }

  Future<http.Response> getAllList(String id) async {
    final uri = uriLink + "/getAll/id/" + id;
    final response = await http.get(
      Uri.parse(uri),
      headers: header,
    );
    return response;
  }
}