import 'package:flutter/material.dart';
import 'package:music/widget/albums.dart';
import 'package:music/widget/charts.dart';
import 'package:music/widget/playList.dart';
import 'package:music/widget/top_trending.dart';
import 'package:google_fonts/google_fonts.dart';

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
      body: ListView(
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
              const hello(),
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
              const PlayList(),
              Text(
                "Charts",
                style: GoogleFonts.robotoSlab(
                    textStyle: const TextStyle(fontSize: 24)),
              ),
              const SizedBox(
                height: 10,
              ),
              const Charts(),
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
              const Albums(),
              const SizedBox(
                height: 5,
              )
            ],
          ),
        ],
      ),
    );
  }
}
