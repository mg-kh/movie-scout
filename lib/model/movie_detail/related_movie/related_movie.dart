import 'package:json_annotation/json_annotation.dart';
import 'package:movie/model/movie_detail/related_movie/result.dart';

part 'related_movie.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class RelatedMovie {
  late int? page;
  late List<Result>? results;
  late int? totalPages;
  late int? totalResults;

  RelatedMovie({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  factory RelatedMovie.fromJson(Map<String, dynamic> json) =>
      _$RelatedMovieFromJson(json);

  Map<String, dynamic> toJson() => _$RelatedMovieToJson(this);
}
