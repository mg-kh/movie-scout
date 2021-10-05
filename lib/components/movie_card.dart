import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie/components/no_file_widget.dart';
import 'package:movie/constants.dart';
import 'package:transparent_image/transparent_image.dart';

class MovieCard extends StatelessWidget {
  late final movie;

  MovieCard({required this.movie});

  @override
  build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed('/detail/${movie.id}');
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
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius:
                                    BorderRadius.circular(kCardBorderRadius),
                              ),
                              constraints: BoxConstraints(maxHeight: 170),
                              child: Center(
                                child: SizedBox(
                                  width: 30,
                                  height: 30,
                                  child: CircularProgressIndicator(
                                    color: kSecondaryColor,
                                  ),
                                ),
                              ),
                            ),
                            ClipRRect(
                              borderRadius:
                                  BorderRadius.circular(kCardBorderRadius),
                              child: FadeInImage.memoryNetwork(
                                placeholder: kTransparentImage,
                                image:
                                    'https://www.themoviedb.org/t/p/w220_and_h330_face${movie.posterPath}',
                              ),
                            ),
                          ],
                        ),
                      )
                    : NoFileWidget(width: 150, height: 175,),

                //!release date
                Positioned(
                  bottom: 0,
                  child: Container(
                    width: 70,
                    height: 20,
                    decoration: BoxDecoration(
                        color: kSecondaryColor,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(kCardBorderRadius))),
                    child: Center(
                      child: Text(
                        '${movie.releaseDate.toString().substring(0, 4)}',
                        style: TextStyle(color: Colors.white, fontSize: kMovieCardTitleSize),
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 7,
            ),
            Text(
              '${movie.title}',
              maxLines: 3,
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
