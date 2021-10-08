import 'package:json_annotation/json_annotation.dart';
import 'package:movie/model/genre/genre_map.dart';

part 'genre.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class Genre {
  late List<GenreMap>? genres;

  Genre({
    required this.genres,
  });

  factory Genre.fromJson(Map<String, dynamic> json) => _$GenreFromJson(json);

  Map<String, dynamic> toJson() => _$GenreToJson(this);
}
