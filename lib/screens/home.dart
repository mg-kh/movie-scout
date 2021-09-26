import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie/components/genre_widget.dart';
import 'package:movie/components/hero_container.dart';
import 'package:movie/components/movie_card.dart';
import 'package:movie/constants.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //! Hero
              HeroContainer(
                paddingTop: 35,
                paddingBottom: 25,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Movie Scout',
                      style: TextStyle(fontSize: 33, color: kPrimaryColor),
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    Text(
                      'Explore movies and \nrelated data.',
                      style: TextStyle(color: kPrimaryColor),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    //!Search Button
                    Container(
                      height: 60,
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
                                  color: kSecondaryLightColor, fontSize: 18),
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
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            GenreWidget(
                              onTap: () {},
                              text: 'Action',
                              isSelected: true,
                            ),
                            GenreWidget(
                              onTap: () {},
                              text: 'Horror',
                            ),
                            GenreWidget(
                              onTap: () {},
                              text: 'Documentary',
                            ),
                            GenreWidget(
                              onTap: () {},
                              text: 'Science Fiction',
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // ! Movies
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: 15, right: 15, top: 15),
                  child: GridView.count(
                    crossAxisCount: 2,
                    mainAxisSpacing: 15,
                    crossAxisSpacing: 15,
                    childAspectRatio: 0.8,
                    children: [
                      ...List.generate(
                          10,
                          (index) => MovieCard()).toList()
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
