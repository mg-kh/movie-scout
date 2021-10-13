import 'package:json_annotation/json_annotation.dart';

part 'crew.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class Crew {
  late bool? adult;
  late int? gender;
  late int? id;
  late String? knownForDepartment;
  late String? name;
  late String? originalName;
  late double? popularity;
  late String? profilePath;
  late String? creditId;
  late String? department;
  late String? job;

  Crew({
    required this.adult,
    required this.gender,
    required this.id,
    required this.knownForDepartment,
    required this.name,
    required this.originalName,
    required this.popularity,
    required this.profilePath,
    required this.creditId,
    required this.department,
    required this.job,
  });


  factory Crew.fromJson(Map<String, dynamic> json) => _$CrewFromJson(json);

  Map<String, dynamic> toJson() => _$CrewToJson(this);
}
