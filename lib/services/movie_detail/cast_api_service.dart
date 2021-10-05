import 'package:http/http.dart' as http;
import 'package:movie/model/movie_detail/cast_model.dart';


class CastApiService{
  static String apiKey = '08058bd6133df94466358e37bbf4eb27';

  Future<CastModel?> remoteGetCastData({required movieId}) async {
    var url = Uri.parse(
      'https://api.themoviedb.org/3/movie/$movieId/credits?api_key=$apiKey&language=en-US');

    try{
      var response = await http.get(url);
      return castModelFromJson('${response.body}');
    }catch(e){
      return null;
    }
  }
}