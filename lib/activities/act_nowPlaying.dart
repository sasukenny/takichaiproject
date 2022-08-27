import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

import '../Wrapper/wrapper.dart';
import '../components/comp_songDisplay.dart';
import '../models/mod_Song.dart';
import '../util/playManager.dart';


class NowPlayingPage extends StatefulWidget {
  const NowPlayingPage({Key? key, required this.song}) : super(key: key);

  final Song song;

  @override
  State<NowPlayingPage> createState() => _NowPlayingPageState();
}

class _NowPlayingPageState extends State<NowPlayingPage> {

  late final PlayManager _playManager;
  var logger = Logger(
    filter: null, // Use the default LogFilter (-> only log in debug mode)
    printer: PrettyPrinter(), // Use the PrettyPrinter to format and print log
    output: null, // Use the default LogOutput (-> send everything to console)
  );
  @override
  void initState(){
    super.initState();
    logger.d("song.songUrl");
    logger.d(widget.song.songUrl);
    _playManager = PlayManager(widget.song.songUrl);
  }

  @override
  Widget build(BuildContext context) {
    return Wrapper(activitieChild: elements());
  }

  @override
  void dispose() {
    _playManager.dispose();
    super.dispose();
  }

  Container elements(){
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(top: 45),
            child: songDisplay(
                songTitle: widget.song.name,
                songArtist: widget.song.author,
                songImage: widget.song.imageUrl!
            ),
          ),
          Expanded(
            child:
            ValueListenableBuilder<ProgressBarState>(
              valueListenable: _playManager.progressNotifier,
              builder: (_, value, __) {
                return ProgressBar(
                  progress: value.current,
                  buffered: value.buffered,
                  total: value.total,
                  onSeek: _playManager.seek,
                );
              }
            ),
          ),
          ValueListenableBuilder<ButtonState>(
            valueListenable: _playManager.buttonNotifier,
            builder: (_, value, __) {
              switch (value) {
                case ButtonState.loading:
                  return Container(
                    margin: const EdgeInsets.all(8.0),
                    width: 32.0,
                    height: 32.0,
                    child: const CircularProgressIndicator(),
                  );
                case ButtonState.paused:
                  return IconButton(
                    color: Colors.white,
                    icon: const Icon(Icons.play_arrow),
                    iconSize: 32.0,
                    onPressed: (){
                      _playManager.buttonNotifier.value = ButtonState.playing;
                      _playManager.play();
                    },
                  );
                case ButtonState.playing:
                  return IconButton(
                    color: Colors.white,
                    icon: const Icon(Icons.pause),
                    iconSize: 32.0,
                    onPressed: (){
                      _playManager.buttonNotifier.value = ButtonState.paused;
                      _playManager.pause();
                    },
                  );
              }
            },
          ),
        ],
      ),
    );
  }
}
