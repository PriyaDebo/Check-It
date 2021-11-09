import 'package:json_annotation/json_annotation.dart';
import 'items_model.dart';

part 'checklists_model.g.dart';

@JsonSerializable()
class CheckListModel {
  String? id;
  String userId;
  String name;
  List<ItemsModel> items;

  CheckListModel(this.id, this.userId, this.name,  this.items);

  factory CheckListModel.fromJson(Map<String, dynamic> json) => _$CheckListModelFromJson(json);

  Map<String, dynamic> toJson() => _$CheckListModelToJson(this);
}