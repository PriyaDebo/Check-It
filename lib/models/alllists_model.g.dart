// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alllists_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AllListsModel _$AllListsModelFromJson(Map<String, dynamic> json) {
  return AllListsModel(
    (json['allLists'] as List<dynamic>)
        .map((e) => CheckListModel.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$AllListsModelToJson(AllListsModel instance) =>
    <String, dynamic>{
      'allLists': instance.allLists,
    };
