import 'package:json_annotation/json_annotation.dart';

part 'crew.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class Crew {
  late bool? video;
  late double? voteAverage;
  late String? overview;
  late String? releaseDate;
  late bool? adult;
  late String? backdropPath;
  late int? voteCount;
  late List<int?>? genreIds;
  late String? title;
  late String? originalLanguage;
  late String? originalTitle;
  late String? posterPath;
  late int? id;
  late double? popularity;
  late String? creditId;
  late String? department;
  late String? job;

  Crew({
    required this.adult,
    required this.backdropPath,
    required this.genreIds,
    required this.id,
    required this.originalLanguage,
    required this.originalTitle,
    required this.posterPath,
    required this.video,
    required this.voteAverage,
    required this.overview,
    required this.releaseDate,
    required this.voteCount,
    required this.title,
    required this.popularity,
    required this.creditId,
    required this.job,
    required this.department
  });

  factory Crew.fromJson(Map<String, dynamic> json) => _$CrewFromJson(json);

  Map<String, dynamic> toJson() => _$CrewToJson(this);
}
