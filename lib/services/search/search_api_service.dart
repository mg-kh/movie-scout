import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:movie/controller/setting_controller.dart';
import 'package:movie/model/movie_tab/search_movie_model.dart';
import 'package:movie/model/person_tab/search_person_model.dart';

class SearchApiService{
  static String apiKey = '08058bd6133df94466358e37bbf4eb27';
  final SettingController settingController = Get.find();

  Future remoteSearchEverything({required query})async{
    var movieUrl = Uri.parse('https://api.themoviedb.org/3/search/movie?api_key=$apiKey&language=en-US&page=1&include_adult=${settingController.getAdultContent()}&query=$query');
    var personUrl = Uri.parse('https://api.themoviedb.org/3/search/person?api_key=$apiKey&language=en-US&page=1&include_adult=${settingController.getAdultContent()}&query=$query');
      try{
        var response = await Future.wait([
          http.get(movieUrl),
          http.get(personUrl)
        ]);

        return [
          searchMovieModelFromJson('${response[0].body}'),
          searchPersonModelFromJson('${response[1].body}')
        ];
      }catch(e){
        return null;
      }
  }
}
