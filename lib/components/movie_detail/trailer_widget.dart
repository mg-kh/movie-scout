import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie/components/shimmer_widget.dart';
import 'package:movie/components/movie_detail/video_player_widget.dart';
import 'package:movie/constants.dart';
import 'package:movie/controller/movie_detail/trailer_controller.dart';

class TrailerWidget extends StatelessWidget {
  final TrailerController trailerController = Get.put(TrailerController());

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      maxChildSize: 0.9,
      initialChildSize: 0.9,
      minChildSize: 0.5,
      expand: true,
      builder: (_, controller) {
        return Container(
          padding: EdgeInsets.only(
            top: kHorizontalPaddingValue + 15,
            left: kHorizontalPaddingValue,
            right: kHorizontalPaddingValue,
          ),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(kCardBorderRadius),
                topRight: Radius.circular(kCardBorderRadius),
              )),
          child: Obx(() {
            if (!trailerController.isLoading.value) {
              return ListView(
                scrollDirection: Axis.vertical,
                controller: controller,
                children: [
                  ...trailerController.trailerData.map((trailer) => Container(
                        height: 200,
                        margin: EdgeInsets.only(bottom: 20),
                        child: VideoPlayerWidget(
                          youtubeId: trailer.key,
                        ),
                        // child: Text('${trailer.key}'),
                      ))
                ],
              );
            } else {
              return ListView(
                children: [
                  ...List.generate(
                      5,
                      (index) => Container(
                            height: 200,
                            margin: EdgeInsets.only(bottom: 20),
                            padding: EdgeInsets.all(10),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: ShimmerWidget(),
                            ),
                          ))
                ],
              );
            }
          }),
        );
      },
    );
  }
}
