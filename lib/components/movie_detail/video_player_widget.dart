import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:movie/components/shimmer_widget.dart';
import 'package:movie/constants.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class VideoPlayerWidget extends StatefulWidget {
  final youtubeId;

  VideoPlayerWidget({
    required this.youtubeId,
  });

  @override
  _VideoPlayerWidgetState createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late YoutubePlayerController controller;

  @override
  void initState() {
    super.initState();
    controller = YoutubePlayerController(
      initialVideoId: widget.youtubeId,
      params: YoutubePlayerParams(
        playlist: [], // Defining custom playlist
        startAt: Duration(seconds: 0),
        showControls: true,
        showFullscreenButton: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(kCardBorderRadius),
      child: Container(
        height: 230,
        child: YoutubeValueBuilder(
          controller:
              controller, // This can be omitted, if using `YoutubePlayerControllerProvider`
          builder: (context, value) {
            return YoutubePlayerControllerProvider(
              controller: controller,
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(kCardBorderRadius),
                    child: YoutubePlayerIFrame(
                      gestureRecognizers: <Factory<OneSequenceGestureRecognizer>>{},
                    ),
                  ),
                  value.isReady == true
                      ? SizedBox()
                      : Container(
                          width: double.infinity,
                          height: double.infinity,
                          color: Colors.black,
                          child: UnconstrainedBox(
                            child: SizedBox(
                              width: 30,
                              height: 30,
                              child: CircularProgressIndicator(
                                color: kSecondaryColor,
                              ),
                            ),
                          ),
                        )
                ],
              ),
            );
          },
        ),
      ),
    );
    return Text('$controller');
  }
}
