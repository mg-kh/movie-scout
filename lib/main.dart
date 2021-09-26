import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie/routes.dart';
import 'package:movie/screens/home.dart';

void main(){
  runApp(MovieScout());
}

class MovieScout extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/',
      getPages : routes,
      home: Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}
