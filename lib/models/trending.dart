import 'package:flutter/foundation.dart';

class Trending {
  Trending(
      {required this.id,
      required this.songName,
      required this.artistName,
      required this.image});
  String id;
  String songName;
  String artistName;
  String image;

  factory Trending.fromjson(Map<String, dynamic> data) {
    return Trending(
        id: data['songs'][0]['id'],
        songName: data['songs'][0]['name'],
        artistName: data['songs'][0]['primaryArtists'][0]['name'],
        image: data['songs'][0]['image'][1]['link']);
  }
}
