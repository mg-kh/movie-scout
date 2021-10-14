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
    return GestureDetector(
      onTap: () {
        movieController.getMovieData(pageNumber: 1, genreId: genres.id);
      },
      child: Obx(() =>Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        margin: EdgeInsets.only(right: 8),
        height: 30,
        decoration: BoxDecoration(
            color: genres.id == movieController.genreIdValue.value
                ? kSecondaryColor
                : null,
            borderRadius: BorderRadius.circular(kCardBorderRadius),
            border: genres.id == movieController.genreIdValue.value
                ? null
                : Border.all(width: 1, color: kSecondaryColor)),
        child: Center(
          child: Text(
            '${genres.name}',
            style: genres.id == movieController.genreIdValue.value
                ? TextStyle(
                color: kPrimaryColor, fontSize: kGenreTextSize)
                : TextStyle(
                color: kSecondaryColor, fontSize: kGenreTextSize),
          ),
        ),
      )),
    );
  }
}
