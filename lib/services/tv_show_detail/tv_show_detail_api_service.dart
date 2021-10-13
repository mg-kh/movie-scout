import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movie/model/tv_show_detail/tv_show_detail.dart';

class TvShowDetailApiService{
  static String apiKey = '08058bd6133df94466358e37bbf4eb27';

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