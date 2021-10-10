import 'package:json_annotation/json_annotation.dart';

part 'result.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class Result {
  late String? originalLanguage;
  late int? id;
  late List<String?>? originCountry;
  late double? voteAverage;
  late String? firstAirDate;
  late String? releaseDate;
  late int? voteCount;
  late String? posterPath;
  late String? overview;
  late String? backdropPath;
  late String? name;
  late String? title;
  late List<int?>? genreIds;
  late String? originalName;
  late double? popularity;
  late String? mediaType;

  Result({
    required this.originalLanguage,
    required this.id,
    required this.originCountry,
    required this.voteAverage,
    required this.firstAirDate,
    required this.releaseDate,
    required this.voteCount,
    required this.posterPath,
    required this.overview,
    required this.backdropPath,
    required this.name,
    required this.title,
    required this.genreIds,
    required this.originalName,
    required this.popularity,
    required this.mediaType,
  });

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);

  Map<String, dynamic> toJson() => _$ResultToJson(this);
}
