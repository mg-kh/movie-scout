import 'package:json_annotation/json_annotation.dart';
import 'package:movie/model/movie_detail/detail/belong_to_collection.dart';
import 'package:movie/model/movie_detail/detail/genres.dart';
import 'package:movie/model/movie_detail/detail/production_companies.dart';
import 'package:movie/model/movie_detail/detail/production_countries.dart';
import 'package:movie/model/movie_detail/detail/spoken_language.dart';

part 'detail.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class Detail{
late bool? adult;
late String? backdropPath;
late BelongToCollection? belongsToCollection;
late int? budget;
late List<Genres>? genres;
late String? homepage;
late int? id;
late String? imdbId;
late String? originalLanguage;
late String? originalTitle;
late String? overview;
late double? popularity;
late String? posterPath;
late List<ProductionCompanies>? productionCompanies;
late List<ProductionCountries>? productionCountries;
late String? releaseDate;
late int? revenue;
late int? runtime;
late List<SpokenLanguage>? spokenLanguages;
late String? status;
late String? tagline;
late String? title;
late bool? video;
late double? voteAverage;
late int? voteCount;

Detail({
  required this.adult,
  required this.backdropPath,
  required this.belongsToCollection,
  required this.budget,
  required this.genres,
  required this.homepage,
  required this.id,
  required this.imdbId,
  required this.originalLanguage,
  required this.originalTitle,
  required this.overview,
  required this.popularity,
  required this.posterPath,
  required this.productionCompanies,
  required this.productionCountries,
  required this.releaseDate,
  required this.revenue,
  required this.runtime,
  required this.spokenLanguages,
  required this.status,
  required this.tagline,
  required this.title,
  required this.video,
  required this.voteAverage,
  required this.voteCount,
});



factory Detail.fromJson(Map<String, dynamic> json) => _$DetailFromJson(json);

Map<String, dynamic> toJson() => _$DetailToJson(this);
}