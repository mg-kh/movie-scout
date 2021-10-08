import 'package:json_annotation/json_annotation.dart';

part 'result.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class Result {
  late bool? adult;
  late String? backdropPath;
  late List<int?> genreIds;
  late int? id;
  late String? originalLanguage;
  late String? originalTitle;
  late String? overview;
  late double? popularity;
  late String? posterPath;
  late String? releaseDate;
  late String? title;
  late bool? video;
  late double? voteAverage;
  late int? voteCount;

  Result({
    required this.adult,
    required this.backdropPath,
    required this.genreIds,
    required this.id,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.releaseDate,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);

  Map<String, dynamic> toJson() => _$ResultToJson(this);
}
