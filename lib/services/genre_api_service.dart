import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movie/model/genre/genre.dart';

class GenreApiService {
  static String apiKey = '08058bd6133df94466358e37bbf4eb27';

  Future remoteGetGenreData() async {
  var url = Uri.parse(
      'https://api.themoviedb.org/3/genre/movie/list?api_key=$apiKey&language=en-US');

      var response = await http.get(url);
      if(response.statusCode == 200){
        return Genre.fromJson(jsonDecode(response.body));
      }else{
        throw Exception('Error occur.');
      }
  }
}
