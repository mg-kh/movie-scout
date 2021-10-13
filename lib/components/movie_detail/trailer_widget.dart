import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie/components/movie_detail/video_player_widget.dart';
import 'package:movie/components/shimmer_widget.dart';
import 'package:movie/constants.dart';

class TrailerWidget extends StatelessWidget {
  final trailerController;

  TrailerWidget({required this.trailerController});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: AppBar(
        backgroundColor: kSecondaryColor,
        title: Text('Watch Trailers'),
      ),
      body: Container(
        padding: EdgeInsets.all(kHorizontalPaddingValue),
        child: Obx(() {
          if (!trailerController.isLoading.value) {
            return ListView.separated(
              itemCount: trailerController.trailerData.length,
              separatorBuilder: (_,i){
                return SizedBox(height: 15,);
              },
              itemBuilder: (_,i){
                return VideoPlayerWidget(
                  youtubeId: trailerController.trailerData[i].key,
                );
              },
            );
          } else {
            return ListView(
              children: [
                ...List.generate(
                    5,
                    (index) => Container(
                          height: 230,
                          margin: EdgeInsets.only(bottom: 15),
                          padding: EdgeInsets.all(kHorizontalPaddingValue),
                          child: ShimmerWidget(),
                        ))
              ],
            );
          }
        }),
      ),
    );
  }
}
