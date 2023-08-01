import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/models.dart';

class Charts extends StatelessWidget {
  const Charts({super.key, required this.charts});
  final List<ModuleChart> charts;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(color: Color.fromARGB(255, 35, 35, 35)),
      child: ListView.builder(
          itemCount: charts.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return SizedBox(
              width: 200,
              child: Card(
                child: Column(
                  children: [
                    Image.network(
                      charts[index].image[2].link,
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Text(
                      charts[index].title,
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
