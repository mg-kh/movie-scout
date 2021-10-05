import 'package:get/get.dart';
import 'package:movie/model/genre_model.dart';
import 'package:movie/services/genre_api_service.dart';

class GenreController extends GetxController {
  var genreData = <Genre>[].obs;
  var isLoading = true.obs;

  Future getGenreData()async{
    isLoading(true);
    var genre = await GenreApiService().remoteGetGenreData();
    if(genre == null){
      return;
    }
    genreData.value = genre.genres;
    isLoading(false);
  }

  @override
  void onInit() {
    super.onInit();
    getGenreData();
  }
}
