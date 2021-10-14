import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie/constants.dart';
import 'package:movie/model/movie/result.dart';
import 'package:movie/services/movie_api_service.dart';

class MovieController extends GetxController {
  var isLoading = false.obs;
  var movieData = <Result>[].obs;
  var currentPage = 1.obs;
  var totalPages = 0.obs;
  var totalMovies = 0.obs;
  var genreIdValue = 28.obs;
  final scrollController = ScrollController();
  var isNextPageLoading = false.obs;
  var isErrorOccur = false.obs;
  var scrollValue = 0.0.obs;

  Future getMovieData({pageNumber: 1, genreId: 28}) async {
    isErrorOccur(true);

    //!check loading style for specific page
    if (currentPage.value == 1) {
      isLoading(true);
    }

    //! check same genre or not
    if (genreId != genreIdValue.value) {
      movieData.value = [];
    }

    //! filter several call same genre
    if (movieData.length > 0 && pageNumber == 1) {
      movieData.value = [];
    }

    //! change genre ui active state
    genreIdValue.value = genreId;

    try {
      var movie = await MovieApiService()
          .remoteGetMovieData(pageNumber: pageNumber, genreId: genreId);

      movieData.value = [...movieData, ...movie.results];
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
        await getMovieData(
            pageNumber: currentPage.value, genreId: genreIdValue.value);
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
    scrollValue(scrollController.position.pixels);
    if (scrollController.position.atEdge) {
      var isTop = scrollController.position.pixels == 0;
      if (!isTop) {
        fetchNextPage();
      }
    }
  }

  void scrollToTop() {
    scrollController.animateTo(
      0,
      duration: Duration(seconds: 1),
      curve: Curves.easeIn,
    );
  }

  @override
  void onInit() {
    super.onInit();
    currentPage.value = 1;
    scrollController.addListener(listenScrolling);
    getMovieData();
  }
}
