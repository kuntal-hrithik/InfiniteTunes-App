import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:music/api/api.dart';

class PlayList extends StatefulWidget {
  const PlayList({super.key});
  @override
  State<StatefulWidget> createState() {
    return _PlayListState();
  }
}

class _PlayListState extends State<PlayList> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: api.fetchApiData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.data == null) {
          return const Text("No data available");
        } else if (snapshot.hasError) {
          return const Text("error");
        } else {
          final topPlayList = snapshot.data!['playlists'] as List<dynamic>;
          return Container(
            height: 250,
            width: MediaQuery.of(context).size.width,
            decoration:
                const BoxDecoration(color: Color.fromARGB(255, 35, 35, 35)),
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
                          topPlayList[index]['image'][2]['link'],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          topPlayList[index]['title'],
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
      },
    );
  }
}
