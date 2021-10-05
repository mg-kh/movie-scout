import 'package:get/get.dart';
import 'package:movie/services/cast/cast_detail_api_service.dart';

class CastDetailController extends GetxController{
  var castDetailData = Object().obs;
  var isLoading = true.obs;

  Future<void> getCastDetailData({required personId})async{
    isLoading(true);
    var detail = await CastDetailApiService().remoteGetCastDetailData(personId: personId);
    if(detail == null){
      return ;
    }
    castDetailData(detail);
    isLoading(false);
  }

  @override
  void onInit() {
    super.onInit();
    getCastDetailData(personId: Get.parameters['id']);
  }
}