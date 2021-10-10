import 'package:json_annotation/json_annotation.dart';
import 'package:movie/model/trending/result.dart';


part 'trending.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class Trending {
  late int? page;
  late List<Result>? results;
  late int? totalPages;
  late int? totalResults;

  Trending({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  factory Trending.fromJson(Map<String, dynamic> json) =>
      _$TrendingFromJson(json);

  Map<String, dynamic> toJson() => _$TrendingToJson(this);
}
