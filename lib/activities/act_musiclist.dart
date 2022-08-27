import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:takichaiproject/components/comp_songcard.dart';

import '../Wrapper/wrapper.dart';
import '../components/comp_descriptionCard.dart';
import '../components/comp_sectionTitle.dart';
import '../models/mod_Song.dart';
import '../services/SongService.dart';

class MusicList extends StatefulWidget {
  const MusicList({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MusicList> createState() => _MusicListState();
}

class _MusicListState extends State<MusicList> {
  List<Song> allsongs = [];

  @protected
  @mustCallSuper
  initState() {
    GetAllUsers();
  }
  GetAllUsers() async {
    SongService userService = SongService();
    List<Song> response = await userService.getAllSongs();
    //logger.d("responseq ");
    setState(()  {
      allsongs = response;
    });
  }
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
              ListView.builder(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                shrinkWrap: true,
                itemCount: allsongs.length,
                itemBuilder: (BuildContext context, int index) {
                  return SongCard(song: allsongs[index]);
                },
              ),
            ])
        )
    );
  }
}
