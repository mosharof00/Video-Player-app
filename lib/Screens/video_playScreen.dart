import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPlayScreen extends StatefulWidget {
  final dynamic id;
  // final int index;
  final String thambnel;
  const VideoPlayScreen({super.key, required this.id, required this.thambnel});

  @override
  State<VideoPlayScreen> createState() => _VideoPlayScreenState();
}

class _VideoPlayScreenState extends State<VideoPlayScreen> {
  // late YoutubePlayerController _controller;

  // @override
  // void initState() {
  //   _controller = YoutubePlayerController(
  //       initialVideoId: widget.id,
  //       flags: const YoutubePlayerFlags(mute: false, autoPlay: false));
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          // appBar: AppBar(),
          body:
              // YoutubePlayer(
              //   controller: _controller,
              //   showVideoProgressIndicator: true,
              //   onReady: () {
              //     print('Player is ready');
              //   },
              // ),
              Image.network(widget.thambnel)),
    );
  }
}
