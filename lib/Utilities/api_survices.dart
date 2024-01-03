import 'dart:convert';

import 'package:video_palyer_app/Utilities/api_url.dart';
import 'package:video_palyer_app/models/channel_model.dart';
import 'package:http/http.dart' as http;

class ApiSurvices {
  Future<ChannelModel> getApi() async {
    final response = await http.get(Uri.parse(ApiUrl.baseUrl));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body.toString());
      return ChannelModel.fromJson(data);
    } else {
      throw Exception(
          'Failed to fetch data. Status Code: ${response.statusCode}');
    }
  }
}



  // // var data;
  // Future<ChannelModel> getAPI() async {
  //   final response = await http.get(
  //       Uri.parse('https://test-ximit.mahfil.net/api/trending-video/1?page=1'));

  //   // final response =
  //   // await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

  //   var data = jsonDecode(response.body.toString());
  //   if (response.statusCode == 200) {
  //     return ChannelModel.fromJson(data);
  //   } else {
  //     // Handle error case, throw an exception or return an error result
  //     throw Exception(
  //         'Failed to fetch data. Status Code: ${response.statusCode}');
  //   }
  // }