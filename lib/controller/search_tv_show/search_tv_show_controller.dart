import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie/constants.dart';
import 'package:movie/model/search_tv_show/result.dart';
import 'package:movie/services/search_tv_show/search_tv_show_api_service.dart';

class SearchTvShowController extends GetxController {

  var isLoading = false.obs;
  var movieData = <Result>[].obs;
  var currentPage = 1.obs;
  var totalPages = 0.obs;
  var totalMovies = 0.obs;
  var genreIdValue = 28.obs;
  final scrollController = ScrollController();
  var isNextPageLoading = false.obs;
  var isErrorOccur = false.obs;
  var queryData = ''.obs;

  Future getTvShowData({pageNumber: 1, required query}) async {
    isErrorOccur(true);
    queryData(query);

    //!check loading style for specific page
    if (currentPage.value == 1) {
      isLoading(true);
    }


    //! filter several call same genre
    if (movieData.length > 0 && pageNumber == 1) {
      movieData.value = [];
    }


    try {
      var tvShow = await SearchTvShowApiService().remoteGetTvShowData(pageNumber: pageNumber, query: query);
      print(tvShow);

      movieData.value = [...movieData, ...tvShow.results];
      currentPage(tvShow.page);
      totalPages(tvShow.totalPages);
      totalMovies(tvShow.totalResults);

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
        await getTvShowData(
            pageNumber: currentPage.value, query: queryData.value);
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
        print('bottom');
      }
    }
  }

  @override
  void onInit() {
    super.onInit();
    currentPage.value = 1;
    scrollController.addListener(listenScrolling);
  }
}
