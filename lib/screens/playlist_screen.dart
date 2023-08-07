import 'package:flutter/material.dart';
import '../api/jio_saavn.dart';
import '../widget/song_list.dart';

class PlayListScreen extends StatelessWidget {
  const PlayListScreen({super.key, required this.id});
  final String id;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text(""),
      ),
      body: FutureBuilder(
        future: api.getPlaylistDetails(id),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
          } else if (snapshot.data == null) {
            return const Text("No data available");
          }
          final playList = snapshot.data!;
          return SingleChildScrollView(
            physics:const BouncingScrollPhysics(),
            child: Center(
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: SizedBox.square(
                      dimension: 300,
                      child: Image.network(playList.image[0].link),
                    ),
                  ),
                 const SizedBox(
                    height: 10,
                  ),
                  Text(
                    playList.name,
                    overflow: TextOverflow.ellipsis,
                    style:const TextStyle(fontSize: 20),
                  ),
                  Text(
                    "${playList.songCount} ${playList.songCount == "1" ? "Song" : "Songs"}",
                  ),
                  Text("playlist . ${playList.followerCount}"),
                  Padding(
                    padding:const EdgeInsets.only(top: 8),
                    child: SongList(songs: playList.songs),
                  )
                ],
              ),
            ),
          );

          //return CircularProgressIndicator();
        },
      ),
    );
  }
}
