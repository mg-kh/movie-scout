import 'package:json_annotation/json_annotation.dart';

part 'belong_to_collection.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class BelongToCollection {
  late int? id;
  late String? name;
  late String? posterPath;
  late String? backdropPath;

  BelongToCollection({
    required this.id,
    required this.name,
    required this.posterPath,
    required this.backdropPath,
  });

  factory BelongToCollection.fromJson(Map<String, dynamic> json) =>
      _$BelongToCollectionFromJson(json);

  Map<String, dynamic> toJson() => _$BelongToCollectionToJson(this);
}
