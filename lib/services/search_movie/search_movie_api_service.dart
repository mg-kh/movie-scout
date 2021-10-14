import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:movie/controller/setting_controller.dart';
import 'package:movie/model/search_movie/search_movie.dart';


class SearchMovieApiService{
  static String apiKey = '';
  final SettingController settingController = Get.find();

  Future remoteSearchMovieData({required pageNumber, required query})async{
    var url = Uri.parse('https://api.themoviedb.org/3/search/movie?api_key=$apiKey&language=en-US&page=$pageNumber&include_adult=${settingController.getAdultContent()}&query=$query');
    var response = await http.get(url);

    if(response.statusCode == 200){
      return SearchMovie.fromJson(jsonDecode(response.body));
    }else{
      throw Exception('Error occur');
    }
  }
}