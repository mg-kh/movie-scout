import 'package:json_annotation/json_annotation.dart';
import 'package:movie/model/tv_show_detail/cast_and_crew/cast.dart';
import 'package:movie/model/tv_show_detail/cast_and_crew/crew.dart';

part 'cast_and_crew.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class CastAndCrew {
  late int? id;
  late List<Cast>? cast;
  late List<Crew>? crew;

  CastAndCrew({
    required this.id,
    required this.cast,
    required this.crew,
  });

  factory CastAndCrew.fromJson(Map<String, dynamic> json) => _$CastAndCrewFromJson(json);

  Map<String, dynamic> toJson() => _$CastAndCrewToJson(this);
}
