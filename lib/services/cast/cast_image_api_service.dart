import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movie/model/cast/cast_image/cast_image.dart';

class CastImageApiService{
  static String apiKey = '';

  Future remoteGetCastImageData({required personId})async{
    var url = Uri.parse('https://api.themoviedb.org/3/person/$personId/images?api_key=$apiKey');
    try{
      var response = await http.get(url);
      return CastImage.fromJson(jsonDecode(response.body));
    }catch(e){
      return null;
    }
  }
}