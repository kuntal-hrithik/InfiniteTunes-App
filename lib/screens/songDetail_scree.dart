import 'package:flutter/material.dart';
import '../api/jio_saavn.dart';
import 'package:just_audio/just_audio.dart';

import '../models/song.dart';

class SongDetailScreen extends StatefulWidget {
  const SongDetailScreen({super.key, required this.id});
  final String id;

  @override
  State<SongDetailScreen> createState() => _SongDetailScreenState();
}

class _SongDetailScreenState extends State<SongDetailScreen> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  bool _isPlaying = false;
  Duration _totalDuration = const Duration();
  Duration _currentPosition = const Duration();
  double _currentSliderValue = 0.0;
  late List<Song> song;

  @override
  void initState() {
    super.initState();
    api.getSongDetails(widget.id).then((res) {
      setState(() {
        song = res;
      });
    });
    _audioPlayer.durationStream.listen((duration) {
      setState(() {
        _totalDuration = duration ?? Duration.zero;
      });
    });

    _audioPlayer.positionStream.listen((position) {
      setState(() {
        _currentPosition = position;
        _currentSliderValue = _currentPosition.inSeconds.toDouble();
      });
    });

    _audioPlayer.playbackEventStream.listen((event) {
      if (event.processingState == ProcessingState.completed) {
        _audioPlayer.stop();
        setState(() {
          _isPlaying = false;
        });
      }
    });
  }

  void _play() async {
    if (!_isPlaying) {
      await _audioPlayer.setUrl(song[0].downloadUrl[2].link);
      await _audioPlayer.play();
      setState(() {
        _isPlaying = true;
      });
    }
  }

  void _pause() async {
    if (_isPlaying) {
      await _audioPlayer.pause();
      setState(() {
        _isPlaying = false;
      });
    }
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title:const Text(""),
        ),
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
                  color: const Color.fromARGB(255, 33, 33, 33),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(
                      song[0].image[1].link,
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
                song[0].name,
                style: const TextStyle(fontSize: 30),
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(
                height: 5,
              ),
              Text(song[0].primaryArtists),
              const SizedBox(
                height: 20,
              ),
              Slider(
                value: _currentSliderValue,
                onChanged: _isPlaying
                    ? (value) =>
                        _audioPlayer.seek(Duration(seconds: value.toInt()))
                    : null,
                min: 0,
                max: _totalDuration.inSeconds.toDouble(),
              ),
              IconButton(
                iconSize: 40,
                onPressed: !_isPlaying ? _play : _pause,
                icon: Icon(_isPlaying ? Icons.pause : Icons.play_arrow),
              ),
            ],
          ),
        ));
  }
}
