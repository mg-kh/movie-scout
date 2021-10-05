import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:movie/constants.dart';
import 'package:shimmer/shimmer.dart';


class ShimmerWidget extends StatelessWidget {
ShimmerWidget();

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(kCardBorderRadius),
      child: Shimmer.fromColors(
        baseColor: HexColor('#DDDEE0'),
        highlightColor: HexColor('#F8F8F8'),
        child: Container(
          color: Colors.white,
        ),
      ),
    );
  }
}
