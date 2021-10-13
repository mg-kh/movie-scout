import 'package:json_annotation/json_annotation.dart';
import 'package:movie/model/tv_show_detail/created_by.dart';
import 'package:movie/model/tv_show_detail/genre.dart';
import 'package:movie/model/tv_show_detail/last_episode_to_air.dart';
import 'package:movie/model/tv_show_detail/network.dart';
import 'package:movie/model/tv_show_detail/next_episode_to_air.dart';
import 'package:movie/model/tv_show_detail/production_companies.dart';
import 'package:movie/model/tv_show_detail/production_countries.dart';
import 'package:movie/model/tv_show_detail/seasons.dart';
import 'package:movie/model/tv_show_detail/spoken_languages.dart';

part 'tv_show_detail.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class TvShowDetail {
  late String? backdropPath;
  late List<CreatedBy>? createdBy;
  late List<int?>? episodeRunTime;
  late String? firstAirDate;
  late List<Genre>? genres;
  late String? homepage;
  late int? id;
  late bool? inProduction;
  late List<String?>? languages;
  late String? lastAirDate;
  late LastEpisodeToAir? lastEpisodeToAir;
  late String? name;
  late NextEpisodeToAir? nextEpisodeToAir;
  late List<Network>? networks;
  late int? numberOfEpisodes;
  late int? numberOfSeasons;
  late List<String?>? originCountry;
  late String? originalLanguage;
  late String? originalName;
  late String? overview;
  late double? popularity;
  late String? posterPath;
  late List<ProductionCompany>? productionCompanies;
  late List<ProductionCountry>? productionCountries;
  late List<Season>? seasons;
  late List<SpokenLanguage>? spokenLanguages;
  late String? status;
  late String? tagline;
  late String? type;
  late double? voteAverage;
  late int? voteCount;


  TvShowDetail({
    required this.backdropPath,
    required this.createdBy,
    required this.episodeRunTime,
    required this.firstAirDate,
    required this.genres,
    required this.homepage,
    required this.id,
    required this.inProduction,
    required this.languages,
    required this.lastAirDate,
    required this.lastEpisodeToAir,
    required this.name,
    required this.nextEpisodeToAir,
    required this.networks,
    required this.numberOfEpisodes,
    required this.numberOfSeasons,
    required this.originCountry,
    required this.originalLanguage,
    required this.originalName,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.productionCompanies,
    required this.productionCountries,
    required this.seasons,
    required this.spokenLanguages,
    required this.status,
    required this.tagline,
    required this.type,
    required this.voteAverage,
    required this.voteCount,
  });

  factory TvShowDetail.fromJson(Map<String, dynamic> json) => _$TvShowDetailFromJson(json);

  Map<String, dynamic> toJson() => _$TvShowDetailToJson(this);
}
