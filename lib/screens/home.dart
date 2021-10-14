import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:movie/components/genre_widget.dart';
import 'package:movie/components/movie_card.dart';
import 'package:movie/components/shimmer_widget.dart';
import 'package:movie/components/try_again.dart';
import 'package:movie/constants.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:movie/controller/genre_controller.dart';
import 'package:movie/controller/movie_controller.dart';

class Home extends StatelessWidget {
  final GenreController genreController = Get.put(GenreController());
  final MovieController movieController = Get.put(MovieController());

  @override
  Widget build(BuildContext context) {
    var routes = [
      {"name": "Popular movies", "route": "/popular"},
      {"name": "Popular Tv shows", "route": "/popular-tv-show"},
    ];

    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: CustomScrollView(
        controller: movieController.scrollController,
        slivers: [
          SliverAppBar(
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Movie Scout',
                  style:
                      TextStyle(color: kPrimaryColor, fontSize: kHeroTitleSize),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'Explore movies and \nrelated data.',
                  style: TextStyle(
                      color: kPrimaryColor,
                      fontSize: kHeroTextSize,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
            floating: true,
            backgroundColor: kSecondaryColor,
            toolbarHeight: 100,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(kCardBorderRadius),
              bottomRight: Radius.circular(kCardBorderRadius),
            )),
            actions: [
              //!dropdown button
              Column(
                children: [
                  PopupMenuButton(
                    itemBuilder: (_) => [
                      ...routes.map((route) => PopupMenuItem(
                            value: route['route'],
                            child: Text(
                              '${route['name']}',
                              style:
                                  TextStyle(color: context.theme.primaryColor),
                            ),
                          ))
                    ],
                    onSelected: (value) {
                      Get.toNamed('$value');
                    },
                    child: Chip(
                      padding: EdgeInsets.symmetric(horizontal: 7),
                      backgroundColor: context.theme.backgroundColor,
                      label: Row(
                        children: [
                          Text(
                            'Menu',
                            style: TextStyle(color: context.theme.primaryColor),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Icon(
                            FeatherIcons.chevronDown,
                            size: 16,
                            color: context.theme.primaryColor,
                          )
                        ],
                      ),
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(kCardBorderRadius)),
                  )
                ],
              ),

              SizedBox(
                width: 5,
              ),

              //!setting
              Column(
                children: [
                  IconButton(
                    onPressed: () {
                      Get.toNamed('/setting');
                    },
                    padding: EdgeInsets.all(0),
                    icon: Icon(
                      FeatherIcons.settings,
                      color: Colors.white,
                    ),
                  )
                ],
              ),

              SizedBox(
                width: 5,
              )
            ],
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(30),
              child: Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.center,
                children: [
                  //!Base
                  Container(
                    width: double.infinity,
                    height: 30,
                    margin: EdgeInsets.only(
                      top: 10,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                    ),
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
                                borderRadius:
                                    BorderRadius.circular(kCardBorderRadius))),
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
                              'Search movies, films, people',
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
            ),
          ),

          //!genres
          SliverPadding(
            padding: EdgeInsets.only(
              top: 40,
              bottom: 15,
              left: kHorizontalPaddingValue,
              right: kHorizontalPaddingValue,
            ),
            sliver: SliverFixedExtentList(
              itemExtent: 30,
              delegate: SliverChildListDelegate([
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Obx(() {
                    if (!genreController.isLoading.value) {
                      return Row(
                        children: [
                          ...genreController.genreData
                              .map((genre) => GenreWidget(genres: genre))
                        ],
                      );
                    } else {
                      return Row(
                        children: [
                          ...List.generate(
                              10,
                              (index) => Container(
                                    width: 70,
                                    height: 30,
                                    margin: EdgeInsets.only(right: 8),
                                    child: ShimmerWidget(),
                                  ))
                        ],
                      );
                    }
                  }),
                ),
              ]),
            ),
          ),

          //!movies
          SliverPadding(
            padding: EdgeInsets.only(
              top: 10,
              left: kHorizontalPaddingValue,
              right: kHorizontalPaddingValue,
            ),
            sliver: Obx(() {
              if (!movieController.isLoading.value) {
                return SliverStaggeredGrid.countBuilder(
                  itemCount: movieController.movieData.length,
                  crossAxisCount: 3,
                  crossAxisSpacing: 7,
                  mainAxisSpacing: 5,
                  staggeredTileBuilder: (int i) => StaggeredTile.count(1, 1.9),
                  itemBuilder: (_, i) {
                    return MovieCard(movie: movieController.movieData[i]);
                  },
                );
              } else {
                return SliverStaggeredGrid.countBuilder(
                  crossAxisCount: 3,
                  staggeredTileBuilder: (int i) => StaggeredTile.count(1, 1.95),
                  itemCount: 9,
                  crossAxisSpacing: 7,
                  mainAxisSpacing: 5,
                  itemBuilder: (_, i) {
                    return ShimmerWidget();
                  },
                );
              }
            }),
          ),

          //!loading
          SliverFixedExtentList(
            itemExtent: 70,
            delegate: SliverChildListDelegate([
              Obx(() {
                if (movieController.isNextPageLoading.value)
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 100,
                        height: 40,
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
                                style: TextStyle(
                                    color: Colors.white, fontSize: 13),
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
            ]),
          )
        ],
      ),
      floatingActionButton: Obx((){
        if(movieController.scrollValue.value > 300){
          return FloatingActionButton(
            onPressed: (){
              movieController.scrollToTop();
            },
            child: Icon(FeatherIcons.arrowUp)
            ,
          );
        }else{
          return SizedBox();
        }
      })

    );
  }
}
