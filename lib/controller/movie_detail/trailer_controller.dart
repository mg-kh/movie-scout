import 'package:get/get.dart';
import 'package:movie/model/movie_detail/trailer_model.dart';
import 'package:movie/services/movie_detail/trailer_api_service.dart';

class TrailerController extends GetxController{
  var trailerData = <Result>[].obs;
  var isLoading = true.obs;

  Future getTrailerData({required movieId})async{
    isLoading(true);
    var trailer = await TrailerApiService().remoteGetTrailerData(movieId: movieId);
    if(trailer != null){
      trailerData(trailer.results);
    }
    isLoading(false);
  }
}