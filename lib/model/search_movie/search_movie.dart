import 'package:json_annotation/json_annotation.dart';
import 'package:movie/model/search_movie/result.dart';

part 'search_movie.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class SearchMovie {
  late int? page;
  late List<Result> results;
  late int? totalPages;
  late int? totalResults;

  SearchMovie({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  factory SearchMovie.fromJson(Map<String, dynamic> json) => _$SearchMovieFromJson(json);

  Map<String, dynamic> toJson() => _$SearchMovieToJson(this);
}
