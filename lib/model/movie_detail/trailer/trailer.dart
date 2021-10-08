import 'package:json_annotation/json_annotation.dart';
import 'package:movie/model/movie_detail/trailer/result.dart';

part 'trailer.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class Trailer {
  late int? id;
  late List<Result>? results;

  Trailer({
    required this.id,
    required this.results,
  });

  factory Trailer.fromJson(Map<String, dynamic> json) =>
      _$TrailerFromJson(json);

  Map<String, dynamic> toJson() => _$TrailerToJson(this);
}
