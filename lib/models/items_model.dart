import 'package:json_annotation/json_annotation.dart';

part 'items_model.g.dart';

@JsonSerializable()
class ItemsModel{
  String itemName;
  bool isChecked;

  ItemsModel(this.itemName, this.isChecked);

  factory ItemsModel.fromJson(Map<String, dynamic> json) => _$ItemsModelFromJson(json);

  Map<String, dynamic> toJson() => _$ItemsModelToJson(this);
}