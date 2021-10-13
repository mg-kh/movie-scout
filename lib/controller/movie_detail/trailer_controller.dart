import 'package:get/get.dart';
import 'package:movie/model/movie_detail/trailer/result.dart';
import 'package:movie/services/movie_detail/trailer_api_service.dart';

class TrailerController extends GetxController {
  var trailerData = <Result>[].obs;
  var isLoading = true.obs;

  Future getTrailerData({required movieId}) async {
    try {
      isLoading(true);
      var trailer =
          await TrailerApiService().remoteGetTrailerData(movieId: movieId);
      trailerData(trailer.results);
    } catch (e) {} finally {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    super.onInit();
    getTrailerData(movieId: Get.parameters['id']);
  }
}
