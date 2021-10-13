import 'package:json_annotation/json_annotation.dart';

part 'cast.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class Cast {
  late bool? adult;
  late int? gender;
  late int? id;
  late String? knownForDepartment;
  late String? name;
  late String? originalName;
  late double? popularity;
  late String? profilePath;
  late String? character;
  late String? creditId;
  late int? order;

  Cast({
    required this.adult,
    required this.gender,
    required this.id,
    required this.knownForDepartment,
    required this.name,
    required this.originalName,
    required this.popularity,
    required this.profilePath,
    required this.character,
    required this.creditId,
    required this.order,
  });


  factory Cast.fromJson(Map<String, dynamic> json) => _$CastFromJson(json);

  Map<String, dynamic> toJson() => _$CastToJson(this);
}
