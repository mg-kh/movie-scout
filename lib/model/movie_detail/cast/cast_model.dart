import 'package:json_annotation/json_annotation.dart';

part 'cast_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class CastModel {
  late bool? adult;
  late int? gender;
  late int? id;
  late String? knownForDepartment;
  late String? name;
  late String? originalName;
  late double? popularity;
  late String? profilePath;
  late int? castId;
  late String? character;
  late String? creditId;
  late int? order;

  CastModel({
    required this.adult,
    required this.gender,
    required this.id,
    required this.knownForDepartment,
    required this.name,
    required this.originalName,
    required this.popularity,
    required this.profilePath,
    required this.castId,
    required this.character,
    required this.creditId,
    required this.order,
  });


  factory CastModel.fromJson(Map<String, dynamic> json) => _$CastModelFromJson(json);

  Map<String, dynamic> toJson() => _$CastModelToJson(this);
}
