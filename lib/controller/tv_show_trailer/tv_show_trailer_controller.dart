import 'package:get/get.dart';
import 'package:movie/model/movie_detail/trailer/result.dart';
import 'package:movie/services/tv_show_trailer/tv_show_trailer_api_service.dart';

class TvShowTrailerController extends GetxController{
  var trailerData = <Result>[].obs;
  var isLoading = false.obs;

  Future getTvShowTrailerData({required tvId})async{
    try{
      isLoading(true);
      var data = await TvShowTrailerApiService().remoteGetTvShowTrailerData(tvId : tvId);
      trailerData(data.results);
    }catch(e){
      //
    }finally{
      isLoading(false);
    }
  }

  @override
  void onInit() {
    super.onInit();
    getTvShowTrailerData(tvId: Get.parameters['id']);
  }
}