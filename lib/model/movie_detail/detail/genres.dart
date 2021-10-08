import 'package:json_annotation/json_annotation.dart';

part 'genres.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class Genres {
  late int? id;
  late String? name;

  Genres({
    required this.id,
    required this.name,
  });

  factory Genres.fromJson(Map<String, dynamic> json) =>
      _$GenresFromJson(json);

  Map<String, dynamic> toJson() => _$GenresToJson(this);
}
