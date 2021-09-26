import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:movie/constants.dart';

class MovieCard extends StatelessWidget {
  late final movie;

  MovieCard({required this.movie});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed('/detail');
      },
      child: Stack(
        children: [
          //!Image
          Container(
            decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      'https://www.themoviedb.org/t/p/w220_and_h330_face${movie.posterPath}',
                    ))),
          ),

          //!Circular Progress
          Positioned(
            top: 5,
            right: 5,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: 45,
                  height: 45,
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.6), shape: BoxShape.circle),
                  child: CircularProgressIndicator(
                    value: movie.voteAverage / 10,
                    strokeWidth: 3,
                    valueColor:
                        AlwaysStoppedAnimation<Color>(kCircularProgressColor),
                    backgroundColor: kSecondaryLightColor,
                  ),
                ),
                Positioned(
                  child: Text(
                    '${movie.voteAverage}',
                    style: TextStyle(color: Colors.white, fontSize: 10),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
