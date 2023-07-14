import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class JioSavanApi {
  Future<void> fetchApiData(String path) async {
    final baseUrl = dotenv.env['BASE_URL']!;
    final url = '${baseUrl}${Path}';
    print(url);
    var finalUrl = Uri.parse(url);
    var response = await http.get(finalUrl);
    if (response.statusCode == 200) {
      var responseData = jsonDecode(response.body);
      print(responseData);
    } else {
      print("api request failed with status code ${response.statusCode}");
    }
  }

  Future<void> getHomeData() async {
    await api.fetchApiData('/modules/language=hindi,english');
  }
}

final api = JioSavanApi();
