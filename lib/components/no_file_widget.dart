import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:movie/constants.dart';

class NoFileWidget extends StatelessWidget {
  final double? width;
  final double? height;
  final Color? color;

  NoFileWidget({
    this.width = double.infinity,
    this.height = double.infinity,
    this.color = Colors.grey,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(kCardBorderRadius),
        color: color,
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(FeatherIcons.file),
            SizedBox(
              height: 5,
            ),
            Text('No photo')
          ],
        ),
      ),
    );
  }
}
