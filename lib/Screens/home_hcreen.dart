import 'package:flutter/material.dart';

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
                              return Card(
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 20),
                                  child: Column(
                                    children: [
                                      Container(
                                        height: 185,
                                        child: Center(
                                          child: Image.network(
                                            snapshot
                                                .data!.results[index].thumbnail,
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          CircleAvatar(
                                              backgroundColor: Colors.white,
                                              radius: 30.5,
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
                                                snapshot
                                                    .data!.results[index].title
                                                    .toString(),
                                                style: const TextStyle(
                                                    fontSize: 20.0,
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.w500),
                                                overflow: TextOverflow.ellipsis,
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
                                                          color: Colors.grey)),
                                                  const SizedBox(
                                                    width: 3,
                                                  ),
                                                  const Text('Views',
                                                      style: TextStyle(
                                                          color: Colors.grey)),
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
                                    ],
                                  ),
                                ),
                              );
                            });
                      } else {
                        return const Center(
                          child: Text("Loding"),
                        );
                      }
                    }))
          ],
        ),
      ),
    );
  }
}
