import 'package:movie/controller/search_movie/search_movie_controller.dart';


class SearchApiService {
  Future remoteSearchEverything({required query}) async {
    await Future.wait([
      SearchMovieController().getSearchMovieData(query: query)
    ]);
  }
}
