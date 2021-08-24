import 'package:check_it/models/id_model.dart';
import 'package:check_it/models/password_model.dart';
import 'package:check_it/models/username_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'users_model.g.dart';

@JsonSerializable()

class UserModel {
  UserNameModel username;
  PasswordModel password;
  IdModel id;

  UserModel(this.username, this.password, this.id);

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}