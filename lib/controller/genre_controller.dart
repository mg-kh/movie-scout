import 'package:get/get.dart';
import 'package:movie/model/genre_model.dart';
import 'package:movie/services/genre_api_service.dart';

class GenreController extends GetxController {
  var genreData = <Genre>[].obs;

  Future getGenreData()async{
    var genre = await GenreApiService().remoteGetGenreData();
    if(genre == null){
      return;
    }
    genreData.value = genre.genres;
  }

  @override
  void onInit() {
    super.onInit();
    getGenreData();
  }
}
