import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movie/model/movie_detail/trailer/trailer.dart';

class TrailerApiService {
  static String apiKey = '';

  Future remoteGetTrailerData({required movieId}) async {
    var url = Uri.parse(
        'https://api.themoviedb.org/3/movie/$movieId/videos?api_key=$apiKey&language=en-US');
    var response = await http.get(url);

    if (response.statusCode == 200) {
      return Trailer.fromJson(jsonDecode(response.body));
    }else{
      throw Exception('Error occur.');
    }
  }
}
