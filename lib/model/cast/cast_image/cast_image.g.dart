// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cast_image.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CastImage _$CastImageFromJson(Map<String, dynamic> json) {
  return CastImage(
    id: json['id'] as int?,
    profiles: (json['profiles'] as List<dynamic>?)
        ?.map((e) => Profiles.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$CastImageToJson(CastImage instance) => <String, dynamic>{
      'id': instance.id,
      'profiles': instance.profiles?.map((e) => e.toJson()).toList(),
    };
