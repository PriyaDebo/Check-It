import 'package:check_it/models/checklists_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'alllists_model.g.dart';


@JsonSerializable()
class AllListsModel {

  List<CheckListModel> lists;

  AllListsModel(this.lists);

  factory AllListsModel.fromJson(Map<String, dynamic> json) => _$AllListsModelFromJson(json);

  Map<String, dynamic> toJson() => _$AllListsModelToJson(this);

}