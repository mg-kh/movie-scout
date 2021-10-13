import 'package:json_annotation/json_annotation.dart';

part 'next_episode_to_air.g.dart';

@JsonSerializable()
class NextEpisodeToAir {
  late String? airDate;
  late int? episodeNumber;
  late int? id;
  late String? name;
  late String? overview;
  late String? productionCode;
  late int? seasonNumber;
  late String? stillPath;
  late double? voteAverage;
  late int? voteCount;

  NextEpisodeToAir({
    required this.airDate,
    required this.episodeNumber,
    required this.id,
    required this.name,
    required this.overview,
    required this.productionCode,
    required this.seasonNumber,
    required this.stillPath,
    required this.voteAverage,
    required this.voteCount,
  });

  factory NextEpisodeToAir.fromJson(Map<String, dynamic> json) =>
      _$NextEpisodeToAirFromJson(json);

  Map<String, dynamic> toJson() => _$NextEpisodeToAirToJson(this);
}
