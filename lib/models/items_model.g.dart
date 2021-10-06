// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'items_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemsModel _$ItemsModelFromJson(Map<String, dynamic> json) {
  return ItemsModel(
    json['itemName'] as String,
    json['isChecked'] as bool,
  );
}

Map<String, dynamic> _$ItemsModelToJson(ItemsModel instance) =>
    <String, dynamic>{
      'itemName': instance.itemName,
      'isChecked': instance.isChecked,
    };
