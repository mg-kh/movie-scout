import 'package:json_annotation/json_annotation.dart';

part 'production_countries.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class ProductionCountries {
  late String? iso_3166_1;
  late String? name;

  ProductionCountries({
    required this.iso_3166_1,
    required this.name,
  });

  factory ProductionCountries.fromJson(Map<String, dynamic> json) =>
      _$ProductionCountriesFromJson(json);

  Map<String, dynamic> toJson() => _$ProductionCountriesToJson(this);
}
