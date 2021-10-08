// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'genre.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Genre _$GenreFromJson(Map<String, dynamic> json) {
  return Genre(
    genres: (json['genres'] as List<dynamic>?)
        ?.map((e) => GenreMap.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$GenreToJson(Genre instance) => <String, dynamic>{
      'genres': instance.genres?.map((e) => e.toJson()).toList(),
    };
