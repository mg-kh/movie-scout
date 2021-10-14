import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movie/model/movie_detail/related_movie/related_movie.dart';

class RelatedMovieApiService {
  static String apiKey = '';

  Future remoteGetRelatedMovieData(
      {required movieId}) async {
    var url = Uri.parse(
        'https://api.themoviedb.org/3/movie/$movieId/similar?api_key=$apiKey&language=en-US&page=1');
    var response = await http.get(url);

    if (response.statusCode == 200) {
      return RelatedMovie.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Error occur');
    }
  }
}
