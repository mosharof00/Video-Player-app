import 'package:flutter/material.dart';
import 'package:video_palyer_app/Screens/video_playScreen.dart';
import 'package:video_palyer_app/Utilities/api_survices.dart';
import 'package:video_palyer_app/models/channel_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    ApiSurvices apiSurvices = ApiSurvices();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: false,
        title: const Text(
          'Trending Videos',
          style: TextStyle(color: Colors.black, fontSize: 25),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 7),
        child: Column(
          children: [
            Expanded(
                child: FutureBuilder<ChannelModel>(
                    future: apiSurvices.getApi(),
                    builder: (context, AsyncSnapshot<ChannelModel> snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                            itemCount: snapshot.data!.results.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => VideoPlayScreen(
                                              id: snapshot
                                                  .data!.results[index].id,
                                              thambnel: snapshot.data!
                                                  .results[index].thumbnail,
                                              title: snapshot
                                                  .data!.results[index].title,
                                              views: snapshot
                                                  .data!.results[index].viewers,
                                              dateAndTime: snapshot.data!
                                                  .results[index].dateAndTime
                                                  .toString(),
                                              channelImage: snapshot.data!
                                                  .results[index].channelImage,
                                              channelName: snapshot.data!
                                                  .results[index].channelName
                                                  .toString(),
                                              subscribers: snapshot
                                                  .data!
                                                  .results[index]
                                                  .channelSubscriber,
                                            ))),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    bottom: 20,
                                  ),
                                  child: Card(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Container(
                                            height: 190,
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            decoration: BoxDecoration(
                                                image: DecorationImage(
                                                    image: NetworkImage(snapshot
                                                        .data!
                                                        .results[index]
                                                        .thumbnail))),
                                            child: Align(
                                              alignment: Alignment.bottomRight,
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 15, bottom: 4),
                                                child: Text(
                                                  snapshot.data!.results[index]
                                                      .duration
                                                      .toString(),
                                                  style: const TextStyle(
                                                    color: Colors.white,
                                                    backgroundColor:
                                                        Colors.black,
                                                  ),
                                                ),
                                              ),
                                            )),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            CircleAvatar(
                                                backgroundColor: Colors.white,
                                                radius: 25,
                                                backgroundImage: NetworkImage(
                                                  snapshot.data!.results[index]
                                                      .channelImage,
                                                )),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Expanded(
                                                child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  snapshot.data!.results[index]
                                                      .title
                                                      .toString(),
                                                  style: const TextStyle(
                                                      fontSize: 20.0,
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                        snapshot
                                                            .data!
                                                            .results[index]
                                                            .viewers
                                                            .toString(),
                                                        style: const TextStyle(
                                                            color:
                                                                Colors.grey)),
                                                    const SizedBox(
                                                      width: 3,
                                                    ),
                                                    const Text('Views',
                                                        style: TextStyle(
                                                            color:
                                                                Colors.grey)),
                                                    const SizedBox(
                                                      width: 10,
                                                    ),
                                                    Text(
                                                        snapshot
                                                            .data!
                                                            .results[index]
                                                            .dateAndTime
                                                            .toString(),
                                                        style: const TextStyle(
                                                            color: Colors.grey))
                                                  ],
                                                )
                                              ],
                                            )),
                                            Container(
                                                height: 20,
                                                width: 20,
                                                child: Image.asset(
                                                  'assets/icons/kebab.png',
                                                  fit: BoxFit.contain,
                                                  color: Colors.grey,
                                                )),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            });
                      } else {
                        return const Center(
                            child: CircularProgressIndicator(
                          color: Colors.blue,
                        ));
                      }
                    }))
          ],
        ),
      ),
    );
  }
}
