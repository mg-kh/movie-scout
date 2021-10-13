import 'package:json_annotation/json_annotation.dart';
import 'package:movie/model/popular_tv_show/result.dart';

part 'popular_tv_show.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class PopularTvShow {
  late int? page;
  late List<Result>? results;
  late int? totalPages;
  late int? totalResults;

  PopularTvShow({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  factory PopularTvShow.fromJson(Map<String, dynamic> json) =>
      _$PopularTvShowFromJson(json);

  Map<String, dynamic> toJson() => _$PopularTvShowToJson(this);
}
