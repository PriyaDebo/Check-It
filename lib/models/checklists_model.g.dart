// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'checklists_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CheckListModel _$CheckListModelFromJson(Map<String, dynamic> json) {
  return CheckListModel(
    json['id'] as String?,
    json['userId'] as String,
    json['name'] as String,
    (json['items'] as List<dynamic>)
        .map((e) => ItemsModel.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$CheckListModelToJson(CheckListModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'name': instance.name,
      'items': instance.items,
    };
