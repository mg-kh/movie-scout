import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class VideoPlayerWidget extends StatefulWidget {
  final youtubeId;

  VideoPlayerWidget({required this.youtubeId});

  @override
  _VideoPlayerWidgetState createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late YoutubePlayerController controller;

  @override
  void initState() {
    super.initState();
    controller = YoutubePlayerController(
      initialVideoId: '${widget.youtubeId}',
      params: YoutubePlayerParams(
        // playlist: ['nPt8bK2gbaU', 'gQDByCdjUXw'],
        autoPlay: false,
        startAt: Duration(seconds: 0),
        showControls: true,
        showFullscreenButton: true,
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    controller.close();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: YoutubePlayerControllerProvider( // Provides controller to all the widget below it.
        controller: controller,
        child: YoutubePlayerIFrame(
          aspectRatio: 16 / 9,
          gestureRecognizers: <Factory<OneSequenceGestureRecognizer>>{},
        ),
      ),
    );
    // return Text('${widget.youtubeId}');
  }
}
