import 'dart:convert';
import 'dart:ffi';
import 'dart:js';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:music/models/trending.dart';

class JioSavanApi {
  Future<T> fetchApiData<T>(String path) async {
    final baseUrl = dotenv.env['BASE_URL']!;
    final url = '$baseUrl$path';
    var finalUrl = Uri.parse(url);
    var response = await http.get(finalUrl);
    if (response.statusCode == 200) {
      var responseData = jsonDecode(response.body);

      var dataMap = responseData as Map<String, dynamic>;

      return dataMap["data"];
    } else {
      throw Exception("failed to load Trending");
    }
  }

  Future<List<Trending>> getHomeData() async {
    return await api.fetchApiData<List<Trending>>('/modules/language=hindi,english');
  }
}

final api = JioSavanApi();
