class TrendingData {
  final List<TrendingSongs> songs;
  TrendingData({required this.songs});

  factory TrendingData.fromJson(Map<String, dynamic>? data) {
    if (data == null) {
      throw Exception("Failed to parse Trending data. JSON is null.");
    }

    if (!data.containsKey("data")) {
      throw Exception("Failed to parse Trending data. 'data' key is missing.");
    }

    final List<dynamic> songList = data['data']['trending']['songs'];
    final List<TrendingSongs> songs =
        songList.map((dynamic song) => TrendingSongs.fromjson(song)).toList();
    return TrendingData(songs: songs);
  }
}

class TrendingSongs {
  TrendingSongs({required this.id, required this.name, required this.image});

  final String id;
  final String name;
  final String image;

  factory TrendingSongs.fromjson(Map<String, dynamic> data) {
    return TrendingSongs(
        id: data["id"] ,
        name: data["name"],
        image: data["image"][1] as String);
  }
}
