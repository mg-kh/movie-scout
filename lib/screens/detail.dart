import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie/components/movie_detail/about_movie.dart';
import 'package:movie/components/movie_detail/about_movie_loading.dart';
import 'package:movie/components/movie_detail/cast_data_widget.dart';
import 'package:movie/components/movie_detail/cast_data_widget_loading.dart';
import 'package:movie/components/movie_detail/related_movie_widget.dart';
import 'package:movie/constants.dart';
import 'package:movie/controller/movie_detail/cast_controller.dart';
import 'package:movie/controller/movie_detail/movie_detail_controller.dart';
import 'package:movie/controller/movie_detail/related_movie_controller.dart';

class Detail extends StatelessWidget {
  final MovieDetailController movieDetailController =
      Get.put(MovieDetailController());
  final CastController castController = Get.put(CastController());
  final RelatedMovieController relatedMovieController =
      Get.put(RelatedMovieController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: context.theme.backgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: kHorizontalPaddingValue),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //!About movie
              Obx(() {
                if (!movieDetailController.isLoading.value) {
                  return AboutMovie(
                    movieDetail: movieDetailController.movieDetail.value,
                  );
                } else {
                  return AboutMovieLoading();
                }
              }),

              SizedBox(
                height: 20,
              ),

              //!Casts
              Obx(() {
                if (!castController.isLoading.value) {
                  return CastDataWidget(
                    cast: castController.castData,
                  );
                } else {
                  return CastDataWidgetLoading();
                }
              }),

              SizedBox(
                height: 20,
              ),

              //!Related Movies
              Obx(() {
                if (!relatedMovieController.isLoading.value) {
                  return RelatedMovieWidget(
                      relMovies: relatedMovieController.relMovieData);
                } else {
                  return CastDataWidgetLoading();
                }
              }),

              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
