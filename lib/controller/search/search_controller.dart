import 'package:get/get.dart';
import 'package:movie/controller/search_movie/search_movie_controller.dart';
import 'package:movie/controller/search_person/search_person_controller.dart';
import 'package:movie/controller/search_tv_show/search_tv_show_controller.dart';


class SearchController extends GetxController{

  final SearchMovieController searchMovieController = Get.put(SearchMovieController());
  final SearchPersonController searchPersonController = Get.put(SearchPersonController());
  final SearchTvShowController searchTvShowController = Get.put(SearchTvShowController());

  Future searchEverything({required query})async{
    await Future.wait([
      searchMovieController.getSearchMovieData(query: query),
      searchPersonController.getSearchPersonData(query: query),
      searchTvShowController.getTvShowData(query: query)
    ]);
  }

}