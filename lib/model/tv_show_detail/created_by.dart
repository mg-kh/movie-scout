import 'package:json_annotation/json_annotation.dart';

part 'created_by.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class CreatedBy {
  late int? id;
  late String? creditId;
  late String? name;
  late int? gender;
  late String? profilePath;

  CreatedBy({
    required this.id,
    required this.creditId,
    required this.name,
    required this.gender,
    required this.profilePath,
  });

  factory CreatedBy.fromJson(Map<String, dynamic> json) =>
      _$CreatedByFromJson(json);

  Map<String, dynamic> toJson() => _$CreatedByToJson(this);
}
