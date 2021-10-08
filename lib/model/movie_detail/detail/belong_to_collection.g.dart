// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'belong_to_collection.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BelongToCollection _$BelongToCollectionFromJson(Map<String, dynamic> json) {
  return BelongToCollection(
    id: json['id'] as int?,
    name: json['name'] as String?,
    posterPath: json['poster_path'] as String?,
    backdropPath: json['backdrop_path'] as String?,
  );
}

Map<String, dynamic> _$BelongToCollectionToJson(BelongToCollection instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'poster_path': instance.posterPath,
      'backdrop_path': instance.backdropPath,
    };
