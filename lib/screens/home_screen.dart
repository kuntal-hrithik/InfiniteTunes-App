import 'package:flutter/material.dart';
import '../widget/albums.dart';
import '../widget/charts.dart';
import '../widget/playlist.dart';
import '../widget/top_trending.dart';
import 'package:google_fonts/google_fonts.dart';

import '../api/jio_saavn.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("InfiniteTunes"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.settings),
            iconSize: 30,
          )
        ],
      ),
      body: FutureBuilder(
        future: api.getHomeData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            print('${snapshot.error}');
          } else if (snapshot.data == null) {
            return const Text("No data available");
          } else {
            final trendingSongs = snapshot.data?.trending.songs;
            final topPlayList = snapshot.data?.playlists;
            final charts = snapshot.data?.charts;
            final albums = snapshot.data?.albums;
            return ListView(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      "Trending-Songs",
                      style: GoogleFonts.robotoSlab(
                        textStyle: const TextStyle(
                          fontSize: 24,
                        ),
                      ),
                      textAlign: TextAlign.start,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Trending(
                      trendingSongs: trendingSongs!,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      "PlayLits",
                      style: GoogleFonts.robotoSlab(
                          textStyle: const TextStyle(fontSize: 24)),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    PlayList(
                      topPlayList: topPlayList!,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Charts",
                      style: GoogleFonts.robotoSlab(
                          textStyle: const TextStyle(fontSize: 24)),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Charts(
                      charts: charts!,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Your Favourite Albums",
                      style: GoogleFonts.robotoSlab(
                          textStyle: const TextStyle(fontSize: 24)),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Albums(albums: albums!),
                    const SizedBox(
                      height: 5,
                    )
                  ],
                ),
              ],
            );
          }
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}
