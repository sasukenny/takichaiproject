import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../components/comp_header.dart';
import '../components/comp_songDisplay.dart';
import '../components/comp_musicButtons.dart';

class NowPlayingPage extends StatefulWidget {
  const NowPlayingPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<NowPlayingPage> createState() => _NowPlayingPageState();
}

class _NowPlayingPageState extends State<NowPlayingPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE5E5E5),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
                margin: const EdgeInsets.symmetric(vertical: 30),
                child:const Header(title: 'Now Playing')
            )
            ,
            const songDisplay(songTitle: 'Namastute', songArtist: 'Seedhe Maut', songImage: 'https://i.scdn.co/image/ab67616d0000b273d65e2670b7176415b9d88a59'),
            Expanded(
              child: Text(
                'Acá iría el reproductor de música',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            const musicButtons()
          ],
        ),
    );
  }
}
