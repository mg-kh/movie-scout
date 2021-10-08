import 'package:get/get.dart';
import 'package:movie/services/search_movie/search_movie_api_service.dart';
import 'package:movie/model/search_movie/result.dart';

class SearchMovieController extends GetxController{
  var resultMovieData = <Result>[].obs;
  var isLoading = false.obs;

  Future getSearchMovieData({required query})async{
    try{
      isLoading(true);
      var movieData = await SearchMovieApiService().remoteSearchMovieData(query: query);
      resultMovieData.value = movieData.results;
      print(resultMovieData);
    }catch(e){
      //
    }finally{
      isLoading(false);
    }
  }
}