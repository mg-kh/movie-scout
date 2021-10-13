import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movie/model/tv_show_detail/cast_and_crew/cast_and_crew.dart';

class CastAndCrewApiService{
  static String apiKey = '08058bd6133df94466358e37bbf4eb27';

  Future remoteGetCastAndCrewData({required tvId})async{
    var url = Uri.parse('https://api.themoviedb.org/3/tv/$tvId/credits?api_key=$apiKey&language=en-US');
    var response = await http.get(url);
    if(response.statusCode == 200){
      return CastAndCrew.fromJson(jsonDecode(response.body));
    }else{
      throw Exception('Error occur');
    }
  }
}