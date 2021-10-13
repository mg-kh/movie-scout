import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:movie/components/no_file_widget.dart';
import 'package:movie/constants.dart';
import 'package:transparent_image/transparent_image.dart';

class CastMovieWidget extends StatelessWidget {
  final castMovies;
  CastMovieWidget({required this.castMovies});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //! Section title
          Text(
            'Known for',
            style: TextStyle(
                fontSize: kSectionTitleSize, fontWeight: FontWeight.bold,
              color: context.theme.primaryColor,),
          ),

          SizedBox(
            height: 15,
          ),

          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ...castMovies.map(
                  (movie) => GestureDetector(
                    onTap: () {
                      Get.back();
                      Get.offNamed('/detail/${movie.id}');
                    },
                    child: Container(
                      margin: EdgeInsets.only(right: 18),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //!poster
                          movie.posterPath != null
                              ? Container(
                                  height: 180,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(
                                        kCardBorderRadius),
                                    child: Stack(
                                      children: [
                                        Image.asset(
                                          'resources/images/fake_poster.png',
                                          height: double.infinity,
                                          fit: BoxFit.cover,
                                        ),
                                        FadeInImage.memoryNetwork(
                                          placeholder: kTransparentImage,
                                          image:
                                              'https://www.themoviedb.org/t/p/w220_and_h330_face${movie.posterPath}',
                                          fit: BoxFit.cover,
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              : NoFileWidget(width: 120,height: 180,),

                          SizedBox(
                            height: 5,
                          ),
                          SizedBox(
                            width: 120,
                            child: Text(
                              '${movie.title}',
                              style: TextStyle(
                                  fontSize: 14, fontStyle: FontStyle.italic,
                                color: context.theme.primaryColor,),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
