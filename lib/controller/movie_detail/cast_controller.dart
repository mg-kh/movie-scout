import 'package:get/get.dart';
import 'package:movie/model/movie_detail/cast_model.dart';
import 'package:movie/services/movie_detail/cast_api_service.dart';

class CastController extends GetxController{
  var castData = <Cast>[].obs;
  var isLoading = true.obs;

  Future getCastData({required movieId})async{
    isLoading(true);
    var cast = await CastApiService().remoteGetCastData(movieId: movieId);
    if(cast == null){
      return;
    }
    castData(cast.cast);
    isLoading(false);
  }

  @override
  void onInit() {
    super.onInit();
    getCastData(movieId: Get.parameters['id']);
  }
}