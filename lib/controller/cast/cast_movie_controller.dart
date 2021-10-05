import 'package:get/get.dart';
import 'package:movie/model/cast/cast_movie_model.dart';
import 'package:movie/services/cast/cast_movie_api_service.dart';

class CastMovieController extends GetxController{
  var castMovieData = <Cast>[].obs;
  var isLoading = true.obs;

  Future<void> getCastMovieData({required personId})async{
    isLoading(true);
    var castMovie = await CastMovieApiService().remoteGetCastMovieData(personId: personId) ;

    if(castMovie == null){
      return ;
    }

    castMovieData(castMovie.cast);
    isLoading(false);
  }

  @override
  void onInit() {
    super.onInit();
    getCastMovieData(personId: Get.parameters['id']);
  }
}