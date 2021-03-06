import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Wrapper/wrapper.dart';
import '../components/comp_artistCard.dart';
import '../components/comp_sectionTitle.dart';

class MyFavoriteArtist extends StatefulWidget {
  const MyFavoriteArtist({Key? key}) : super(key: key);
  @override
  State<MyFavoriteArtist> createState() => _MyFavoriteArtistState();
}

class _MyFavoriteArtistState extends State<MyFavoriteArtist> {
  @override
  Widget build(BuildContext context) {
    return Wrapper(activitieChild: elements());
  }
  Container elements(){
    return Container(
        height: MediaQuery.of(context).size.height,
        child:SingleChildScrollView(
            child: Column(children: [
              sectionTitle("Mis Suscripciones"),
              Container(
                margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                child: Column(
                  children: [
                    ArtistCard(numberOfSongs: 10, artistName: "ONEOKROCK"),
                    ArtistCard(numberOfSongs: 5, artistName: "Demode"),
                    ArtistCard(numberOfSongs: 1, artistName: "Kennysuher"),
                    ArtistCard(numberOfSongs: 0, artistName: "Hey You"),
                    ArtistCard(numberOfSongs: 10, artistName: "ONEOKROCK"),
                  ],
                ),
              )
            ])
        )
    );
  }
}

