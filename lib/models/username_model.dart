import 'package:json_annotation/json_annotation.dart';
part 'username_model.g.dart';

@JsonSerializable()
class UserNameModel {
  String username;

  UserNameModel(
    this.username,
  );

  factory UserNameModel.fromJson(Map<String, dynamic> json) => _$UserNameModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserNameModelToJson(this);

}