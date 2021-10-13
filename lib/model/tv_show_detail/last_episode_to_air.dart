import 'package:json_annotation/json_annotation.dart';

part 'last_episode_to_air.g.dart';

@JsonSerializable()
class LastEpisodeToAir {
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

  LastEpisodeToAir({
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

  factory LastEpisodeToAir.fromJson(Map<String, dynamic> json) =>
      _$LastEpisodeToAirFromJson(json);

  Map<String, dynamic> toJson() => _$LastEpisodeToAirToJson(this);
}
