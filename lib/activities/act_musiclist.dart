import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:takichaiproject/components/comp_songcard.dart';

import '../Wrapper/wrapper.dart';
import '../components/comp_descriptionCard.dart';
import '../components/comp_sectionTitle.dart';

class MusicList extends StatefulWidget {
  const MusicList({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MusicList> createState() => _MusicListState();
}

class _MusicListState extends State<MusicList> {
  @override
  Widget build(BuildContext context) {
    return Wrapper(activitieChild: elements());
  }
  Container elements(){
    return Container(
        height: MediaQuery.of(context).size.height,
        child:SingleChildScrollView(
            child: Column(children: [
              sectionTitle("Descubre"),
              descriptionCard("Encuentra nueva música que te puede gustar",),
              Container(
                margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                child: Column(
                  children: [
                    SongCard(time: "1:12", title: "Time",),
                    SongCard(time: "4:23", title: "Comfortably",),
                    SongCard(time: "3:20", title: "Hey You"),
                    SongCard(time: "3:20", title: "Hey You"),
                    SongCard(time: "3:20", title: "Hey You"),
                    SongCard(time: "3:20", title: "Hey You"),
                  ],
                ),
              )
            ])
        )
    );
  }
}
