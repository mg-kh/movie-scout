import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie/constants.dart';
import 'package:movie/model/trending/result.dart';
import 'package:movie/services/trending/trending_api_service.dart';

class TrendingController extends GetxController {
  var isLoading = false.obs;
  var trendingData = <Result>[].obs;
  var currentPage = 1.obs;
  var totalPages = 0.obs;
  var totalMovies = 0.obs;
  final scrollController = ScrollController();
  var isNextPageLoading = false.obs;
  var isErrorOccur = false.obs;

  Future getTrendingData({pageNumber: 1, genreId: 28}) async {
    isErrorOccur(true);

    //!check loading style for specific page
    if (currentPage.value == 1) {
      isLoading(true);
    }

    try {
      var movie = await TrendingApiService()
          .remoteGetTrendingMovieData(pageNumber: pageNumber);

      trendingData.value = [...trendingData, ...movie.results];
      currentPage(movie.page);
      totalPages(movie.totalPages);
      totalMovies(movie.totalResults);

      if (currentPage.value == 1) {
        isLoading(false);
      }
    } catch (e) {
      isErrorOccur(true);
      if (currentPage.value == 1) {
        isLoading(false);
      }
    }
  }

  Future fetchNextPage() async {
    this.isNextPageLoading.value = true;
    if (isNextPageLoading.value == true &&
        currentPage.value <= totalPages.value) {
      if (currentPage.value < totalPages.value) {
        currentPage.value++;
        await getTrendingData(
            pageNumber: currentPage.value);
        isNextPageLoading.value = false;
      } else {
        isNextPageLoading.value = false;
        Get.snackbar('End', 'End of result',
            backgroundColor: kSecondaryColor,
            maxWidth: 200,
            snackPosition: SnackPosition.BOTTOM,
            duration: Duration(seconds: 1, milliseconds: 500),
            titleText: SizedBox(),
            messageText: Center(
              child: Text(
                'End of result.',
                style: TextStyle(color: Colors.white),
              ),
            ),
            margin: EdgeInsets.only(bottom: 10));
      }
    }
  }

  void listenScrolling() {
    if (scrollController.position.atEdge) {
      var isTop = scrollController.position.pixels == 0;
      if (!isTop) {
        fetchNextPage();
      }
    }
  }

  @override
  void onInit() {
    super.onInit();
    currentPage.value = 1;
    scrollController.addListener(listenScrolling);
    getTrendingData();
  }
}
