import 'package:get/get.dart';
import 'package:movie/model/cast/cast_detail/cast_detail.dart';
import 'package:movie/services/cast/cast_detail_api_service.dart';
import 'package:flutter/material.dart';

class CastDetailController extends GetxController {
  var castDetailData = CastDetail(
    imdbId: '',
    biography: '',
    deathday: '',
    id: 0,
    adult: false,
    homepage: '',
    name: '',
    birthday: '',
    placeOfBirth: '',
    gender: 0,
    knownForDepartment: '',
    profilePath: '',
    popularity: 0.0,
    alsoKnownAs: [],
  ).obs;
  var isLoading = true.obs;

  Future<void> getCastDetailData({required personId}) async {
    isLoading(true);
    try {
      var detail = await CastDetailApiService()
          .remoteGetCastDetailData(personId: personId);
      if (detail == null) {
        return;
      }
      castDetailData(detail);
      isLoading(false);
    } catch (e) {
      Get.defaultDialog(
          title: 'Error',
          content: Text("Sorry. We can't get cast's data."),
          actions: [
            TextButton(
                onPressed: () {
                  Get.back();
                },
                child: Text('Ignore')),
            ElevatedButton(
              onPressed: () {
                getCastDetailData(personId: Get.parameters['id']);
                Get.back();
              },
              child: Text('Retry'),
            )
          ]);
    }
  }

  @override
  void onInit() {
    super.onInit();
    getCastDetailData(personId: Get.parameters['id']);
  }
}
