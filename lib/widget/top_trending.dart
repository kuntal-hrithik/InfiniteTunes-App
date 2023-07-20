import 'package:flutter/material.dart';
import 'package:music/api/api.dart';
import 'package:music/models/trending.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:google_fonts/google_fonts.dart';

class hello extends StatefulWidget {
  const hello({super.key});
  @override
  State<hello> createState() => _HelloState();
}

class _HelloState extends State<hello> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder(
          future: api.fetchApiData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              print('${snapshot.error}');
            } else if (snapshot.data == null) {
              return const Text("No data available");
            } else {
              final trendingSongs =
                  snapshot.data?["trending"]['albums'] as List<dynamic>;
              return CarouselSlider(
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
                      return Container(
                          // width: MediaQuery.of(context).size.width,
                          width: 300,
                          height: 200,
                          margin: const EdgeInsets.symmetric(horizontal: .0),
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 20, 20, 20),
                              boxShadow: const [
                                BoxShadow(
                                    color: Colors.grey,
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
                                  song['image'][2]["link"],
                                  fit: BoxFit.fill,
                                  width: MediaQuery.of(context).size.width,
                                  height: 190,
                                ),
                              ),

                              const SizedBox(
                                height: 6,
                              ),
                              Text(
                                song['name'],
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.ebGaramond(
                                    textStyle: const TextStyle(fontSize: 15)),
                              ),
                              const SizedBox(
                                height: 0.5,
                              ),
                              Text(
                                song['artists'][0]['name'],
                                style: GoogleFonts.openSans(fontSize: 10),
                              )
                            ],
                          ));
                    },
                  );
                }).toList(),
              );
            }
            return Text("hello");
          }),
    );
  }
}
