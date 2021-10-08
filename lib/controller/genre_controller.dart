import 'package:get/get.dart';
import 'package:movie/model/genre/genre_map.dart';
import 'package:movie/services/genre_api_service.dart';

class GenreController extends GetxController {
  var genreData = <GenreMap>[].obs;
  var isLoading = true.obs;

  Future getGenreData() async {
    try {
      isLoading(true);
      var genre = await GenreApiService().remoteGetGenreData();
      genreData.value = genre.genres;
    } catch (e) {
      //
    } finally {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    super.onInit();
    getGenreData();
  }
}
