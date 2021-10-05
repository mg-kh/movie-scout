import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:movie/components/movie_detail/trailer_widget.dart';
import 'package:movie/constants.dart';
import 'package:movie/controller/movie_detail/trailer_controller.dart';

class AboutMovie extends StatelessWidget {
  late final movieDetail;
  AboutMovie({required this.movieDetail});

  final TrailerController trailerController = Get.put(TrailerController());

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //!Poster and play trailer btn
        Padding(
          padding: EdgeInsets.only(top: 20),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(kCardBorderRadius),
            child: Stack(
              alignment: Alignment.center,
              children: [
                //!background cover
                Container(
                  width: double.infinity,
                  height: 330,
                  child: Image.network(
                    'https://www.themoviedb.org/t/p/w220_and_h330_face${movieDetail.backdropPath}',
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
                        'https://www.themoviedb.org/t/p/w220_and_h330_face${movieDetail.posterPath}',
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
                        color: Colors.black.withOpacity(0.6),
                        shape: BoxShape.circle),
                    child: Center(
                      child: IconButton(
                        onPressed: () {
                          showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              builder: (_) {
                                return TrailerWidget();
                              });
                          trailerController.getTrailerData(
                              movieId: Get.parameters['id']);
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
        ),

        SizedBox(
          height: 20,
        ),

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
                    '${movieDetail.title}',
                    style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,color: context.theme.primaryColor,),
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
                          '${movieDetail.voteAverage}',
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
              height: 15,
            ),

            //!Movie genres
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ...movieDetail.genres.map((genre) => Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                        margin: EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                            color: kSecondaryColor,
                            borderRadius: BorderRadius.circular(8)),
                        child: Text(
                          '${genre.name}',
                          style: TextStyle(
                            color: Colors.white,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ))
                ],
              ),
            ),

            SizedBox(
              height: 20,
            ),

            //!Move overview
            Text(
              'Overview',
              style: TextStyle(
                fontSize: kSectionTitleSize,
                fontWeight: FontWeight.bold,
                color: context.theme.primaryColor,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text('${movieDetail.overview}', style: TextStyle(
              color: context.theme.primaryColor,
            ),),

            SizedBox(
              height: 15,
            ),

            //!Runtime and release data
            Row(
              children: [
                //!Runtime
                Container(
                  child: Row(
                    children: [
                      Icon(
                        FeatherIcons.clock,
                        size: 17,
                        color: context.theme.primaryColor,
                      ),
                      SizedBox(
                        width: 7,
                      ),
                      Text(
                        '${(movieDetail.runtime / 60).toStringAsFixed(0)} hr',
                        style: TextStyle(fontStyle: FontStyle.italic,color: context.theme.primaryColor,),
                      ),
                      SizedBox(
                        width: 3,
                      ),
                      Text(
                        '${(movieDetail.runtime % 60).toStringAsFixed(0)} min',
                        style: TextStyle(fontStyle: FontStyle.italic,color: context.theme.primaryColor,),
                      )
                    ],
                  ),
                ),

                SizedBox(
                  width: 20,
                ),

                //!Release date
                Container(
                  child: Row(
                    children: [
                      Icon(
                        FeatherIcons.calendar,
                        size: 17,
                        color: context.theme.primaryColor,
                      ),
                      SizedBox(
                        width: 7,
                      ),
                      Text(
                        '${movieDetail.releaseDate.toString().substring(0, 10)}',
                        style: TextStyle(fontStyle: FontStyle.italic,color: context.theme.primaryColor,),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ],
    );
  }
}
