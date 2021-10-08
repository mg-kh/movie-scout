import 'package:get/get.dart';
import 'package:movie/model/movie_detail/related_movie/result.dart';
import 'package:movie/services/movie_detail/related_movie_api_service.dart';
import 'package:flutter/material.dart';

class RelatedMovieController extends GetxController {
  var relMovieData = <Result>[].obs;
  var currentPage = 0.obs;
  var totalPages = 0.obs;
  var totalMovies = 0.obs;
  var isLoading = true.obs;

  Future getRelatedMovieData({required movieId}) async {
    isLoading(true);

    try {
      var relMovies = await RelatedMovieApiService()
          .remoteGetRelatedMovieData(movieId: movieId);
      relMovieData(relMovies.results);
      currentPage(relMovies.page);
      totalPages(relMovies.totalPages);
      totalMovies(relMovies.totalResults);

      isLoading(false);
    } catch (e) {
      Get.defaultDialog(
          title: 'Error',
          content: Text("Sorry. We can't get related movies."),
          actions: [
            TextButton(
                onPressed: () {
                  Get.back();
                },
                child: Text('Ignore')),
            ElevatedButton(
              onPressed: () {
                getRelatedMovieData(movieId: Get.parameters['id']);
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
    getRelatedMovieData(movieId: Get.parameters['id']);
  }
}
