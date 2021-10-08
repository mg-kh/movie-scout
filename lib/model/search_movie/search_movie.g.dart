// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_movie.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchMovie _$SearchMovieFromJson(Map<String, dynamic> json) {
  return SearchMovie(
    page: json['page'] as int?,
    results: (json['results'] as List<dynamic>)
        .map((e) => Result.fromJson(e as Map<String, dynamic>))
        .toList(),
    totalPages: json['total_pages'] as int?,
    totalResults: json['total_results'] as int?,
  );
}

Map<String, dynamic> _$SearchMovieToJson(SearchMovie instance) =>
    <String, dynamic>{
      'page': instance.page,
      'results': instance.results.map((e) => e.toJson()).toList(),
      'total_pages': instance.totalPages,
      'total_results': instance.totalResults,
    };
