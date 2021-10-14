import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movie/model/tv_show_detail/tv_show_detail.dart';

class TvShowDetailApiService{
  static String apiKey = '';

  Future remoteGetTvShowDetailData({required tvId})async{
    var url = Uri.parse('https://api.themoviedb.org/3/tv/$tvId?api_key=$apiKey&language=en-US');
    var response = await http.get(url);

    if(response.statusCode == 200){
      return TvShowDetail.fromJson(jsonDecode(response.body));
    }else{
      throw Exception('Error occur');
    }
  }
}