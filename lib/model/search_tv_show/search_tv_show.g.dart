// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_tv_show.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchTvShow _$SearchTvShowFromJson(Map<String, dynamic> json) {
  return SearchTvShow(
    page: json['page'] as int?,
    results: (json['results'] as List<dynamic>?)
        ?.map((e) => Result.fromJson(e as Map<String, dynamic>))
        .toList(),
    totalPages: json['total_pages'] as int?,
    totalResults: json['total_results'] as int?,
  );
}

Map<String, dynamic> _$SearchTvShowToJson(SearchTvShow instance) =>
    <String, dynamic>{
      'page': instance.page,
      'results': instance.results?.map((e) => e.toJson()).toList(),
      'total_pages': instance.totalPages,
      'total_results': instance.totalResults,
    };
