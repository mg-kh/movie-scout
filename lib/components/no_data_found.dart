import 'package:flutter/material.dart';

class NoDataFound extends StatelessWidget {
  final color;

  NoDataFound({this.color: Colors.white}) ;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Text(
          'No data found!',
          style: TextStyle(color: color),
        ),
      ),
    );
  }
}
