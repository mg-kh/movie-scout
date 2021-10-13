import 'package:get/get.dart';
import 'package:movie/model/tv_show_detail/cast_and_crew/cast_and_crew.dart';
import 'package:movie/services/tv_show_detail/cast_and_crew_api_service.dart';

class CastAndCrewController extends GetxController {
  var castAndCrewData = CastAndCrew(
    id: null,
    cast: null,
    crew: null,
  ).obs;
  var isLoading = false.obs;

  Future getCastAndCrewData({required tvId}) async {
    try {
      isLoading(true);
      var data =
          await CastAndCrewApiService().remoteGetCastAndCrewData(tvId: tvId);
      castAndCrewData(data);
    } catch (e) {} finally {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    super.onInit();
    getCastAndCrewData(tvId: Get.parameters['id']);
  }
}
