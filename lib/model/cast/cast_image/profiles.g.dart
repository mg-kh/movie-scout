// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profiles.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Profiles _$ProfilesFromJson(Map<String, dynamic> json) {
  return Profiles(
    aspectRatio: (json['aspect_ratio'] as num?)?.toDouble(),
    height: json['height'] as int?,
    iso_639_1: json['iso_639_1'] as String?,
    filePath: json['file_path'] as String?,
    voteAverage: (json['vote_average'] as num?)?.toDouble(),
    voteCount: json['vote_count'] as int?,
    width: json['width'] as int?,
  );
}

Map<String, dynamic> _$ProfilesToJson(Profiles instance) => <String, dynamic>{
      'aspect_ratio': instance.aspectRatio,
      'height': instance.height,
      'iso_639_1': instance.iso_639_1,
      'file_path': instance.filePath,
      'vote_average': instance.voteAverage,
      'vote_count': instance.voteCount,
      'width': instance.width,
    };
