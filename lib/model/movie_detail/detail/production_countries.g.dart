// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'production_countries.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductionCountries _$ProductionCountriesFromJson(Map<String, dynamic> json) {
  return ProductionCountries(
    iso_3166_1: json['iso_3166_1'] as String?,
    name: json['name'] as String?,
  );
}

Map<String, dynamic> _$ProductionCountriesToJson(
        ProductionCountries instance) =>
    <String, dynamic>{
      'iso_3166_1': instance.iso_3166_1,
      'name': instance.name,
    };
