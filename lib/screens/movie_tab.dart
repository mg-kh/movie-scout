import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:movie/components/no_data_found.dart';
import 'package:movie/components/search/search_result_widget.dart';
import 'package:movie/components/shimmer_widget.dart';
import 'package:movie/constants.dart';
import 'package:movie/controller/search_movie/search_movie_controller.dart';

class MovieTab extends StatelessWidget {
  final SearchMovieController searchMovieController =
      Get.put(SearchMovieController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: Obx(() => Container(
          child: searchMovieController.isLoading.value != true
              ? searchMovieController.resultMovieData.length != 0
              ? StaggeredGridView.countBuilder(
            controller: searchMovieController.scrollController,
            itemCount: searchMovieController.resultMovieData.length,
            crossAxisCount: 4,
            crossAxisSpacing: 5,
            mainAxisSpacing: 15,
            padding: EdgeInsets.only(
                top: 15, bottom: 15, left: 15, right: 15),
            staggeredTileBuilder: (int index) =>
                StaggeredTile.count(4, 1.2),
            itemBuilder: (_, i) {
              return SearchResultWidget(
                routeType: 'detail',
                id: searchMovieController.resultMovieData[i].id,
                image: searchMovieController
                    .resultMovieData[i].posterPath,
                text: searchMovieController.resultMovieData[i].title,
                year: searchMovieController
                    .resultMovieData[i].releaseDate,
                rating: searchMovieController
                    .resultMovieData[i].voteAverage
                    .toString(),
              );
            },
          )
              : NoDataFound(
            color: context.theme.primaryColor,
          )
              : StaggeredGridView.countBuilder(
            itemCount: 6,
            crossAxisCount: 4,
            crossAxisSpacing: 5,
            mainAxisSpacing: 15,
            padding:
            EdgeInsets.only(top: 15, bottom: 15, left: 15, right: 15),
            staggeredTileBuilder: (int index) =>
                StaggeredTile.count(4, 1.2),
            itemBuilder: (_, i) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(kCardBorderRadius),
                child: ShimmerWidget(),
              );
            },
          ),
        )),),

        //! next page loading
        Obx(() {
          if(searchMovieController.isNextPageLoading.value == true){
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 100,
                  height: 40,
                  margin: EdgeInsets.symmetric(vertical: 15),
                  decoration: BoxDecoration(
                      color: kSecondaryColor,
                      borderRadius:
                      BorderRadius.circular(kCardBorderRadius)),
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Loading',
                          style:
                          TextStyle(color: Colors.white, fontSize: 13),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        SizedBox(
                          width: 50,
                          child: ClipRRect(
                            borderRadius:
                            BorderRadius.circular(kCardBorderRadius),
                            child: LinearProgressIndicator(
                              color: Colors.white,
                              backgroundColor: kSecondaryColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            );
          }else{
            return SizedBox();
          }
        })
      ],
    );
  }
}
