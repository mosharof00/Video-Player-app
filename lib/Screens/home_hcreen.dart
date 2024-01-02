import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:video_palyer_app/models/channel_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // var data;
  Future<Channel> getAPI() async {
    final response = await http.get(
        Uri.parse('https://test-ximit.mahfil.net/api/trending-video/1?page=1'));

    // final response =
    // await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      return Channel.fromJson(data);
    } else {
      // Handle error case, throw an exception or return an error result
      throw Exception(
          'Failed to fetch data. Status Code: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text(
          'Trending Videos',
          style: TextStyle(color: Colors.black, fontSize: 25),
        ),
      ),
      body: Column(
        children: [
          Expanded(
              child: FutureBuilder<Channel>(
                  future: getAPI(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                          itemCount: snapshot.data!.results.length,
                          itemBuilder: (context, index) {
                            return Card(
                              child: Column(
                                children: [
                                  Image.network(snapshot
                                      .data!.results[index].channelImage),
                                  Text(snapshot.data!.results[index].channelName
                                      .toString()),
                                ],
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
    );
  }
}
