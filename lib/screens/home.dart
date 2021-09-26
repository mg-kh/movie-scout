import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie/components/genre_widget.dart';
import 'package:movie/components/hero_container.dart';
import 'package:movie/components/movie_card.dart';
import 'package:movie/constants.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:movie/controller/genre_controller.dart';
import 'package:movie/controller/movie_controller.dart';

class Home extends StatelessWidget {
  final GenreController genreController = Get.put(GenreController());
  final MovieController movieController = Get.put(MovieController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kPrimaryColor,
        body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //! Hero
              HeroContainer(
                paddingTop: 20,
                paddingBottom: 25,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Movie Scout',
                      style: TextStyle(fontSize: 30, color: kPrimaryColor),
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    Text(
                      'Explore movies and \nrelated data.',
                      style: TextStyle(color: kPrimaryColor),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    //!Search Button
                    Container(
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          Get.toNamed('/search');
                        },
                        style: ElevatedButton.styleFrom(
                            primary: kPrimaryColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    kHeroSearchButtonBorderRadius))),
                        child: Row(
                          children: [
                            Icon(
                              FeatherIcons.search,
                              color: kSecondaryLightColor,
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Text(
                              'Search movie, film, people',
                              style: TextStyle(
                                  color: kSecondaryLightColor, fontSize: 15),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),

              SizedBox(
                height: 15,
              ),

              //!Genre
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //! Section title
                    Text(
                      'Movie Genres',
                      style: kSectionTextStyle,
                    ),
                    SizedBox(
                      height: 5,
                    ),

                    //! Generes lists
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: SizedBox(
                        height: 50,
                        child: Obx(() => Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                ...genreController.genreData
                                    .map(
                                      (genre) => GenreWidget(
                                        onTap: () {},
                                        text: genre.name,
                                        isSelected: false,
                                      ),
                                    )
                                    .toList()
                              ],
                            )),
                      ),
                    ),
                  ],
                ),
              ),

              //!Movies
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 15,
                    right: 15,
                    top: 15,
                  ),
                  child: Obx(() => GridView.builder(
                        controller: movieController.scrollController,
                        padding: EdgeInsets.only(top: 10, bottom: 30),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            mainAxisSpacing: 15,
                            crossAxisSpacing: 15,
                            childAspectRatio: 0.65),
                        itemCount: movieController.movieData.length,
                        itemBuilder: (_, index) {
                          return MovieCard(
                            movie: movieController.movieData[index],
                          );
                        },
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
