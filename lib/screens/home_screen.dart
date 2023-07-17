import 'package:flutter/material.dart';
import 'package:music/api/api.dart';
import 'package:music/models/trending.dart';
import 'package:music/widget/hello.dart';
import 'package:music/widget/songs.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  // late Trending trendingSongs;
  // @override
  // void initState() {
  //   api.fetchApiData('').then((value) {
  //     print(value.songName);
  //     setState(() {
  //       trendingSongs = value;
  //     });
  //   });

  //   print(trendingSongs);
  //   // print(trendingSongs);
  //   //print(trendingSongs);
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(
            "Trending",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.start,
          ),
          SizedBox(
            height: 12,
          ),
          hello(),
          SizedBox(
            height: 10,
          ),
          Text("Album"),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.search_rounded), label: "Search"),
          BottomNavigationBarItem(
              icon: Icon(Icons.playlist_play), label: "PlayList"),
        ],
      ),
    );
  }
}
