import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie/model/movie_detail/cast/cast_model.dart';
import 'package:movie/services/movie_detail/cast_api_service.dart';

class CastController extends GetxController {
  var castData = <CastModel>[].obs;
  var isLoading = true.obs;

  Future getCastData({required movieId}) async {
    isLoading(true);
    try {
      var cast = await CastApiService().remoteGetCastData(movieId: movieId);
      castData(cast.cast);
      isLoading(false);
    } catch (e) {
      Get.defaultDialog(
          title: 'Error',
          content: Text("Sorry. We can't get cast's movies."),
          actions: [
            TextButton(
                onPressed: () {
                  Get.back();
                },
                child: Text('Ignore')),
            ElevatedButton(
              onPressed: () {
                getCastData(movieId: Get.parameters['id']);
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
    getCastData(movieId: Get.parameters['id']);
  }
}
