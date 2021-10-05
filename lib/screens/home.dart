import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:movie/components/genre_widget.dart';
import 'package:movie/components/movie_card.dart';
import 'package:movie/components/shimmer_widget.dart';
import 'package:movie/constants.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:movie/controller/genre_controller.dart';
import 'package:movie/controller/movie_controller.dart';
import 'package:dotted_border/dotted_border.dart';

class Home extends StatelessWidget {
  final GenreController genreController = Get.put(GenreController());
  final MovieController movieController = Get.put(MovieController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: context.theme.backgroundColor,
        body: Container(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: kHorizontalPaddingValue),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //!Hero
                Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.center,
                  children: [
                    //!Base
                    Container(
                      width: double.infinity,
                      height: 125,
                      margin: EdgeInsets.only(
                        top: 10,
                      ),
                      decoration: BoxDecoration(
                        color: kSecondaryColor,
                        borderRadius: BorderRadius.circular(kCardBorderRadius),
                      ),
                    ),

                    //!Setting button
                    Positioned(
                      top: 10,
                      right: 5,
                      child: IconButton(
                        onPressed: () {
                          Get.toNamed('/setting');
                        },
                        padding: EdgeInsets.all(0),
                        icon: Icon(
                          FeatherIcons.settings,
                          color: Colors.white,
                        ),
                      ),
                    ),

                    //!Text
                    Positioned(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Movie Scout',
                            style:
                                TextStyle(fontSize: kHeroTitleSize, color: kPrimaryColor),
                          ),
                          SizedBox(
                            height: 7,
                          ),
                          Text(
                            'Explore movies and \nrelated data.',
                            style: TextStyle(color: kPrimaryColor, fontSize: kHeroTextSize),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                      top: 20,
                      left: 15,
                    ),

                    //!SearchButton
                    Positioned(
                      bottom: -20,
                      child: Container(
                        height: 50,
                        width: 350,
                        child: ElevatedButton(
                          onPressed: () {
                            Get.toNamed('/search');
                          },
                          style: ElevatedButton.styleFrom(
                              primary: kPrimaryColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      kCardBorderRadius))),
                          child: Row(
                            children: [
                              Icon(
                                FeatherIcons.search,
                                color: kSecondaryColor,
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Text(
                                'Search movie, film, people',
                                style: TextStyle(
                                    color: kSecondaryColor, fontSize: 15),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(
                  height: 35,
                ),

                //!Genre
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //! Section title
                    Text(
                      'Movie Genres',
                      style: TextStyle(
                          fontSize: kSectionTitleSize,
                          fontWeight: FontWeight.bold,
                          color: context.theme.primaryColor),
                    ),

                    //! Generes lists
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: SizedBox(
                        height: 50,
                        child: Obx(() {
                          if (!genreController.isLoading.value) {
                            return GenreWidget(
                              genres: genreController.genreData,
                            );
                          } else {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                ...List.generate(
                                    5,
                                    (index) => Container(
                                          margin: EdgeInsets.only(right: 10),
                                          width: 80,
                                          height: 30,
                                          child: ShimmerWidget(),
                                        ))
                              ],
                            );
                          }
                        }),
                      ),
                    ),
                  ],
                ),

                //!Movies
                Expanded(
                  child: Obx(() {
                    if (!movieController.isLoading.value) {
                      return StaggeredGridView.countBuilder(
                        controller: movieController.scrollController,
                        itemCount: movieController.movieData.length,
                        crossAxisCount: 3,
                        crossAxisSpacing: 7,
                        mainAxisSpacing: 5,
                        shrinkWrap: true,
                        staggeredTileBuilder: (int i) =>
                            StaggeredTile.count(1, 1.95),
                        itemBuilder: (_, i) {
                          return MovieCard(movie: movieController.movieData[i]);
                        },
                      );
                    } else {
                      return GridView(
                        padding: EdgeInsets.only(top: 10, bottom: 30),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            mainAxisSpacing: 15,
                            crossAxisSpacing: 15,
                            childAspectRatio: 0.65),
                        children: [
                          ...List.generate(9, (index) => ShimmerWidget())
                        ],
                      );
                    }
                  }),
                ),

                //!Loading next page
                Obx((){
                  if (movieController.isNextPageLoading.value)
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 100,
                          height: 40,
                          margin: EdgeInsets.symmetric(
                              vertical: 15
                          ),
                          decoration: BoxDecoration(
                              color: kSecondaryColor,
                              borderRadius: BorderRadius.circular(kCardBorderRadius)
                          ),
                          child: Center(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text('Loading', style: TextStyle(
                                    color: Colors.white,
                                  fontSize: 13
                                ),),
                                SizedBox(height: 5,),
                                SizedBox(
                                  width: 50,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(kCardBorderRadius),
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
          ),
        ),
      ),
    );
  }
}
