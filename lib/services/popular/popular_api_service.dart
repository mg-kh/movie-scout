import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movie/model/popular/popular.dart';

class PopularApiService{

  static String apiKey = '';

  Future remoteGetPopularMovieData({required pageNumber})async{
    var url = Uri.parse('https://api.themoviedb.org/3/movie/popular?api_key=$apiKey&language=en-US&page=$pageNumber');
    var response = await http.get(url);

    if(response.statusCode == 200){
      return Popular.fromJson(jsonDecode(response.body));
    }else{
      throw Exception('Error occur.');
    }

  }
}