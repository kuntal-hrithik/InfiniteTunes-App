import 'package:flutter/material.dart';

import '../models/module.dart';

class SongDetailScreen extends StatelessWidget {
  const SongDetailScreen({super.key, required this.song});
  final ModuleSong? song;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(vertical: 130, horizontal: 50),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: const Color.fromARGB(255, 33, 33, 32),
            ),
            // margin: const EdgeInsets.symmetric(vertical: 70, horizontal: 20),
            height: 300,
            width: 370,
            child: Card(
              color: Color.fromARGB(255, 33, 33, 33),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  song!.image[1].link,
                  fit: BoxFit.cover,
                  width: MediaQuery.of(context).size.width,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            song!.name,
            style: TextStyle(fontSize: 30),
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(
            height: 5,
          ),
          Text(song!.primaryArtists[0]['name'])
        ],
      ),
    ));
  }
}
