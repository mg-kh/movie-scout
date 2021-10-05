import 'package:get/get.dart';
import 'package:movie/model/movie_detail/movie_detail_model.dart';
import 'package:movie/services/movie_detail/movie_detail_api_service.dart';

class MovieDetailController extends GetxController {

  var movieDetail = Object().obs;
  var isLoading = true.obs;

  Future<void> getMovieDetail({required movieId}) async {
    isLoading(true);
    var detail =
        await MovieDetailApiService().remoteGetMovieDetail(movieId: movieId);
    if (detail == null) {
      return null;
    }
    movieDetail(detail);
    isLoading(false);
  }

  @override
  void onInit() {
    super.onInit();
    getMovieDetail(movieId: Get.parameters['id']);
  }
}
