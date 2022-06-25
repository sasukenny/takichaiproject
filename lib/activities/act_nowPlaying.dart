import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Wrapper/wrapper.dart';
import '../components/comp_header.dart';
import '../components/comp_musicButtons.dart';
import '../components/comp_playingBar.dart';
import '../components/comp_songDisplay.dart';
import '../util/playingTime.dart';

class NowPlayingPage extends StatefulWidget {
  const NowPlayingPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<NowPlayingPage> createState() => _NowPlayingPageState();
}

class _NowPlayingPageState extends State<NowPlayingPage> {

  @override
  Widget build(BuildContext context) {
    return Wrapper(title: widget.title, activitieChild: elements());
  }
  Container elements(){
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(top: 45),
            child:const songDisplay(
                songTitle: 'Namastute',
                songArtist: 'Seedhe Maut',
                songImage: 'https://i.scdn.co/image/ab67616d0000b273d65e2670b7176415b9d88a59'
            ),
          ),
          Expanded(
            child: playingBar(
                timePlayed: PlayingTime(0,3,0),
                songDuration: PlayingTime(0,4,10)
            ),
          ),
          const musicButtons()
        ],
      ),
    );
  }
}
