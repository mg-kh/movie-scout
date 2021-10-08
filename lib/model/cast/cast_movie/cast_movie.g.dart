// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cast_movie.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CastMovie _$CastMovieFromJson(Map<String, dynamic> json) {
  return CastMovie(
    id: json['id'] as int?,
    cast: (json['cast'] as List<dynamic>?)
        ?.map((e) => Cast.fromJson(e as Map<String, dynamic>))
        .toList(),
    crew: (json['crew'] as List<dynamic>?)
        ?.map((e) => Crew.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$CastMovieToJson(CastMovie instance) => <String, dynamic>{
      'id': instance.id,
      'cast': instance.cast?.map((e) => e.toJson()).toList(),
      'crew': instance.crew?.map((e) => e.toJson()).toList(),
    };
