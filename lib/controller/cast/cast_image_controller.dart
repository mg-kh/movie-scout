import 'package:get/get.dart';
import 'package:movie/model/cast/cast_image/profiles.dart';
import 'package:movie/services/cast/cast_image_api_service.dart';

class CastImageController extends GetxController{
  var castImagesData = <Profiles>[].obs;
  var isLoading = true.obs;

  Future getCastImageData({required personId})async{
    isLoading(true);
    var castImages = await CastImageApiService().remoteGetCastImageData(personId: personId);
    if(castImages == null){
      return;
    }
    castImagesData(castImages.profiles);
    isLoading(false);
  }

  @override
  void onInit() {
    super.onInit();
    getCastImageData(personId: Get.parameters['id']);
  }
}