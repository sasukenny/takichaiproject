import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:takichaiproject/components/comp_songcard.dart';

import '../components/comp_header.dart';
import '../components/comp_songDisplay.dart';
import '../components/comp_musicButtons.dart';


class MusicList extends StatefulWidget {
  const MusicList({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MusicList> createState() => _MusicListState();
}

class _MusicListState extends State<MusicList> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: Column(children: [
        Container(
          margin: const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 50),
          child: Flex(
            direction: Axis.horizontal,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Icon(Icons.arrow_back),
              Text("Music List", style: TextStyle(fontSize: 32),),
              Icon(Icons.more_vert),
            ],
          ),
        ),
        Image.asset('../../assets/images/music-player.png'),
        const Text(
          "PINK FLOYD", 
          textAlign: TextAlign.center, 
          style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
        ),
        Container(
          margin: const EdgeInsets.only(top: 40),
          child: Column(
            children: const [
            SongCard(time: "1:12"),
            SongCard(time: "4:23"),
            SongCard(time: "3:20"),
          ],
          ),
        )
      ]));
  }
}