import 'package:json_annotation/json_annotation.dart';

part 'cast_detail.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class CastDetail {
  late bool? adult;
  late List<String?>? alsoKnownAs;
  late String? biography;
  late String? birthday;
  late String? deathday;
  late int? gender;
  late String? homepage;
  late int? id;
  late String? imdbId;
  late String? knownForDepartment;
  late String? name;
  late String? placeOfBirth;
  late double? popularity;
  late String? profilePath;

  CastDetail({
    required this.adult,
    required this.alsoKnownAs,
    required this.biography,
    required this.birthday,
    required this.deathday,
    required this.gender,
    required this.homepage,
    required this.id,
    required this.imdbId,
    required this.knownForDepartment,
    required this.name,
    required this.placeOfBirth,
    required this.popularity,
    required this.profilePath,
  });

  factory CastDetail.fromJson(Map<String, dynamic> json) =>
      _$CastDetailFromJson(json);

  Map<String, dynamic> toJson() => _$CastDetailToJson(this);
}
