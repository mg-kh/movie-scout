import 'package:flutter/material.dart';
import 'package:movie/constants.dart';

class HeroContainer extends StatelessWidget {
  final Widget child;
  final double paddingLeft;
  final double paddingRight;
  final double paddingTop;
  final double paddingBottom;

  HeroContainer({
    required this.child,
    this.paddingLeft : 15,
    this.paddingRight : 15,
    this.paddingTop : 15,
    this.paddingBottom : 15,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: paddingLeft,
        right: paddingRight,
        top: paddingTop,
        bottom: paddingBottom,
      ),
      decoration: BoxDecoration(
          color: kSecondaryColor,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(kHeroContainerBorderRadius),
              bottomRight: Radius.circular(kHeroContainerBorderRadius))),
      child: child,
    );
  }
}
