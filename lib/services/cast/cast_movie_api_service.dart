import 'package:http/http.dart' as http;
import 'package:movie/model/cast/cast_movie_model.dart';

class CastMovieApiService{
  static String apiKey = '08058bd6133df94466358e37bbf4eb27';

  Future<CastMovieModel?> remoteGetCastMovieData({required personId})async{
    var url = Uri.parse('https://api.themoviedb.org/3/person/$personId/movie_credits?api_key=$apiKey&language=en-US');
    try{
      var response = await http.get(url);
      return castMovieModelFromJson('${response.body}');
    }catch(e){
      return null;
    }
  }
}