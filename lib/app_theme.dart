import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class AppTheme {
  static final light = ThemeData.light().copyWith(
    backgroundColor: Colors.white,
    primaryColor: Colors.black,
    cardColor: Colors.white,
  );

  static final dark = ThemeData.light().copyWith(
    backgroundColor: HexColor('#082032'),
    primaryColor: Colors.white,
    cardColor: HexColor('#2C394B'),
  );
}
