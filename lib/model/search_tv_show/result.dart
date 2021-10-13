import 'package:json_annotation/json_annotation.dart';

part 'result.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class Result {
  late String? backdropPath;
  late String? firstAirDate;
  late List<int?>? genreIds;
  late int? id;
  late String? name;
  late List<String?>? originCountry;
  late String? originalLanguage;
  late String? originalName;
  late String? overview;
  late double? popularity;
  late String? posterPath;
  late double? voteAverage;
  late int? voteCount;

  Result({
    required this.backdropPath,
    required this.firstAirDate,
    required this.genreIds,
    required this.id,
    required this.name,
    required this.originCountry,
    required this.originalLanguage,
    required this.originalName,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.voteAverage,
    required this.voteCount,
  });

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);

  Map<String, dynamic> toJson() => _$ResultToJson(this);
}
