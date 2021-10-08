import 'package:json_annotation/json_annotation.dart';
import 'package:movie/model/search_person/result.dart';

part 'search_person.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class SearchPerson {
  late int? page;
  late List<Result>? results;
  late int? totalPages;
  late int? totalResults;

  SearchPerson({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  factory SearchPerson.fromJson(Map<String, dynamic> json) =>
      _$SearchPersonFromJson(json);

  Map<String, dynamic> toJson() => _$SearchPersonToJson(this);
}
