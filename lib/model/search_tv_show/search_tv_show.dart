import 'package:json_annotation/json_annotation.dart';
import 'package:movie/model/search_tv_show/result.dart';

part 'search_tv_show.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class SearchTvShow {
  late int? page;
  late List<Result>? results;
  late int? totalPages;
  late int? totalResults;

  SearchTvShow({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  factory SearchTvShow.fromJson(Map<String, dynamic> json) =>
      _$SearchTvShowFromJson(json);

  Map<String, dynamic> toJson() => _$SearchTvShowToJson(this);
}
