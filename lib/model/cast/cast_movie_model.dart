// To parse this JSON data, do
//
//     final castMovieModel = castMovieModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

CastMovieModel castMovieModelFromJson(String str) => CastMovieModel.fromJson(json.decode(str));

String castMovieModelToJson(CastMovieModel data) => json.encode(data.toJson());

class CastMovieModel {
  CastMovieModel({
    required this.cast,
    required this.crew,
    required this.id,
  });

  List<Cast>? cast;
  List<Cast>? crew;
  int id;

  factory CastMovieModel.fromJson(Map<String, dynamic> json) => CastMovieModel(
    cast: json["cast"] == null ? null : List<Cast>.from(json["cast"].map((x) => Cast.fromJson(x))),
    crew: json["crew"] == null ? null : List<Cast>.from(json["crew"].map((x) => Cast.fromJson(x))),
    id: json["id"] == null ? null : json["id"],
  );

  Map<String, dynamic> toJson() => {
    "cast": cast == null ? null : List<dynamic>.from(cast!.map((x) => x.toJson())),
    "crew": crew == null ? null : List<dynamic>.from(crew!.map((x) => x.toJson())),
    "id": id == null ? null : id,
  };
}

class Cast {
  Cast({
    required this.adult,
    required this.backdropPath,
    required this.genreIds,
    required this.id,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.posterPath,
    required this.releaseDate,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
    required this.popularity,
    required this.character,
    required this.creditId,
    required this.order,
    required this.department,
    required this.job,
  });

  bool adult;
  String? backdropPath;
  List<int>? genreIds;
  int id;
  OriginalLanguage? originalLanguage;
  String? originalTitle;
  String? overview;
  String? posterPath;
  String? releaseDate;
  String? title;
  bool? video;
  double? voteAverage;
  int? voteCount;
  double? popularity;
  String? character;
  String? creditId;
  int? order;
  Department? department;
  String? job;

  factory Cast.fromJson(Map<String, dynamic> json) => Cast(
    adult: json["adult"] == null ? null : json["adult"],
    backdropPath: json["backdrop_path"] == null ? null : json["backdrop_path"],
    genreIds: json["genre_ids"] == null ? null : List<int>.from(json["genre_ids"].map((x) => x)),
    id: json["id"] == null ? null : json["id"],
    originalLanguage: json["original_language"] == null ? null : originalLanguageValues.map[json["original_language"]],
    originalTitle: json["original_title"] == null ? null : json["original_title"],
    overview: json["overview"] == null ? null : json["overview"],
    posterPath: json["poster_path"] == null ? null : json["poster_path"],
    releaseDate: json["release_date"] == null ? null : json["release_date"],
    title: json["title"] == null ? null : json["title"],
    video: json["video"] == null ? null : json["video"],
    voteAverage: json["vote_average"] == null ? null : json["vote_average"].toDouble(),
    voteCount: json["vote_count"] == null ? null : json["vote_count"],
    popularity: json["popularity"] == null ? null : json["popularity"].toDouble(),
    character: json["character"] == null ? null : json["character"],
    creditId: json["credit_id"] == null ? null : json["credit_id"],
    order: json["order"] == null ? null : json["order"],
    department: json["department"] == null ? null : departmentValues.map[json["department"]],
    job: json["job"] == null ? null : json["job"],
  );

  Map<String, dynamic> toJson() => {
    "adult": adult == null ? null : adult,
    "backdrop_path": backdropPath == null ? null : backdropPath,
    "genre_ids": genreIds == null ? null : List<dynamic>.from(genreIds!.map((x) => x)),
    "id": id == null ? null : id,
    "original_language": originalLanguage == null ? null : originalLanguageValues.reverse[originalLanguage],
    "original_title": originalTitle == null ? null : originalTitle,
    "overview": overview == null ? null : overview,
    "poster_path": posterPath == null ? null : posterPath,
    "release_date": releaseDate == null ? null : releaseDate,
    "title": title == null ? null : title,
    "video": video == null ? null : video,
    "vote_average": voteAverage == null ? null : voteAverage,
    "vote_count": voteCount == null ? null : voteCount,
    "popularity": popularity == null ? null : popularity,
    "character": character == null ? null : character,
    "credit_id": creditId == null ? null : creditId,
    "order": order == null ? null : order,
    "department": department == null ? null : departmentValues.reverse[department],
    "job": job == null ? null : job,
  };
}

enum Department { CREW, DIRECTING, PRODUCTION, WRITING }

final departmentValues = EnumValues({
  "Crew": Department.CREW,
  "Directing": Department.DIRECTING,
  "Production": Department.PRODUCTION,
  "Writing": Department.WRITING
});

enum OriginalLanguage { EN, MI }

final originalLanguageValues = EnumValues({
  "en": OriginalLanguage.EN,
  "mi": OriginalLanguage.MI
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
