import 'package:flutter/material.dart';
import 'package:movie/components/shimmer_widget.dart';
import 'package:movie/constants.dart';

class AboutMovieLoading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 20
      ),
      child: Container(
        child: Column(
          children: [
            //  !Hero
            ClipRRect(
              borderRadius: BorderRadius.circular(kCardBorderRadius),
              child: Container(
                height: 330,
                width: double.infinity,
                child: ShimmerWidget(),
              ),
            ),

            SizedBox(height: 15,),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //  !Title and rating
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 200,
                      height: 20,
                      child: ClipRRect(
                        child: ShimmerWidget(),
                        borderRadius: BorderRadius.circular(kCardBorderRadius),
                      ),
                    ),
                    SizedBox(
                      width: 50,
                      height: 20,
                      child: ShimmerWidget(),
                    ),
                  ],
                ),

                SizedBox(height: 15,),

              //  !MovieGenre
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ...List.generate(3, (index) => Container(
                        margin: EdgeInsets.only(right: 10),
                        width: 70,
                        height: 20,
                        child: ShimmerWidget(),
                      ))
                    ],
                  ),
                ),

                SizedBox(height: 15,),

              //  !Overiew
                SizedBox(
                  width: 90,
                  height: 20,
                  child: ClipRRect(
                    child: ShimmerWidget(),
                    borderRadius: BorderRadius.circular(kCardBorderRadius),
                  ),
                ),
                SizedBox(height: 15,),
                SizedBox(
                  width: double.infinity,
                  height: 100,
                  child: ShimmerWidget(),
                ),

                SizedBox(height: 15,),

                //  !duration and relase date
                Row(
                  children: [
                    SizedBox(
                      width: 100,
                      height: 20,
                      child: ShimmerWidget(),
                    ),
                    SizedBox(width: 20,),
                    SizedBox(
                      width: 100,
                      height: 20,
                      child: ShimmerWidget(),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
