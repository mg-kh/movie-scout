import 'package:json_annotation/json_annotation.dart';
import 'package:movie/model/search_person/known_for.dart';

part 'result.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class Result {
  late bool? adult;
  late int? gender;
  late int? id;
  late List<KnownFor>? knownFor;
  late String? knownForDepartment;
  late String? name;
  late String? profilePath;

  Result({
    required this.adult,
    required this.gender,
    required this.id,
    required this.knownFor,
    required this.knownForDepartment,
    required this.name,
    required this.profilePath,
  });

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);

  Map<String, dynamic> toJson() => _$ResultToJson(this);
}
