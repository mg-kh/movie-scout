// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Result _$ResultFromJson(Map<String, dynamic> json) {
  return Result(
    originalLanguage: json['original_language'] as String?,
    id: json['id'] as int?,
    originCountry: (json['origin_country'] as List<dynamic>?)
        ?.map((e) => e as String?)
        .toList(),
    voteAverage: (json['vote_average'] as num?)?.toDouble(),
    firstAirDate: json['first_air_date'] as String?,
    releaseDate: json['release_date'] as String?,
    voteCount: json['vote_count'] as int?,
    posterPath: json['poster_path'] as String?,
    overview: json['overview'] as String?,
    backdropPath: json['backdrop_path'] as String?,
    name: json['name'] as String?,
    title: json['title'] as String?,
    genreIds:
        (json['genre_ids'] as List<dynamic>?)?.map((e) => e as int?).toList(),
    originalName: json['original_name'] as String?,
    popularity: (json['popularity'] as num?)?.toDouble(),
    mediaType: json['media_type'] as String?,
  );
}

Map<String, dynamic> _$ResultToJson(Result instance) => <String, dynamic>{
      'original_language': instance.originalLanguage,
      'id': instance.id,
      'origin_country': instance.originCountry,
      'vote_average': instance.voteAverage,
      'first_air_date': instance.firstAirDate,
      'release_date': instance.releaseDate,
      'vote_count': instance.voteCount,
      'poster_path': instance.posterPath,
      'overview': instance.overview,
      'backdrop_path': instance.backdropPath,
      'name': instance.name,
      'title': instance.title,
      'genre_ids': instance.genreIds,
      'original_name': instance.originalName,
      'popularity': instance.popularity,
      'media_type': instance.mediaType,
    };
