// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tv_show_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TvShowDetail _$TvShowDetailFromJson(Map<String, dynamic> json) {
  return TvShowDetail(
    backdropPath: json['backdrop_path'] as String?,
    createdBy: (json['created_by'] as List<dynamic>?)
        ?.map((e) => CreatedBy.fromJson(e as Map<String, dynamic>))
        .toList(),
    episodeRunTime: (json['episode_run_time'] as List<dynamic>?)
        ?.map((e) => e as int?)
        .toList(),
    firstAirDate: json['first_air_date'] as String?,
    genres: (json['genres'] as List<dynamic>?)
        ?.map((e) => Genre.fromJson(e as Map<String, dynamic>))
        .toList(),
    homepage: json['homepage'] as String?,
    id: json['id'] as int?,
    inProduction: json['in_production'] as bool?,
    languages: (json['languages'] as List<dynamic>?)
        ?.map((e) => e as String?)
        .toList(),
    lastAirDate: json['last_air_date'] as String?,
    lastEpisodeToAir: json['last_episode_to_air'] == null
        ? null
        : LastEpisodeToAir.fromJson(
            json['last_episode_to_air'] as Map<String, dynamic>),
    name: json['name'] as String?,
    nextEpisodeToAir: json['next_episode_to_air'] == null
        ? null
        : NextEpisodeToAir.fromJson(
            json['next_episode_to_air'] as Map<String, dynamic>),
    networks: (json['networks'] as List<dynamic>?)
        ?.map((e) => Network.fromJson(e as Map<String, dynamic>))
        .toList(),
    numberOfEpisodes: json['number_of_episodes'] as int?,
    numberOfSeasons: json['number_of_seasons'] as int?,
    originCountry: (json['origin_country'] as List<dynamic>?)
        ?.map((e) => e as String?)
        .toList(),
    originalLanguage: json['original_language'] as String?,
    originalName: json['original_name'] as String?,
    overview: json['overview'] as String?,
    popularity: (json['popularity'] as num?)?.toDouble(),
    posterPath: json['poster_path'] as String?,
    productionCompanies: (json['production_companies'] as List<dynamic>?)
        ?.map((e) => ProductionCompany.fromJson(e as Map<String, dynamic>))
        .toList(),
    productionCountries: (json['production_countries'] as List<dynamic>?)
        ?.map((e) => ProductionCountry.fromJson(e as Map<String, dynamic>))
        .toList(),
    seasons: (json['seasons'] as List<dynamic>?)
        ?.map((e) => Season.fromJson(e as Map<String, dynamic>))
        .toList(),
    spokenLanguages: (json['spoken_languages'] as List<dynamic>?)
        ?.map((e) => SpokenLanguage.fromJson(e as Map<String, dynamic>))
        .toList(),
    status: json['status'] as String?,
    tagline: json['tagline'] as String?,
    type: json['type'] as String?,
    voteAverage: (json['vote_average'] as num?)?.toDouble(),
    voteCount: json['vote_count'] as int?,
  );
}

Map<String, dynamic> _$TvShowDetailToJson(TvShowDetail instance) =>
    <String, dynamic>{
      'backdrop_path': instance.backdropPath,
      'created_by': instance.createdBy?.map((e) => e.toJson()).toList(),
      'episode_run_time': instance.episodeRunTime,
      'first_air_date': instance.firstAirDate,
      'genres': instance.genres?.map((e) => e.toJson()).toList(),
      'homepage': instance.homepage,
      'id': instance.id,
      'in_production': instance.inProduction,
      'languages': instance.languages,
      'last_air_date': instance.lastAirDate,
      'last_episode_to_air': instance.lastEpisodeToAir?.toJson(),
      'name': instance.name,
      'next_episode_to_air': instance.nextEpisodeToAir?.toJson(),
      'networks': instance.networks?.map((e) => e.toJson()).toList(),
      'number_of_episodes': instance.numberOfEpisodes,
      'number_of_seasons': instance.numberOfSeasons,
      'origin_country': instance.originCountry,
      'original_language': instance.originalLanguage,
      'original_name': instance.originalName,
      'overview': instance.overview,
      'popularity': instance.popularity,
      'poster_path': instance.posterPath,
      'production_companies':
          instance.productionCompanies?.map((e) => e.toJson()).toList(),
      'production_countries':
          instance.productionCountries?.map((e) => e.toJson()).toList(),
      'seasons': instance.seasons?.map((e) => e.toJson()).toList(),
      'spoken_languages':
          instance.spokenLanguages?.map((e) => e.toJson()).toList(),
      'status': instance.status,
      'tagline': instance.tagline,
      'type': instance.type,
      'vote_average': instance.voteAverage,
      'vote_count': instance.voteCount,
    };
