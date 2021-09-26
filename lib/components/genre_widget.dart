import 'package:flutter/material.dart';
import 'package:movie/constants.dart';

class GenreWidget extends StatelessWidget {
  final String text;
  final bool isSelected;
  final onTap;

  GenreWidget({required this.text,required this.onTap, this.isSelected: false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        margin: EdgeInsets.only(right: 10),
        height: 35,
        decoration: BoxDecoration(
            color: isSelected ? kSecondaryColor : null,
            borderRadius: BorderRadius.circular(20),
            border:
            isSelected ? null : Border.all(width: 1, color: kSecondaryColor)),
        child: Center(
          child: Text(
            '$text',
            style: isSelected
                ? TextStyle(color: kPrimaryColor, fontSize: 13)
                : TextStyle(color: kSecondaryColor, fontSize: 13),
          ),
        ),
      ),
    );
  }
}
