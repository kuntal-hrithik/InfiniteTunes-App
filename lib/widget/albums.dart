import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../api/jio_saavn.dart';
import '../models/album.dart';

class Albums extends StatelessWidget {
  const Albums({super.key, required this.albums});
  final List<Album> albums;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(color: Color.fromARGB(255, 35, 35, 35)),
      child: ListView.builder(
          itemCount: albums.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Container(
              width: 200,
              child: Card(
                child: Column(
                  children: [
                    Image.network(albums[index].image?[2].link ?? ""),
                    const SizedBox(
                      height: 3,
                    ),
                    Text(
                      albums[index].name ?? "",
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.ebGaramond(fontSize: 17),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
