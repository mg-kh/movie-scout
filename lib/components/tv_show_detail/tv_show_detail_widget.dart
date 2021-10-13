import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:movie/components/movie_detail/trailer_widget.dart';
import 'package:movie/constants.dart';
import 'package:get/get.dart';

class TvShowDetailWidget extends StatelessWidget {
  final backdropPath;
  final posterPath;
  final name;
  final genre;
  final rating;
  final overview;
  final seasons;
  final trailerController;

  TvShowDetailWidget({
    required this.backdropPath,
    required this.posterPath,
    required this.name,
    required this.genre,
    required this.rating,
    required this.overview,
    required this.seasons,
    required this.trailerController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //!poster
        ClipRRect(
          borderRadius: BorderRadius.circular(kCardBorderRadius),
          child: Stack(
            alignment: Alignment.center,
            children: [
              //!background cover
              Container(
                width: double.infinity,
                height: 330,
                child: Image.network(
                  'https://www.themoviedb.org/t/p/w220_and_h330_face$backdropPath',
                  fit: BoxFit.cover,
                ),
              ),

              //!blur layer
              Positioned.fill(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                  child: Container(
                    color: Colors.black.withOpacity(0.5),
                    // color: Colors.red,
                  ),
                ),
              ),

              //!movie poster
              Positioned(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(kCardBorderRadius),
                  child: Container(
                    width: 170,
                    child: Image.network(
                      'https://www.themoviedb.org/t/p/w220_and_h330_face$posterPath',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),

              //!play button
              Positioned(
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                      color: kSecondaryColor.withOpacity(0.8),
                      shape: BoxShape.circle),
                  child: Center(
                    child: IconButton(
                      onPressed: () {
                        Get.dialog(TrailerWidget(trailerController: trailerController,));
                      },
                      icon: Icon(
                        FeatherIcons.play,
                        size: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),

        SizedBox(
          height: kSectionDividerHeight,
        ),

        //!title and overview
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //!Movie name and Rating
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //!Movie Name
                SizedBox(
                  width: 250,
                  child: Text(
                    '$name',
                    style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      color: context.theme.primaryColor,
                    ),
                  ),
                ),

                //!Rating
                Row(
                  children: [
                    Icon(
                      FeatherIcons.star,
                      color: kSecondaryColor,
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '$rating',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                            color: context.theme.primaryColor,
                          ),
                        ),
                        Text(
                          'TMDB Rating',
                          style: TextStyle(fontSize: 6, color: kSecondaryColor),
                        )
                      ],
                    )
                  ],
                )
              ],
            ),

            SizedBox(
              height: kTitleAndContentHeight,
            ),

            //!Movie genres
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ...genre.map(
                    (genre) => Container(
                      margin: EdgeInsets.only(right: 7),
                      child: Chip(
                          backgroundColor: kSecondaryColor,
                          label: Text(
                            '${genre.name}',
                            style: TextStyle(
                              color: Colors.white,
                              fontStyle: FontStyle.italic,
                            ),
                          )),
                    ),
                  )
                ],
              ),
            ),

            SizedBox(
              height: kSectionDividerHeight,
            ),

            //!Movie overview
            Text(
              'Overview',
              style: TextStyle(
                fontSize: kSectionTitleSize,
                fontWeight: FontWeight.bold,
                color: context.theme.primaryColor,
              ),
            ),
            SizedBox(
              height: kTitleAndContentHeight,
            ),
            Text(
              '$overview',
              style: TextStyle(
                color: context.theme.primaryColor,
              ),
            ),
          ],
        ),

        SizedBox(
          height: kSectionDividerHeight,
        ),

        //  !season and episodes
        Text(
          'Seasons and episodes',
          style: TextStyle(
              fontSize: kSectionTitleSize,
              fontWeight: FontWeight.bold,
              color: context.theme.primaryColor),
        ),
        SizedBox(
          height: kTitleAndContentHeight,
        ),
        ListView.builder(
          itemCount: seasons.length,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (_, i) {
            if (seasons[i].seasonNumber != 0) {
              return ExpansionTile(
                iconColor: kSecondaryColor,
                collapsedIconColor: kSecondaryColor,
                title: Row(
                  children: [
                    Icon(
                      FeatherIcons.film,
                      color: kSecondaryColor,
                      size: 15,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Season ${seasons[i].seasonNumber}',
                      style: TextStyle(
                          color: context.theme.primaryColor,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    color: context.theme.backgroundColor,
                    child: Column(
                      children: [
                        //! Overiew
                        if (seasons[i].overview != '')
                          Text(
                            '${seasons[i].overview}',
                            style: TextStyle(color: context.theme.primaryColor),
                          ),

                        if (seasons[i].overview != '')
                          SizedBox(
                            height: kSectionDividerHeight - 10,
                          ),

                        //! Episodes
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Number of episodes',
                                style: TextStyle(
                                    color: context.theme.primaryColor)),
                            Chip(
                              label: Text(
                                '${seasons[i].episodeCount}',
                                style: TextStyle(color: Colors.white),
                              ),
                              backgroundColor: kSecondaryColor,
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              );
            } else {
              return SizedBox();
            }
          },
        ),
      ],
    );
  }
}
