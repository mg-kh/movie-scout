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
    return ListView.separated(
      itemCount: genres.length,
      itemBuilder: (_, i) {
        return GestureDetector(
          onTap: () {
            movieController.getMovieData(pageNumber: 1, genreId: genres[i].id);
          },
          child: Obx(() => Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                height: 30,
                decoration: BoxDecoration(
                    color: genres[i].id == movieController.genreIdValue.value
                        ? kSecondaryColor
                        : null,
                    borderRadius: BorderRadius.circular(kCardBorderRadius),
                    border: genres[i].id == movieController.genreIdValue.value
                        ? null
                        : Border.all(width: 1, color: kSecondaryColor)),
                child: Center(
                  child: Text(
                    '${genres[i].name}',
                    style: genres[i].id == movieController.genreIdValue.value
                        ? TextStyle(
                            color: kPrimaryColor, fontSize: kGenreTextSize)
                        : TextStyle(
                            color: kSecondaryColor, fontSize: kGenreTextSize),
                  ),
                ),
              )),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return SizedBox(height: 15,);
      },
    );
  }
}
