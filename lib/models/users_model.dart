import 'package:json_annotation/json_annotation.dart';

part 'users_model.g.dart';

@JsonSerializable()

class UserModel {
  String? id;
  String username;
  String? password;


  UserModel(this.id, this.username, this.password);

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}