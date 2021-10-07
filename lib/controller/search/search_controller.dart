import 'package:get/get.dart';
import 'package:movie/model/person_tab/search_person_model.dart' as person;
import 'package:movie/model/movie_tab/search_movie_model.dart' as movie;
import 'package:movie/services/search/search_api_service.dart';


class SearchController extends GetxController{
  var searchMovieData = <movie.Result>[].obs;
  var searchPersonData = <person.Result>[].obs;
  var isLoading = false.obs;


  Future searchEverything({required query})async{
    isLoading(true);

    var response = await SearchApiService().remoteSearchEverything(query: query);
    print(response);

    if(response == null){
      print('null');
    }

    // searchMovieModelFromJson('${response[0].body}'),
    // searchPersonModelFromJson('${response[1].body}')

    searchMovieData(response[0].results);
    searchPersonData(response[1].results);

    isLoading(false);
  }
}