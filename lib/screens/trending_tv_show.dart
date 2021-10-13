import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:movie/constants.dart';

class TrendingTvShow extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        backgroundColor: kSecondaryColor,
        title: Text(
          'Trending Tv shows on TMDB',
          style: TextStyle(fontSize: 15),
        ),
        actions: [
          IconButton(
            onPressed: (){
              Get.toNamed('/search');
            },
            icon: Icon(FeatherIcons.search),
          ),
          SizedBox(width: 10,),
        ],
      ),
      body: Center(
        child: Text('Trending tv show'),
      ),
    );
  }
}
