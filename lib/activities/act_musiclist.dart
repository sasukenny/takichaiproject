import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:takichaiproject/components/comp_songcard.dart';

import '../Wrapper/wrapper.dart';
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
    return Wrapper(title: widget.title, activitieChild: elements());
  }
  Container elements(){
    return Container(
      child: Scaffold(
        body: SingleChildScrollView(
            child: Column(children: [
              Container(
                child: Text(widget.title),
              ),
              Container(
                padding: const EdgeInsets.all(20.0),
                height: 150.0,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/discover.jpg"),
                    fit: BoxFit.cover,
                  ),
                  color: Colors.amber,
                )
              ),
              //Image.asset('../../assets/images/music-player.png'),
              const Text(
                "PINK FLOYD",
                textAlign: TextAlign.start,
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 40),
                child: Column(
                  children: const [
                    SongCard(
                      time: "1:12",
                      title: "Time",
                    ),
                    SongCard(
                      time: "4:23",
                      title: "Comfortably Numb",
                    ),
                    SongCard(time: "3:20", title: "Hey You"),
                  ],
                ),
              )
            ])),
      )
    );
  }
}
