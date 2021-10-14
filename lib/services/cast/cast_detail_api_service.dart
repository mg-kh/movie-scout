import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movie/model/cast/cast_detail/cast_detail.dart';


class CastDetailApiService {
  static String apiKey = '';

  Future remoteGetCastDetailData({required personId}) async {
    var url = Uri.parse(
        'https://api.themoviedb.org/3/person/$personId?api_key=$apiKey&language=en-US');
    var response = await http.get(url);

    if (response.statusCode == 200) {
      return CastDetail.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Error occur');
    }
  }
}
