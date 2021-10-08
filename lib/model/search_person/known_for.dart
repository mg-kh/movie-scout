import 'package:json_annotation/json_annotation.dart';

part 'known_for.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)

class KnownFor{
  late String? backdropPath;
  late String? firstAirDate;
  late List<int?>? genreIds;
  late int? id;
  late String? mediaType;
  late String? name;
  late List<String?>? originCountry;
  late String? originalLanguage;
  late String? originalName;
  late String? overview;
  late String? posterPath;
  late double? voteAverage;
  late int? voteCount;


  KnownFor({
    required this.backdropPath,
    required this.firstAirDate,
    required this.genreIds,
    required this.id,
    required this.mediaType,
    required this.name,
    required this.originCountry,
    required this.originalLanguage,
    required this.originalName,
    required this.overview,
    required this.posterPath,
    required this.voteAverage,
    required this.voteCount,
});


factory KnownFor.fromJson(Map<String, dynamic> json) => _$KnownForFromJson(json);

Map<String, dynamic> toJson() => _$KnownForToJson(this);
}