import 'package:http/http.dart' as http;
import 'package:movie/model/movie_detail/trailer_model.dart';

class TrailerApiService{
  static String apiKey = '08058bd6133df94466358e37bbf4eb27';

  Future<TrailerModel?> remoteGetTrailerData({required movieId})async{
    var url = Uri.parse('https://api.themoviedb.org/3/movie/$movieId/videos?api_key=$apiKey&language=en-US');

    try{
      var response = await http.get(url);
      return trailerModelFromJson('${response.body}');
    }catch(e){
      return null;
    }

  }
}