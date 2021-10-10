import 'package:json_annotation/json_annotation.dart';
import 'package:movie/model/popular/result.dart';

part 'popular.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class Popular {
  late int? page;
  late List<Result>? results;
  late int? totalPages;
  late int? totalResults;

  Popular({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  factory Popular.fromJson(Map<String, dynamic> json) =>
      _$PopularFromJson(json);

  Map<String, dynamic> toJson() => _$PopularToJson(this);
}
