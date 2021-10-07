import 'dart:ui';
import 'package:flutter/material.dart';
import '../constants.dart';

class TryAgain extends StatelessWidget {
  final click;
  final color;

  TryAgain({required this.click, this.color : Colors.white});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "We're Sorry. Error Occur.",
            style: TextStyle(
              fontSize: kSectionTitleSize,
              color: color,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
            onPressed: click,
            child: Text('Try Again'),
          ),
        ],
      ),
    );
  }
}
