import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/models.dart';
import '../screens/songDetail_scree.dart';

class Trending extends StatelessWidget {
  const Trending({super.key, required this.trendingSongs});
  final List<ModuleSong> trendingSongs;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CarouselSlider(
        options: CarouselOptions(
            height: 258.0,
            aspectRatio: 1.0,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 3),
            enlargeCenterPage: true,
            enlargeFactor: 0.2),
        items: trendingSongs.map((song) {
          return Builder(
            builder: (BuildContext context) {
              return GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (ctx) => SongDetailScreen(
                        id: song.id,
                      ),
                    ),
                  );
                },
                child: Container(
                  // width: MediaQuery.of(context).size.width,
                  width: 300,
                  height: 200,
                  margin: const EdgeInsets.symmetric(horizontal: .0),
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 20, 20, 20),
                      boxShadow: const [
                        BoxShadow(
                            color: Color.fromARGB(255, 37, 37, 37),
                            spreadRadius: 2,
                            blurRadius: 4,
                            offset: Offset(2, 2))
                      ],
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    children: [
                      // padding:
                      //   const EdgeInsets.symmetric(horizontal: 10),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.network(
                          song.image[2].link,
                          fit: BoxFit.fill,
                          width: MediaQuery.of(context).size.width,
                          height: 190,
                        ),
                      ),

                      const SizedBox(
                        height: 6,
                      ),
                      Text(
                        song.name,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.ebGaramond(
                            textStyle: const TextStyle(fontSize: 15)),
                      ),
                      const SizedBox(
                        height: 0.5,
                      ),
                      Text(
                        song.name,
                        style: GoogleFonts.openSans(fontSize: 10),
                      )
                    ],
                  ),
                ),
              );
            },
          );
        }).toList(),
      ),
    );
  }
}
