import 'package:get/get.dart';
import 'package:movie/model/movie_detail/related_movie_model.dart';
import 'package:movie/services/movie_detail/related_movie_api_service.dart';

class RelatedMovieController extends GetxController{
  var relMovieData = <Result>[].obs;
  var currentPage = 0.obs;
  var totalPages = 0.obs;
  var totalMovies = 0.obs;
  var isLoading = true.obs;

  Future getRelatedMovieData({required movieId})async{
    isLoading(true);
    var relMovies = await RelatedMovieApiService().remoteGetRelatedMovieData(movieId: movieId);

    if(relMovieData == null){
      return;
    }

    relMovieData(relMovies!.results);
    currentPage(relMovies.page);
    totalPages(relMovies.totalPages);
    totalMovies(relMovies.totalResults);

    isLoading(false);
  }

  @override
  void onInit() {
    super.onInit();
    getRelatedMovieData(movieId: Get.parameters['id']);
  }
}