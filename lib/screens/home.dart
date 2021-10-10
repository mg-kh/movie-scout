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
      {"name": "Tending movies", "route": "/trending"},
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
              //!dropdown menu
              Column(
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: context.theme.backgroundColor,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(kCardBorderRadius))),
                    onPressed: () {
                      Get.dialog(
                          Stack(
                            alignment: Alignment.topRight,
                            children: [
                              Positioned(
                                right: 50,
                                top: 50,
                                child: ClipRRect(
                                  borderRadius:
                                      BorderRadius.circular(kCardBorderRadius),
                                  child: Container(
                                    width: 150,
                                    height: 110,
                                    child: Scaffold(
                                      backgroundColor:
                                          context.theme.backgroundColor,
                                      body: Padding(
                                        padding: EdgeInsets.all(15),
                                        child: ListView.separated(
                                          itemCount: routes.length,
                                          separatorBuilder: (_, i){
                                            return SizedBox();
                                          },
                                          itemBuilder: (_, i){
                                            return GestureDetector(
                                              onTap: (){
                                                Get.back();
                                                Get.toNamed('${routes[i]['route']}');
                                              },
                                              child: Container(
                                                height: 35,
                                                margin: EdgeInsets.only(
                                                    bottom: 10
                                                ),
                                                decoration: BoxDecoration(
                                                    color: kSecondaryColor,
                                                    borderRadius: BorderRadius.circular(kCardBorderRadius)
                                                ),
                                                child: Center(
                                                  child: Text('${routes[i]['name']}', style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: kGenreTextSize
                                                  ),),
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          barrierColor: Colors.transparent);
                    },
                    child: Row(
                      children: [
                        Text(
                          'Menu',
                          style: TextStyle(
                              fontSize: kGeneralTextSize,
                              color: context.theme.primaryColor),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Icon(
                          FeatherIcons.chevronDown,
                          size: 15,
                          color: context.theme.primaryColor,
                        )
                      ],
                    ),
                  ),
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
            ),
          ),

          //!movies
          SliverPadding(
            padding: EdgeInsets.only(
              top: 40,
              left: 15,
              right: 15,
            ),
            sliver: Obx(() {
              if (!movieController.isLoading.value) {
                return SliverStaggeredGrid.countBuilder(
                  itemCount: movieController.movieData.length,
                  crossAxisCount: 3,
                  crossAxisSpacing: 7,
                  mainAxisSpacing: 5,
                  staggeredTileBuilder: (int i) => StaggeredTile.count(1, 1.95),
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
      floatingActionButton: Container(
        decoration: BoxDecoration(color: kSecondaryColor, shape: BoxShape.circle),
        child: IconButton(
          onPressed: () {
            Get.dialog(
                Center(
                  child: UnconstrainedBox(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(kCardBorderRadius),
                      child: Container(
                        width: 250,
                        height: 350,
                        padding:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                        color: context.theme.backgroundColor,
                        child: Scaffold(
                          backgroundColor: Colors.transparent,
                          body: Column(
                            children: [
                              Text('Choose Genres', style: TextStyle(
                                fontSize: kGeneralTextSize,
                                color: context.theme.primaryColor
                              ),),
                             SizedBox(height: 10,),
                             Expanded(child:  Obx(() {
                               if (!genreController.isLoading.value) {
                                 return GenreWidget(
                                   genres: genreController.genreData,
                                 );
                               } else {
                                 return ListView.separated(
                                   itemBuilder: (_, i) {
                                     return Container(
                                       height: 30,
                                       child: ShimmerWidget(),
                                     );
                                   },
                                   separatorBuilder: (_, i) {
                                     return SizedBox(
                                       height: 15,
                                     );
                                   },
                                   itemCount: 10,
                                 );
                               }
                             }))
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                barrierColor: Colors.black.withOpacity(0.4),
                barrierDismissible: true);
          },
          icon: Icon(
            FeatherIcons.list,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
