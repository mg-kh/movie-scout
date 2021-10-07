import 'package:http/http.dart' as http;
import 'package:movie/model/cast/cast_detail_model.dart';

class CastDetailApiService {
  static String apiKey = '08058bd6133df94466358e37bbf4eb27';

  Future<CastDetailModel?> remoteGetCastDetailData({required personId}) async {
    var url = Uri.parse(
        'https://api.themoviedb.org/3/person/$personId?api_key=$apiKey&language=en-US');
    var response = await http.get(url);

    if (response.statusCode == 200) {
      return castDetailModelFromJson('${response.body}');
    } else {
      throw Exception('Error occur');
    }
  }
}
