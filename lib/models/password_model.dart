import 'package:json_annotation/json_annotation.dart';
part 'password_model.g.dart';

@JsonSerializable()
class PasswordModel {
  String password;

  PasswordModel(this.password);

  factory PasswordModel.fromJson(Map<String, dynamic> json) => _$PasswordModelFromJson(json);

  Map<String, dynamic> toJson() => _$PasswordModelToJson(this);
}
