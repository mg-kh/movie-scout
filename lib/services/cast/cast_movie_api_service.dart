import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movie/model/cast/cast_movie/cast_movie.dart';

class CastMovieApiService {
  static String apiKey = '08058bd6133df94466358e37bbf4eb27';

  Future remoteGetCastMovieData({required personId}) async {
    var url = Uri.parse(
        'https://api.themoviedb.org/3/person/$personId/movie_credits?api_key=$apiKey&language=en-US');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      return CastMovie.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Error occur');
    }
  }
}
