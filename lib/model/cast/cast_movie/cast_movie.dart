import 'package:json_annotation/json_annotation.dart';
import 'package:movie/model/cast/cast_movie/cast.dart';
import 'package:movie/model/cast/cast_movie/crew.dart';

part 'cast_movie.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class CastMovie {
  late int? id;
  late List<Cast>? cast;
  late List<Crew>? crew;

  CastMovie({
    required this.id,
    required this.cast,
    required this.crew,
  });

  factory CastMovie.fromJson(Map<String, dynamic> json) =>
      _$CastMovieFromJson(json);

  Map<String, dynamic> toJson() => _$CastMovieToJson(this);
}
