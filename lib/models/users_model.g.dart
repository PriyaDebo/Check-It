// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return UserModel(
    UserNameModel.fromJson(json['username'] as Map<String, dynamic>),
    PasswordModel.fromJson(json['password'] as Map<String, dynamic>),
    IdModel.fromJson(json['id'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'username': instance.username,
      'password': instance.password,
      'id': instance.id,
    };
