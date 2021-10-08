// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crew.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Crew _$CrewFromJson(Map<String, dynamic> json) {
  return Crew(
    adult: json['adult'] as bool?,
    backdropPath: json['backdrop_path'] as String?,
    genreIds:
        (json['genre_ids'] as List<dynamic>?)?.map((e) => e as int?).toList(),
    id: json['id'] as int?,
    originalLanguage: json['original_language'] as String?,
    originalTitle: json['original_title'] as String?,
    posterPath: json['poster_path'] as String?,
    video: json['video'] as bool?,
    voteAverage: (json['vote_average'] as num?)?.toDouble(),
    overview: json['overview'] as String?,
    releaseDate: json['release_date'] as String?,
    voteCount: json['vote_count'] as int?,
    title: json['title'] as String?,
    popularity: (json['popularity'] as num?)?.toDouble(),
    creditId: json['credit_id'] as String?,
    job: json['job'] as String?,
    department: json['department'] as String?,
  );
}

Map<String, dynamic> _$CrewToJson(Crew instance) => <String, dynamic>{
      'video': instance.video,
      'vote_average': instance.voteAverage,
      'overview': instance.overview,
      'release_date': instance.releaseDate,
      'adult': instance.adult,
      'backdrop_path': instance.backdropPath,
      'vote_count': instance.voteCount,
      'genre_ids': instance.genreIds,
      'title': instance.title,
      'original_language': instance.originalLanguage,
      'original_title': instance.originalTitle,
      'poster_path': instance.posterPath,
      'id': instance.id,
      'popularity': instance.popularity,
      'credit_id': instance.creditId,
      'department': instance.department,
      'job': instance.job,
    };
