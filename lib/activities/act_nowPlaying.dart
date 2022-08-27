import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:just_audio/just_audio.dart';
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';

import '../Wrapper/wrapper.dart';
import '../components/comp_header.dart';
import '../components/comp_songDisplay.dart';
import '../util/playManager.dart';

import '../models/mod_Song.dart';


class NowPlayingPage extends StatefulWidget {
  const NowPlayingPage({Key? key, required this.song}) : super(key: key);

  final Song song;

  @override
  State<NowPlayingPage> createState() => _NowPlayingPageState();
}

class _NowPlayingPageState extends State<NowPlayingPage> {

  late final PlayManager _playManager;

  @override
  void initState(){

    super.initState();
    _playManager = PlayManager(widget.song.songUrl, widget.song.songId);
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
