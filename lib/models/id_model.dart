import 'package:json_annotation/json_annotation.dart';
part 'id_model.g.dart';

@JsonSerializable()
class IdModel {
  String id;

  IdModel(this.id);

  factory IdModel.fromJson(Map<String, dynamic> json) => _$IdModelFromJson(json);

  Map<String, dynamic> toJson() => _$IdModelToJson(this);
}
