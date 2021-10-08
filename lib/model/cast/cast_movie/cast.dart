import 'package:json_annotation/json_annotation.dart';

part 'cast.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class Cast {
  late bool? adult;
  late String? backdropPath;
  late List<int?>? genreIds;
  late int? id;
  late String? originalLanguage;
  late String? originalTitle;
  late String? posterPath;
  late bool? video;
  late double? voteAverage;
  late String? overview;
  late String? releaseDate;
  late int? voteCount;
  late String? title;
  late double? popularity;
  late String? character;
  late String? creditId;
  late int? order;

  Cast({
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
    required this.character,
    required this.creditId,
    required this.order,
  });

  factory Cast.fromJson(Map<String, dynamic> json) => _$CastFromJson(json);

  Map<String, dynamic> toJson() => _$CastToJson(this);
}
