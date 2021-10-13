// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'next_episode_to_air.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NextEpisodeToAir _$NextEpisodeToAirFromJson(Map<String, dynamic> json) {
  return NextEpisodeToAir(
    airDate: json['airDate'] as String?,
    episodeNumber: json['episodeNumber'] as int?,
    id: json['id'] as int?,
    name: json['name'] as String?,
    overview: json['overview'] as String?,
    productionCode: json['productionCode'] as String?,
    seasonNumber: json['seasonNumber'] as int?,
    stillPath: json['stillPath'] as String?,
    voteAverage: (json['voteAverage'] as num?)?.toDouble(),
    voteCount: json['voteCount'] as int?,
  );
}

Map<String, dynamic> _$NextEpisodeToAirToJson(NextEpisodeToAir instance) =>
    <String, dynamic>{
      'airDate': instance.airDate,
      'episodeNumber': instance.episodeNumber,
      'id': instance.id,
      'name': instance.name,
      'overview': instance.overview,
      'productionCode': instance.productionCode,
      'seasonNumber': instance.seasonNumber,
      'stillPath': instance.stillPath,
      'voteAverage': instance.voteAverage,
      'voteCount': instance.voteCount,
    };
