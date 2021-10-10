import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:movie/constants.dart';
import 'package:movie/controller/cast/cast_movie_controller.dart';
import 'package:movie/controller/movie_detail/cast_controller.dart';
import 'package:movie/controller/movie_detail/movie_detail_controller.dart';
import 'package:movie/controller/movie_detail/related_movie_controller.dart';
import 'package:transparent_image/transparent_image.dart';

class RelatedMovieWidget extends StatelessWidget {
  final relMovies;
  RelatedMovieWidget({required this.relMovies});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //!Title
        Text(
          'Related Movies',
          style: TextStyle(
            fontSize: kSectionTitleSize,
            fontWeight: FontWeight.bold,color: context.theme.primaryColor,),
        ),

        SizedBox(height: 10,),

        //!RelatedMovies
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ...relMovies.map((movie) => GestureDetector(
                    onTap: () {
                      Get.offNamed('/detail/${movie.id}');
                    },
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //!Poster
                          Container(
                            width: 160,
                            height: 90,
                            margin: EdgeInsets.only(right: 18),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(kCardBorderRadius),
                              child: Stack(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius:
                                      BorderRadius.circular(kCardBorderRadius),
                                    ),
                                    constraints: BoxConstraints(maxHeight: 170),
                                    child: Image.asset(
                                      'resources/images/fake_poster.png',
                                      width: double.infinity,
                                      height: double.infinity,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  FadeInImage.memoryNetwork(
                                    placeholder: kTransparentImage,
                                    image: 'https://www.themoviedb.org/t/p/w250_and_h141_face${movie.posterPath}',
                                  ),
                                ],
                              ),
                            ),
                          ),

                          SizedBox(
                            height: 5,
                          ),

                          //Title and rating
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              //Title
                              SizedBox(
                                width: 120,
                                child: Text(
                                  '${movie.title}',
                                  style: TextStyle(fontSize: 14,color: context.theme.primaryColor,),
                                ),
                              ),
                              Container(
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(
                                      FeatherIcons.star,
                                      color: kSecondaryColor,
                                      size: 16,
                                    ),
                                    SizedBox(
                                      width: 4,
                                    ),
                                    Text(
                                      '${movie.voteAverage.toStringAsFixed(1)}',
                                      style: TextStyle(
                                          fontStyle: FontStyle.italic,color: context.theme.primaryColor, fontSize: 14),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ))
            ],
          ),
        )
      ],
    );
  }
}
