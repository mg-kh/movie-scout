import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie/services/movie_detail/movie_detail_api_service.dart';

class MovieDetailController extends GetxController {
  var movieDetail = Object().obs;
  var isLoading = true.obs;

  Future<void> getMovieDetail({required movieId}) async {
    isLoading(true);
    try {
      var detail =
          await MovieDetailApiService().remoteGetMovieDetail(movieId: movieId);
      movieDetail(detail);
      isLoading(false);
    } catch (e) {
      Get.defaultDialog(
          title: 'Error',
          content: Text("Sorry. We can't get overview data."),
          actions: [
            TextButton(
                onPressed: () {
                  Get.back();
                },
                child: Text('Ignore')),
            ElevatedButton(
              onPressed: () {
                getMovieDetail(movieId: Get.parameters['id']);
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
    getMovieDetail(movieId: Get.parameters['id']);
  }
}
