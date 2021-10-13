// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cast_and_crew.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CastAndCrew _$CastAndCrewFromJson(Map<String, dynamic> json) {
  return CastAndCrew(
    id: json['id'] as int?,
    cast: (json['cast'] as List<dynamic>?)
        ?.map((e) => Cast.fromJson(e as Map<String, dynamic>))
        .toList(),
    crew: (json['crew'] as List<dynamic>?)
        ?.map((e) => Crew.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$CastAndCrewToJson(CastAndCrew instance) =>
    <String, dynamic>{
      'id': instance.id,
      'cast': instance.cast?.map((e) => e.toJson()).toList(),
      'crew': instance.crew?.map((e) => e.toJson()).toList(),
    };
