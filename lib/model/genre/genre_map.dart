import 'package:json_annotation/json_annotation.dart';

part 'genre_map.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class GenreMap {
  late int? id;
  late String? name;

  GenreMap({
    required this.id,
    required this.name,
  });

  factory GenreMap.fromJson(Map<String, dynamic> json) =>
      _$GenreMapFromJson(json);

  Map<String, dynamic> toJson() => _$GenreMapToJson(this);
}
