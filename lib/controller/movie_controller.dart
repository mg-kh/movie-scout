import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:movie/constants.dart';
import 'package:movie/model/movie_model.dart';
import 'package:movie/services/movie_api_service.dart';

class MovieController extends GetxController {
  var movieData = <Result>[].obs;
  var currentPage = 0.obs;
  var totalPages = 0.obs;
  var totalMovies = 0.obs;
  final scrollController = ScrollController();
  var initPage = 1.obs;

  Future getMovieData({pageNumber: 1}) async {
    var movie =
        await MovieApiService().remoteGetMovieData(pageNumber: pageNumber);
    if (movie == null) {
      return;
    }
    movieData.value = [...movieData, ...movie.results];
    currentPage(movie.page);
    totalPages(movie.totalPages);
    totalMovies(movie.totalResults);
  }

  void scrollListener() {
    var isBottom = scrollController.position.extentAfter == 0;
    if (isBottom) {
      if (movieData.length < totalMovies.value) {
        initPage.value++;
        Get.rawSnackbar(
          backgroundColor: kSecondaryColor,
          titleText: Center(
            child: Text(
              'LOADING',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
          ),
          messageText: Center(
            child: Text(
              'PLEASE WAIT',
              style: TextStyle(color: Colors.white, fontSize: 12),
            ),
          ),
          duration: Duration(seconds: 1, microseconds: 500),
          maxWidth: 150,
          margin: EdgeInsets.only(bottom: 10),
          borderRadius: 10,
          isDismissible: true,
        );
        getMovieData(pageNumber: initPage);
      } else {
        Get.rawSnackbar(
            backgroundColor: kSecondaryColor,
            titleText: Center(
              child: Text(
                'END',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
            messageText: Center(
              child: Text(
                'END OF RESULT',
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
            ),
            duration: Duration(seconds: 1, microseconds: 500),
            maxWidth: 150,
            margin: EdgeInsets.only(bottom: 10),
            borderRadius: 10);
      }
    }
  }

  @override
  void onInit() {
    super.onInit();
    scrollController.addListener(scrollListener);
    getMovieData();
  }
}
