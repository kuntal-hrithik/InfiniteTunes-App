import 'package:flutter/material.dart';
import 'package:music/api/api.dart';
import 'package:music/models/trending.dart';
import 'package:carousel_slider/carousel_slider.dart';

class hello extends StatefulWidget {
  hello({super.key});
  @override
  State<hello> createState() => _helloState();
}

class _helloState extends State<hello> {
  // late Future<Trending> trending;
  // @override
  // void initState() {
  //   api.fetchApiData('').then((value) {
  //     trending = value;
  //   });
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder(
          future: api.fetchApiData(''),
          builder: (context, snapshot) {
            if (snapshot.hasData!) {
              return CarouselSlider(
                options: CarouselOptions(
                    height: 200.0,
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 3),
                    enlargeCenterPage: true,
                    enlargeFactor: 0.2),
                items: [Trending.fromjson(snapshot.data!)].map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                          width: MediaQuery.of(context).size.width,
                          margin: const EdgeInsets.symmetric(horizontal: 2.0),
                          decoration: const BoxDecoration(color: Colors.grey),
                          child: Text(
                            i.image,
                            style: const TextStyle(fontSize: 16.0),
                          ));
                    },
                  );
                }).toList(),
              );
              ;
            }
            return const CircularProgressIndicator();
          }),
    );
  }
}
