import 'package:json_annotation/json_annotation.dart';
import 'package:movie/model/movie_detail/cast/cast_model.dart';
import 'package:movie/model/movie_detail/cast/crew_model.dart';

part 'cast.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class Cast {
  late int? id;
  late List<CastModel>? cast;
  late List<CrewModel>? crew;

  Cast({
    required this.id,
    required this.cast,
    required this.crew,
  });

  factory Cast.fromJson(Map<String, dynamic> json) => _$CastFromJson(json);

  Map<String, dynamic> toJson() => _$CastToJson(this);
}
