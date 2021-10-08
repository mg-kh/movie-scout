import 'package:json_annotation/json_annotation.dart';

part 'production_companies.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class ProductionCompanies {
  late int? id;
  late String? name;
  late String? logoPath;
  late String? originCountry;

  ProductionCompanies({
    required this.id,
    required this.name,
    required this.logoPath,
    required this.originCountry,
  });

  factory ProductionCompanies.fromJson(Map<String, dynamic> json) =>
      _$ProductionCompaniesFromJson(json);

  Map<String, dynamic> toJson() => _$ProductionCompaniesToJson(this);
}
