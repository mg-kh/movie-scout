import 'package:json_annotation/json_annotation.dart';

part 'result.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class Result {
  late String? iso_639_1;
  late String? iso_3166_1;
  late String? name;
  late String? key;
  late String? site;
  late int? size;
  late String? type;
  late bool? official;
  late String? publishedAt;
  late String? id;

  Result({
    required this.iso_639_1,
    required this.iso_3166_1,
    required this.name,
    required this.key,
    required this.site,
    required this.size,
    required this.type,
    required this.official,
    required this.publishedAt,
    required this.id,
  });

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);

  Map<String, dynamic> toJson() => _$ResultToJson(this);
}
