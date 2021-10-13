import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie/components/movie_detail/about_movie_loading.dart';
import 'package:movie/components/movie_detail/cast_data_widget.dart';
import 'package:movie/components/movie_detail/cast_data_widget_loading.dart';
import 'package:movie/components/tv_show_detail/tv_show_detail_widget.dart';
import 'package:movie/constants.dart';
import 'package:movie/controller/tv_show_detail/cast_and_crew.dart';
import 'package:movie/controller/tv_show_detail/tv_show_detail_controller.dart';
import 'package:movie/controller/tv_show_trailer/tv_show_trailer_controller.dart';

class TvShowDetail extends StatelessWidget {
  final TvShowDetailController tvShowDetailController =
      Get.put(TvShowDetailController());

  final CastAndCrewController castAndCrewController =
      Get.put(CastAndCrewController());

  final TvShowTrailerController tvShowTrailerController =
      Get.put(TvShowTrailerController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: context.theme.backgroundColor,
        body: Container(
          padding: EdgeInsets.only(
            top: 20,
            left: kHorizontalPaddingValue,
            right: kHorizontalPaddingValue,
            bottom: 20,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //  !About tv show
                Obx(() {
                  if (tvShowDetailController.isLoading.value != true) {
                    return TvShowDetailWidget(
                      backdropPath: tvShowDetailController
                          .tvShowDetailData.value.backdropPath,
                      posterPath: tvShowDetailController
                          .tvShowDetailData.value.posterPath,
                      name: tvShowDetailController.tvShowDetailData.value.name,
                      genre:
                          tvShowDetailController.tvShowDetailData.value.genres,
                      rating: tvShowDetailController
                          .tvShowDetailData.value.voteAverage,
                      overview: tvShowDetailController
                          .tvShowDetailData.value.overview,
                      seasons:
                          tvShowDetailController.tvShowDetailData.value.seasons,
                      trailerController: tvShowTrailerController,
                    );
                  } else {
                    return AboutMovieLoading();
                  }
                }),

                SizedBox(
                  height: kSectionDividerHeight,
                ),

                //  !Cast And Crew
                Obx(() {
                  if (castAndCrewController.isLoading.value != true) {
                    return CastDataWidget(
                      cast: castAndCrewController.castAndCrewData.value.cast,
                    );
                  } else {
                    return CastDataWidgetLoading();
                  }
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
