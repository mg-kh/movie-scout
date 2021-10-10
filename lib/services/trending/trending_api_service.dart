import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movie/model/trending/trending.dart';

class TrendingApiService{

  static String apiKey = '08058bd6133df94466358e37bbf4eb27';

  Future remoteGetTrendingMovieData({required pageNumber})async{
    var url = Uri.parse('https://api.themoviedb.org/3/trending/all/day?api_key=$apiKey&page=$pageNumber&adult=false');
    var response = await http.get(url);

    if(response.statusCode == 200){
      return Trending.fromJson(jsonDecode(response.body));
    }else{
      throw Exception('Error occur.');
    }

  }
}