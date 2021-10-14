import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movie/model/movie_detail/cast/cast.dart';

class CastApiService {
  static String apiKey = '';

  Future remoteGetCastData({required movieId}) async {
    var url = Uri.parse(
        'https://api.themoviedb.org/3/movie/$movieId/credits?api_key=$apiKey&language=en-US');
    var response = await http.get(url);

    if (response.statusCode == 200) {
      return Cast.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Error Occur');
    }
  }
}
