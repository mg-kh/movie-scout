import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movie/model/movie_detail/detail/detail.dart';

class MovieDetailApiService{
  static String apiKey = '08058bd6133df94466358e37bbf4eb27';
  
  Future remoteGetMovieDetail({movieId:550988}) async{
    var url = Uri.parse('https://api.themoviedb.org/3/movie/$movieId?api_key=$apiKey&language=en-US');
    var response = await http.get(url);
    if(response.statusCode == 200){
      return Detail.fromJson(jsonDecode(response.body));
    }else{
      throw Exception('Error occur');
    }
  }
}