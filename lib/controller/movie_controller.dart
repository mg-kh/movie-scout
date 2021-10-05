import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:movie/constants.dart';
import 'package:movie/model/movie_model.dart';
import 'package:movie/services/movie_api_service.dart';

class MovieController extends GetxController {
  var isLoading = false.obs;
  var movieData = <Result>[].obs;
  var currentPage = 0.obs;
  var totalPages = 0.obs;
  var totalMovies = 0.obs;
  final scrollController = ScrollController();
  var initPage = 1.obs;
  var genreIdValue = 28.obs;
  var isNextPageLoading = false.obs;

  Future getMovieData({pageNumber: 1, genreId: 28}) async {
    //!check loading style for specific page
    if (initPage.value == 1) {
      isLoading(true);
    }
    //! check same genre or not
    if (genreId != genreIdValue.value) {
      movieData.value = [];
      initPage.value = 1;
    }
    //! filter several call same genre
    if (movieData.length > 0 && pageNumber == 1) {
      movieData.value = [];
    }

    var movie = await MovieApiService()
        .remoteGetMovieData(pageNumber: pageNumber, genreId: genreId);
    if (movie == null) {
      return;
    }

    movieData.value = [...movieData, ...movie.results];
    currentPage(movie.page);
    totalPages(movie.totalPages);
    totalMovies(movie.totalResults);

    if (initPage.value == 1) {
      isLoading(false);
    }
    genreIdValue.value = genreId;
  }

  Future fetchNextPage() async {
    this.isNextPageLoading.value = true;
    if (isNextPageLoading.value == true &&
        movieData.length < totalMovies.value) {
      initPage.value++;
      await getMovieData(
          pageNumber: initPage.value, genreId: genreIdValue.value);
      isNextPageLoading.value = false;
    }
  }

  void listenScrolling(){
    if(scrollController.position.atEdge){
      var isTop = scrollController.position.pixels == 0;
      if(!isTop){
        fetchNextPage();
      }
    }
  }

  @override
  void onInit() {
    super.onInit();
    scrollController.addListener(listenScrolling);
    getMovieData();
  }
}
