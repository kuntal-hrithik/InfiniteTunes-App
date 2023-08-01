import 'package:flutter/material.dart';
import '../api/jio_saavn.dart';
import '../models/song.dart';

class SongScreen extends StatelessWidget {
  const SongScreen({super.key, required this.url});
  final String url;
  @override
  Widget build(BuildContext context) {
    List<Song>? songList;
    return Scaffold(
      appBar: AppBar(title: const Text('')),
      body: FutureBuilder(
        future: api.getAlbumDetails(url),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            print('${snapshot.error}');
          } else if (snapshot.data == null) {
            return const Text("No data available");
          } else {
            print(songList);
            return Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 110, vertical: 70),
              child: Container(
                height: 200,
                width: 200,
                decoration: const BoxDecoration(color: Colors.grey),
                child: const Text('hello'),
              ),
            );
          }
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}
