import 'package:flutter/material.dart';
import '../models/models.dart';
import '../screens/songDetail_scree.dart';

class SongTile extends StatelessWidget {
  const SongTile({
    super.key,
    required this.song,
  });

  final Song song;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (ctx) => SongDetailScreen(id: song.id)));
      },
      contentPadding: const EdgeInsets.symmetric(horizontal: 8),
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: SizedBox.square(
          dimension: 50,
          child: Image.network(song.image[0].link),
        ),
      ),
      title: Text(
        song.name,
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: Text(
        song.primaryArtists,
        overflow: TextOverflow.ellipsis,
      ),
      trailing: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: const Icon(Icons.download),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
