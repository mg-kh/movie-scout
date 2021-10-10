import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:movie/components/movie_card.dart';
import 'package:movie/components/shimmer_widget.dart';
import 'package:movie/constants.dart';
import 'package:movie/controller/trending/trending_controller.dart';


class Trending extends StatelessWidget {

  final TrendingController trendingController = Get.put(TrendingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: AppBar(
        backgroundColor: kSecondaryColor,
        title: Text(
          'Trending movies on TMDB',
          style: TextStyle(fontSize: 15),
        ),
        actions: [
          IconButton(
            onPressed: (){
              Get.toNamed('/search');
            },
            icon: Icon(FeatherIcons.search),
          ),
          SizedBox(width: 10,),
        ],
      ),
      body: Column(
        children: [
          Obx(() {
            if (!trendingController.isLoading.value) {
              return Expanded(
                child: StaggeredGridView.countBuilder(
                  controller: trendingController.scrollController,
                  crossAxisCount: 3,
                  itemCount: trendingController.trendingData.length,
                  shrinkWrap: true,
                  crossAxisSpacing: 7,
                  mainAxisSpacing: 5,
                  padding: EdgeInsets.only(
                      top: 25,
                      left: kHorizontalPaddingValue,
                      right: kHorizontalPaddingValue,
                      bottom: 15),
                  staggeredTileBuilder: (int i) => StaggeredTile.count(1, 1.95),
                  itemBuilder: (_, i) {
                    return MovieCard(movie: trendingController.trendingData[i]);
                  },
                ),
              );
            } else {
              return Expanded(
                child: StaggeredGridView.countBuilder(
                  crossAxisCount: 3,
                  itemCount: 20,
                  shrinkWrap: true,
                  crossAxisSpacing: 7,
                  mainAxisSpacing: 5,
                  padding: EdgeInsets.only(
                      top: 25,
                      left: kHorizontalPaddingValue,
                      right: kHorizontalPaddingValue,
                      bottom: 15),
                  staggeredTileBuilder: (int i) => StaggeredTile.count(1, 1.95),
                  itemBuilder: (_, i) {
                    return ShimmerWidget();
                  },
                ),
              );
            }
          }),
          Obx(() {
            if (trendingController.isNextPageLoading.value)
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 100,
                    height: 40,
                    margin: EdgeInsets.symmetric(vertical: 15),
                    decoration: BoxDecoration(
                        color: kSecondaryColor,
                        borderRadius: BorderRadius.circular(kCardBorderRadius)),
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Loading',
                            style: TextStyle(color: Colors.white, fontSize: 13),
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
            else
              return SizedBox();
          }),
        ],
      ),
    );
  }
}
