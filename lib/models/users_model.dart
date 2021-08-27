import 'package:json_annotation/json_annotation.dart';

part 'users_model.g.dart';

@JsonSerializable()

class UserModel {
  String username;
  String password;
  String? id;

  UserModel(this.username, this.password, this.id);

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}