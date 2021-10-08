// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Result _$ResultFromJson(Map<String, dynamic> json) {
  return Result(
    adult: json['adult'] as bool?,
    gender: json['gender'] as int?,
    id: json['id'] as int?,
    knownFor: (json['known_for'] as List<dynamic>?)
        ?.map((e) => KnownFor.fromJson(e as Map<String, dynamic>))
        .toList(),
    knownForDepartment: json['known_for_department'] as String?,
    name: json['name'] as String?,
    profilePath: json['profile_path'] as String?,
  );
}

Map<String, dynamic> _$ResultToJson(Result instance) => <String, dynamic>{
      'adult': instance.adult,
      'gender': instance.gender,
      'id': instance.id,
      'known_for': instance.knownFor?.map((e) => e.toJson()).toList(),
      'known_for_department': instance.knownForDepartment,
      'name': instance.name,
      'profile_path': instance.profilePath,
    };
