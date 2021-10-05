import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:movie/components/search/search_result_widget.dart';
import 'package:movie/components/shimmer_widget.dart';
import 'package:movie/constants.dart';
import 'package:movie/controller/search/search_controller.dart';

class MovieTab extends StatelessWidget {

  final SearchController searchController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
          child: searchController.isLoading.value != true
              ? StaggeredGridView.countBuilder(
                  itemCount: searchController.searchMovieData.length,
                  crossAxisCount: 4,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 15,
                  padding: EdgeInsets.only(top: 15, bottom: 15, left: 15, right: 15),
                  staggeredTileBuilder: (int index) =>
                      StaggeredTile.count(4, 1.2),
                  itemBuilder: (_, i) {
                    return SearchResultWidget(
                      routeType: 'detail',
                      id: searchController.searchMovieData[i].id,
                      image: searchController.searchMovieData[i].posterPath,
                      text: searchController.searchMovieData[i].title,
                      year: searchController.searchMovieData[i].releaseDate,
                      rating: searchController.searchMovieData[i].voteAverage.toString(),
                    );
                  },
                )
              : StaggeredGridView.countBuilder(
                  itemCount: 6,
                  crossAxisCount: 4,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 15,
                  padding: EdgeInsets.only(top: 15, bottom: 15, left: 15, right: 15),
                  staggeredTileBuilder: (int index) =>
                      StaggeredTile.count(4, 1.2),
                  itemBuilder: (_, i) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(kCardBorderRadius),
                      child: ShimmerWidget(),
                    );
            },
          ),
        ));
  }
}
