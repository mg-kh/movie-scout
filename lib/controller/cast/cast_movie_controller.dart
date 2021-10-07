import 'package:get/get.dart';
import 'package:movie/model/cast/cast_movie_model.dart';
import 'package:movie/services/cast/cast_movie_api_service.dart';
import 'package:flutter/material.dart';

class CastMovieController extends GetxController{
  var castMovieData = <Cast>[].obs;
  var isLoading = true.obs;

  Future<void> getCastMovieData({required personId})async{
    isLoading(true);
    try{
      var castMovie = await CastMovieApiService().remoteGetCastMovieData(personId: personId) ;

      if(castMovie == null){
        return null;
      }

      castMovieData(castMovie.cast);
      isLoading(false);
    }catch(e){
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
                getCastMovieData(personId: Get.parameters['id']);
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
    getCastMovieData(personId: Get.parameters['id']);
  }
}