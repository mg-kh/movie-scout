import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:movie/controller/setting_controller.dart';
import 'package:movie/model/movie/movie.dart';

class MovieApiService {
  static String apiKey = '';
  final SettingController settingController = Get.find();

  Future remoteGetMovieData({required pageNumber, required genreId}) async {
    var url = Uri.parse(
        'https://api.themoviedb.org/3/discover/movie?api_key=$apiKey&with_genres=$genreId&page=$pageNumber&include_adult=${settingController.getAdultContent()}');

    var response = await http.get(url);

    if(response.statusCode == 200){
      return Movie.fromJson(jsonDecode(response.body));
    }else{
      throw Exception('Error occur');
    }
  }
}
