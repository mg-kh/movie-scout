// To parse this JSON data, do
//
//     final searchPersonModel = searchPersonModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

SearchPersonModel searchPersonModelFromJson(String str) => SearchPersonModel.fromJson(json.decode(str));

String searchPersonModelToJson(SearchPersonModel data) => json.encode(data.toJson());

class SearchPersonModel {
  SearchPersonModel({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  int? page;
  List<Result>? results;
  int? totalPages;
  int? totalResults;

  factory SearchPersonModel.fromJson(Map<String, dynamic> json) => SearchPersonModel(
    page: json["page"] == null ? null : json["page"],
    results: json["results"] == null ? null : List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
    totalPages: json["total_pages"] == null ? null : json["total_pages"],
    totalResults: json["total_results"] == null ? null : json["total_results"],
  );

  Map<String, dynamic> toJson() => {
    "page": page == null ? null : page,
    "results": results == null ? null : List<dynamic>.from(results!.map((x) => x.toJson())),
    "total_pages": totalPages == null ? null : totalPages,
    "total_results": totalResults == null ? null : totalResults,
  };
}

class Result {
  Result({
    required this.adult,
    required this.gender,
    required this.id,
    required this.knownFor,
    required this.knownForDepartment,
    required this.name,
    required this.popularity,
    required this.profilePath,
  });

  bool? adult;
  int? gender;
  int? id;
  List<KnownFor>? knownFor;
  String? knownForDepartment;
  String? name;
  double? popularity;
  String? profilePath;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    adult: json["adult"] == null ? null : json["adult"],
    gender: json["gender"] == null ? null : json["gender"],
    id: json["id"] == null ? null : json["id"],
    knownFor: json["known_for"] == null ? null : List<KnownFor>.from(json["known_for"].map((x) => KnownFor.fromJson(x))),
    knownForDepartment: json["known_for_department"] == null ? null : json["known_for_department"],
    name: json["name"] == null ? null : json["name"],
    popularity: json["popularity"] == null ? null : json["popularity"].toDouble(),
    profilePath: json["profile_path"] == null ? null : json["profile_path"],
  );

  Map<String, dynamic> toJson() => {
    "adult": adult == null ? null : adult,
    "gender": gender == null ? null : gender,
    "id": id == null ? null : id,
    "known_for": knownFor == null ? null : List<dynamic>.from(knownFor!.map((x) => x.toJson())),
    "known_for_department": knownForDepartment == null ? null : knownForDepartment,
    "name": name == null ? null : name,
    "popularity": popularity == null ? null : popularity,
    "profile_path": profilePath == null ? null : profilePath,
  };
}

class KnownFor {
  KnownFor({
    required this.backdropPath,
    required this.firstAirDate,
    required this.genreIds,
    required this.id,
    required this.mediaType,
    required this.name,
    required this.originCountry,
    required this.originalLanguage,
    required this.originalName,
    required this.overview,
    required this.posterPath,
    required this.voteAverage,
    required this.voteCount,
    required this.adult,
    required this.originalTitle,
    required this.releaseDate,
    required this.title,
    required this.video,
  });

  String? backdropPath;
  DateTime? firstAirDate;
  List<int>? genreIds;
  int? id;
  MediaType? mediaType;
  String? name;
  List<String>? originCountry;
  String? originalLanguage;
  String? originalName;
  String? overview;
  String? posterPath;
  double? voteAverage;
  int? voteCount;
  bool? adult;
  String? originalTitle;
  String? releaseDate;
  String? title;
  bool? video;

  factory KnownFor.fromJson(Map<String, dynamic> json) => KnownFor(
    backdropPath: json["backdrop_path"] == null ? null : json["backdrop_path"],
    firstAirDate: json["first_air_date"] == null ? null : DateTime.parse(json["first_air_date"]),
    genreIds: json["genre_ids"] == null ? null : List<int>.from(json["genre_ids"].map((x) => x)),
    id: json["id"] == null ? null : json["id"],
    mediaType: json["media_type"] == null ? null : mediaTypeValues.map[json["media_type"]],
    name: json["name"] == null ? null : json["name"],
    originCountry: json["origin_country"] == null ? null : List<String>.from(json["origin_country"].map((x) => x)),
    originalLanguage: json["original_language"] == null ? null : json["original_language"],
    originalName: json["original_name"] == null ? null : json["original_name"],
    overview: json["overview"] == null ? null : json["overview"],
    posterPath: json["poster_path"] == null ? null : json["poster_path"],
    voteAverage: json["vote_average"] == null ? null : json["vote_average"].toDouble(),
    voteCount: json["vote_count"] == null ? null : json["vote_count"],
    adult: json["adult"] == null ? null : json["adult"],
    originalTitle: json["original_title"] == null ? null : json["original_title"],
    releaseDate: json["release_date"] == null ? null : json["release_date"],
    title: json["title"] == null ? null : json["title"],
    video: json["video"] == null ? null : json["video"],
  );

  Map<String, dynamic> toJson() => {
    "backdrop_path": backdropPath == null ? null : backdropPath,
    "first_air_date": firstAirDate == null ? null : "${firstAirDate!.year.toString().padLeft(4, '0')}-${firstAirDate!.month.toString().padLeft(2, '0')}-${firstAirDate!.day.toString().padLeft(2, '0')}",
    "genre_ids": genreIds == null ? null : List<dynamic>.from(genreIds!.map((x) => x)),
    "id": id == null ? null : id,
    "media_type": mediaType == null ? null : mediaTypeValues.reverse[mediaType],
    "name": name == null ? null : name,
    "origin_country": originCountry == null ? null : List<dynamic>.from(originCountry!.map((x) => x)),
    "original_language": originalLanguage == null ? null : originalLanguage,
    "original_name": originalName == null ? null : originalName,
    "overview": overview == null ? null : overview,
    "poster_path": posterPath == null ? null : posterPath,
    "vote_average": voteAverage == null ? null : voteAverage,
    "vote_count": voteCount == null ? null : voteCount,
    "adult": adult == null ? null : adult,
    "original_title": originalTitle == null ? null : originalTitle,
    "release_date": releaseDate == null ? null : releaseDate,
    "title": title == null ? null : title,
    "video": video == null ? null : video,
  };
}

enum MediaType { TV, MOVIE }

final mediaTypeValues = EnumValues({
  "movie": MediaType.MOVIE,
  "tv": MediaType.TV
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
