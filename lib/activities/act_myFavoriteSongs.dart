import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Wrapper/wrapper.dart';
import '../components/comp_sectionTitle.dart';

class MyFavoriteSongs extends StatefulWidget {
  const MyFavoriteSongs({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyFavoriteSongs> createState() => _MyFavoriteSongsState();
}

class _MyFavoriteSongsState extends State<MyFavoriteSongs> {
  @override
  Widget build(BuildContext context) {
    return Wrapper(activitieChild: elements());
  }
  Container elements(){
    return Container(
      height: MediaQuery.of(context).size.height,
        child:SingleChildScrollView(
            child: Column(children: [
              sectionTitle("Mis Favoritos"),
              Container(
                margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                child: Column(
                  children: [
                    /*
                    SongCard(time: "1:12", title: "Time",songId:"62f5f9920a4d833d51136bc2"),
                    SongCard(time: "4:23", title: "Comfortably",songId:"62f5f9920a4d833d51136bc2"),
                    SongCard(time: "3:20", title: "Hey You",songId:"62f5f9920a4d833d51136bc2"),
                    SongCard(time: "3:20", title: "Hey You",songId:"62f5f9920a4d833d51136bc2"),
                    SongCard(time: "3:20", title: "Hey You",songId:"62f5f9920a4d833d51136bc2"),
                    SongCard(time: "3:20", title: "Hey You",songId:"62f5f9920a4d833d51136bc2"),
                    */
                  ],
                ),
              )
            ])
        )
    );
  }
}
