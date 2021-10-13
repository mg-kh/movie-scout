import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movie/model/popular_tv_show/popular_tv_show.dart';

class PopularTvShowApiService{
  static String apiKey = '08058bd6133df94466358e37bbf4eb27';

  Future remoteGetPopularTvShowData({required pageNumber})async{
    var url =  Uri.parse('https://api.themoviedb.org/3/tv/popular?api_key=$apiKey&language=en-US&page=$pageNumber');
    var response = await http.get(url);
    if(response.statusCode == 200){
      return PopularTvShow.fromJson(jsonDecode(response.body));
    }else{
      throw Exception('Error occur');
    }
  }
}