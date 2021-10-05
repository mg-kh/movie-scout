import 'package:http/http.dart' as http;
import 'package:movie/model/cast/cast_image_model.dart';

class CastImageApiService{
  static String apiKey = '08058bd6133df94466358e37bbf4eb27';

  Future remoteGetCastImageData({required personId})async{
    var url = Uri.parse('https://api.themoviedb.org/3/person/$personId/images?api_key=$apiKey');
    try{
      var response = await http.get(url);
      return castImageModelFromJson('${response.body}');
    }catch(e){
      return null;
    }
  }
}