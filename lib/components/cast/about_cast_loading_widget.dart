import 'package:flutter/material.dart';
import 'package:movie/components/shimmer_widget.dart';

class AboutCastLoadingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //  !Profile and info
        Container(
          height: 150,
          child: ShimmerWidget(),
        ),

        SizedBox(
          height: 20,
        ),

        Container(
          height: 20,
          width: 150,
          child: ShimmerWidget(),
        ),
        SizedBox(
          height: 20,
        ),

        Container(
          height: 20,
          width: 150,
          child: ShimmerWidget(),
        ),
        SizedBox(
          height: 20,
        ),

        Container(
          height: 20,
          width: 150,
          child: ShimmerWidget(),
        ),
      ],
    );
  }
}
