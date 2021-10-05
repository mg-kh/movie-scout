import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie/constants.dart';
import 'package:movie/controller/movie_controller.dart';

class GenreWidget extends StatelessWidget {
  final genres;
  final MovieController movieController = Get.put(MovieController());

  GenreWidget({required this.genres});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          ...genres.map(
            (genre) => GestureDetector(
              onTap: () {
                // movieController.movieData.value = [];
                movieController.getMovieData(pageNumber: 1, genreId: genre.id);
              },
              child: Obx(() => Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                margin: EdgeInsets.only(right: 10),
                height: 30,
                decoration: BoxDecoration(
                    color: genre.id == movieController.genreIdValue.value
                        ? kSecondaryColor
                        : null,
                    borderRadius: BorderRadius.circular(kCardBorderRadius),
                    border: genre.id == movieController.genreIdValue.value
                        ? null
                        : Border.all(width: 1, color: kSecondaryColor)),
                child: Center(
                  child: Text(
                    '${genre.name}',
                    style: genre.id == movieController.genreIdValue.value
                        ? TextStyle(color: kPrimaryColor, fontSize: kGenreTextSize)
                        : TextStyle(color: kSecondaryColor, fontSize: kGenreTextSize),
                  ),
                ),
              )),
            ),
          )
        ],
      ),
    );
  }
}
