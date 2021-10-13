import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:movie/controller/setting_controller.dart';
import 'package:movie/model/search_person/search_person.dart';


class SearchPersonApiService{
  static String apiKey = '08058bd6133df94466358e37bbf4eb27';
  final SettingController settingController = Get.find();

  Future remoteSearchPersonData({required pageNumber, required query})async{
    var url = Uri.parse('https://api.themoviedb.org/3/search/person?api_key=$apiKey&language=en-US&page=$pageNumber&include_adult=${settingController.getAdultContent()}&query=$query');

    var response = await http.get(url);

    if(response.statusCode == 200){
      return SearchPerson.fromJson(jsonDecode(response.body));
    }else{
      throw Exception('Error occur');
    }
  }
}