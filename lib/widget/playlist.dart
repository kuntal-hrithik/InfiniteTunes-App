import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/models.dart';
import '../screens/playlist_screen.dart';

class PlayList extends StatelessWidget {
  const PlayList({super.key, required this.topPlayList});
  final List<ModulePlaylist> topPlayList;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (ctx) => PlayListScreen(
                  id: topPlayList[0].id,
                )));
      },
      child: Container(
        height: 250,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(color: Color.fromARGB(255, 35, 35, 35)),
        child: ListView.builder(
          itemCount: topPlayList.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return SizedBox(
              width: 200,
              child: Card(
                child: Column(
                  children: [
                    Image.network(
                      topPlayList[index].image[2].link,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      topPlayList[index].title,
                      style: GoogleFonts.ebGaramond(fontSize: 15),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
