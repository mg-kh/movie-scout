import 'package:flutter/material.dart';
import 'package:movie/components/shimmer_widget.dart';

class AboutCastLoadingWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //  !Profile and info
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //!Profile
            Container(
              width: 150,
              height: 250,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: ShimmerWidget(),
              ),
            ),

            SizedBox(width: 20,),

            //!Info
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 150,
                  height: 20,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: ShimmerWidget(),
                  ),
                ),
                SizedBox(height: 15,),
                Container(
                  width: 100,
                  height: 10,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: ShimmerWidget(),
                  ),
                ),
                SizedBox(height: 15,),
                Container(
                  width: 100,
                  height: 10,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: ShimmerWidget(),
                  ),
                ),
                SizedBox(height: 15,),
                Container(
                  width: 100,
                  height: 10,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: ShimmerWidget(),
                  ),
                ),
                SizedBox(height: 15,),
                Container(
                  width: 100,
                  height: 10,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: ShimmerWidget(),
                  ),
                ),
                SizedBox(height: 15,),
                Container(
                  width: 100,
                  height: 10,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: ShimmerWidget(),
                  ),
                ),
                SizedBox(height: 15,),
                Container(
                  width: 100,
                  height: 10,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: ShimmerWidget(),
                  ),
                ),
              ],
            )

          ],
        ),

        SizedBox(height: 20,),

        Container(
          width: 150,
          height: 20,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: ShimmerWidget(),
          ),
        ),

        SizedBox(height: 15,),

        Container(
          width: double.infinity,
          height: 60,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: ShimmerWidget(),
          ),
        ),

        SizedBox(height: 5,),

        Container(
          width: 100,
          height: 40,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: ShimmerWidget(),
          ),
        ),
      ],
    );
  }
}
