import 'package:http/http.dart' as http;
import 'package:movie/model/genre_model.dart';

class GenreApiService {
  static String apiKey = '08058bd6133df94466358e37bbf4eb27';

  Future<GenreModel?> remoteGetGenreData() async {
  var url = Uri.parse(
      'https://api.themoviedb.org/3/genre/movie/list?api_key=$apiKey&language=en-US');

    try {
      var response = await http.get(url);
      return genreModelFromJson('${response.body}');
    } catch (e) {
      return null;
    }
  }
}
