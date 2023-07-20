import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:music/models/trending.dart';

class JioSavanApi {
  Future<Map<String, dynamic>> fetchApiData() async {
    // final baseUrl = dotenv.env['BASE_URL']!;
    // final url = '$baseUrl$path';
    var finalUrl = Uri.parse("https://saavn.me/modules?language=hindi,english");
    var response = await http.get(finalUrl);
    if (response.statusCode == 200) {
      var responseData = jsonDecode(response.body);
      var dataMap = responseData as Map<String, dynamic>;
      // print(dataMap['data']['trending']['songs'][0]['name']);
      return dataMap["data"];
    } else {
      throw Exception("failed to load Trending");
    }
  }

  // Future<Trending> getHomeData() async {
  //   final data = await api
  //       .fetchApiData<Map<String, dynamic>>('/modules?language=hindi,english');
  //   return Trending.fromJson(data);
  // }
}

final api = JioSavanApi();
