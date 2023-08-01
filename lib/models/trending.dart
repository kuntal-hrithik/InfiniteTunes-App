import 'album.dart';
import 'package:json_annotation/json_annotation.dart';

import 'song.dart';

part 'trending.g.dart';

@JsonSerializable(explicitToJson: true, checked: true)
class Trending {
  List<Song> songs;
  List<Album> albums;

  Trending({required this.songs, required this.albums});

  factory Trending.fromJson(Map<String, dynamic> json) =>
      _$TrendingFromJson(json);

  Map<String, dynamic> toJson() => _$TrendingToJson(this);
}
