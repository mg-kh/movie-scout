import 'package:json_annotation/json_annotation.dart';

part 'seasons.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class Season {
  late String? airDate;
  late int? episodeCount;
  late int? id;
  late String? name;
  late String? overview;
  late String? posterPath;
  late int? seasonNumber;

  Season({
    required this.airDate,
    required this.episodeCount,
    required this.id,
    required this.name,
    required this.overview,
    required this.posterPath,
    required this.seasonNumber,
  });

  factory Season.fromJson(Map<String, dynamic> json) => _$SeasonFromJson(json);

  Map<String, dynamic> toJson() => _$SeasonToJson(this);
}
