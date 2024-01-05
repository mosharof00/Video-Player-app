import 'package:flutter/material.dart';
// import 'package:video_palyer_app/Screens/local%20widgets/comment_section.dart';
import 'package:video_palyer_app/Screens/local%20widgets/reaction_components.dart';
// import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPlayScreen extends StatefulWidget {
  final dynamic id;
  final String thambnel;
  final String title;
  final String views;
  final String dateAndTime;
  final String channelImage;
  final String channelName;
  final String subscribers;
  const VideoPlayScreen({
    super.key,
    required this.id,
    required this.thambnel,
    required this.title,
    required this.views,
    required this.dateAndTime,
    required this.channelImage,
    required this.channelName,
    required this.subscribers,
  });

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
    TextEditingController _textEditingController = TextEditingController();
    return SafeArea(
      top: false,
      child: Scaffold(
        body:
            // YoutubePlayer(
            //   controller: _controller,
            //   showVideoProgressIndicator: true,
            //   onReady: () {
            //     print('Player is ready');
            //   },
            // ),

            Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Stack(
              children: [
                Image.network(widget.thambnel),
                InkWell(
                  onTap: () => Navigator.pop(context),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 8,
                      top: 5,
                    ),
                    child: Container(
                      height: 33,
                      width: 33,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.black.withOpacity(0.1)),
                      child: const Center(
                        child: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                          size: 33,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 10, bottom: 0, right: 8, left: 8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.title.toString(),
                          style: const TextStyle(
                              fontSize: 22,
                              color: Colors.black,
                              fontWeight: FontWeight.w500)),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          Text(widget.views.toString(),
                              style: const TextStyle(color: Colors.grey)),
                          const SizedBox(
                            width: 5,
                          ),
                          const Text('views',
                              style:
                                  TextStyle(fontSize: 15, color: Colors.grey)),
                          const SizedBox(
                            width: 20,
                          ),
                          Text(widget.dateAndTime.toString(),
                              style: const TextStyle(
                                  fontSize: 15, color: Colors.grey)),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const ReactionComponents(),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 25,
                              backgroundImage:
                                  NetworkImage(widget.channelImage)),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                              child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.channelName,
                                style: const TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400),
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Text(widget.subscribers.toString(),
                                      style:
                                          const TextStyle(color: Colors.grey)),
                                  const SizedBox(
                                    width: 3,
                                  ),
                                  const Text('Subscribers',
                                      style: TextStyle(color: Colors.grey)),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                ],
                              )
                            ],
                          )),
                          Container(
                              height: 35,
                              width: 100,
                              decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(5)),
                              child: const Center(
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.add,
                                      color: Colors.white,
                                      size: 20,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      'Subscribe',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 15),
                                    )
                                  ],
                                ),
                              )),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const Divider(
                        height: 5,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const Row(
                        children: [
                          Text('Comments 7.5k',
                              style: TextStyle(color: Colors.grey)),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextField(
                        controller: _textEditingController,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Add Comment',
                            suffixIcon: Icon(Icons.send_sharp)),
                      ),
                      // CommentSection()
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
