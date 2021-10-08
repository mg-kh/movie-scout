import 'package:json_annotation/json_annotation.dart';
import 'package:movie/model/movie/result.dart';

part 'movie.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class Movie {
  late int? page;
  late List<Result>? results;
  late int? totalPages;
  late int? totalResults;

  Movie({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);

  Map<String, dynamic> toJson() => _$MovieToJson(this);
}
