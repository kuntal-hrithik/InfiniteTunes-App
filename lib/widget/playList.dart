import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../api/jio_saavn.dart';
import '../models/playlist.dart';

class PlayList extends StatelessWidget {
  const PlayList({super.key, required this.topPlayList});
  final List<Playlist> topPlayList;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(color: Color.fromARGB(255, 35, 35, 35)),
      child: ListView.builder(
        itemCount: topPlayList == null ? 0 : topPlayList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Container(
            width: 200,
            child: Card(
              child: Column(
                children: [
                  Image.network(
                    topPlayList[index].image?[2].link ?? "",
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    topPlayList[index].title ?? "",
                    style: GoogleFonts.ebGaramond(fontSize: 15),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
