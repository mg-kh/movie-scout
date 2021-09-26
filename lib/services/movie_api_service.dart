import 'package:http/http.dart' as http;
import 'package:movie/model/movie_model.dart';

class MovieApiService {
  static String apiKey = '08058bd6133df94466358e37bbf4eb27';

  Future remoteGetMovieData({required pageNumber}) async {
    var url = Uri.parse(
        'https://api.themoviedb.org/3/discover/movie?api_key=$apiKey&with_genres=28&page=$pageNumber');
    try {
      var response = await http.get(url);
      return movieModelFromJson('${response.body}');
    } catch (e) {
      return null;
    }
  }
}
