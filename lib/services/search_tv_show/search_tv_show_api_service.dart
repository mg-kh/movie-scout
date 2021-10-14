import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:movie/controller/setting_controller.dart';
import 'package:movie/model/search_tv_show/search_tv_show.dart';


class SearchTvShowApiService{
  static String apiKey = '';
  final SettingController settingController = Get.find();

  Future remoteGetTvShowData({required query, required pageNumber})async{
    var url = Uri.parse('https://api.themoviedb.org/3/search/tv?api_key=$apiKey&language=en-US&page=$pageNumber&include_adult=${settingController.getAdultContent()}&query=$query');
    var response = await http.get(url);

    if(response.statusCode == 200){
     return SearchTvShow.fromJson(jsonDecode(response.body));
    }else{
      throw Exception('Error occur');
    }
  }
}