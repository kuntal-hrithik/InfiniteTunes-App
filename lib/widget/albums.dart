import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:music/api/api.dart';

class Albums extends StatefulWidget {
  const Albums({super.key});
  @override
  State<StatefulWidget> createState() {
    return _AlbumsState();
  }
}

class _AlbumsState extends State<Albums> {
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
            final charts = snapshot.data!['albums'] as List<dynamic>;
            print(charts);
            return Container(
              height: 250,
              width: MediaQuery.of(context).size.width,
              decoration:
                  const BoxDecoration(color: Color.fromARGB(255, 35, 35, 35)),
              child: ListView.builder(
                  itemCount: charts.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Container(
                      width: 200,
                      child: Card(
                        child: Column(
                          children: [
                            Image.network(
                              charts[index]['image'][2]['link'],
                            ),
                            const SizedBox(
                              height: 3,
                            ),
                            Text(
                              charts[index]['name'],
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
        });
  }
}
