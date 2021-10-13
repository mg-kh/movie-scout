import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:movie/components/no_file_widget.dart';
import 'package:movie/constants.dart';
import 'package:transparent_image/transparent_image.dart';

class TvShowWidget extends StatelessWidget {
  late final movie;

  TvShowWidget({required this.movie});

  @override
  build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed('/tv-show/${movie.id}');
      },
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                //!image
                movie.posterPath != null
                    ? ClipRRect(
                  borderRadius: BorderRadius.circular(kCardBorderRadius),
                  child: Stack(
                    children: [
                      Image.asset(
                        'resources/images/fake_poster.png',
                        height: 190,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                      ClipRRect(
                        borderRadius:
                        BorderRadius.circular(kCardBorderRadius),
                        child: FadeInImage.memoryNetwork(
                          placeholder: kTransparentImage,
                          image:
                          'https://www.themoviedb.org/t/p/w220_and_h330_face${movie.posterPath}',
                          height: 190,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                )
                    : NoFileWidget(
                  width: double.infinity,
                  height: 190,
                ),

                //!first air date
                if (movie.firstAirDate != '')
                  Positioned(
                    bottom: 0,
                    child: Container(
                      width: 70,
                      height: 20,
                      decoration: BoxDecoration(
                          color: kSecondaryColor,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(kCardBorderRadius),
                            topRight: Radius.circular(kCardBorderRadius),
                          )),
                      child: Center(
                        child: Text(
                          '${movie.firstAirDate.toString().substring(0, 4)}',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: kMovieCardTitleSize),
                        ),
                      ),
                    ),
                  ),

                //  !Rating
                Positioned(
                  top: 0,
                  right: 0,
                  child: Container(
                    width: 55,
                    height: 20,
                    decoration: BoxDecoration(
                        color: kSecondaryColor,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(kCardBorderRadius),
                          topRight: Radius.circular(kCardBorderRadius),
                        )),
                    child: Center(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(FeatherIcons.star, size: 13,color: Colors.white,),
                          SizedBox(width: 5,),
                          Text(
                            '${movie.voteAverage}',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: kMovieCardTitleSize),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(
              height: 7,
            ),

            //!movie title
            Text(
              '${movie.name}',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: context.theme.primaryColor,
                fontSize: kMovieCardTitleSize,
              ),
            )
          ],
        ),
      ),
    );
  }
}
