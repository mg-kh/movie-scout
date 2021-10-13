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
import 'package:movie/controller/movie_detail/trailer_controller.dart';

class Detail extends StatelessWidget {
  final MovieDetailController movieDetailController = Get.find();
  final CastController castController = Get.find();
  final RelatedMovieController relatedMovieController = Get.find();
  final TrailerController trailerController = Get.put(TrailerController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: SingleChildScrollView(
    child: Padding(
      padding: EdgeInsets.only(
        top: 35,
        left: kHorizontalPaddingValue,
        right: kHorizontalPaddingValue,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //!About movie
          Obx(() {
            if (!movieDetailController.isLoading.value) {
              return AboutMovie(
                movieDetail: movieDetailController.movieDetail.value,
                trailerController: trailerController,
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
    );
  }
}
