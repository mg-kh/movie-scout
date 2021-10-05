import 'package:http/http.dart' as http;
import 'package:movie/model/movie_detail/related_movie_model.dart';

class RelatedMovieApiService{
  static String apiKey = '08058bd6133df94466358e37bbf4eb27';

  Future<RelatedMovieModel?> remoteGetRelatedMovieData({required movieId})async{
    var url = Uri.parse('https://api.themoviedb.org/3/movie/$movieId/similar?api_key=$apiKey&language=en-US&page=1');
    try{
      var response = await http.get(url);
      return relatedMovieModelFromJson('${response.body}');
    }catch(e){
      return null;
    }
  }
}