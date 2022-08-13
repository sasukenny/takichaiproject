import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Wrapper/wrapper.dart';
import '../components/comp_artistCard.dart';
import '../components/comp_sectionTitle.dart';
import '../models/mod_ArtistResumen.dart';
import '../models/mod_User.dart';
import '../services/ArtistService.dart';
import '../services/UserService.dart';
import 'act_Login.dart';

class MyFavoriteArtist extends StatefulWidget {
  const MyFavoriteArtist({Key? key}) : super(key: key);
  @override
  State<MyFavoriteArtist> createState() => _MyFavoriteArtistState();
}

class _MyFavoriteArtistState extends State<MyFavoriteArtist> {
  ArtistService artistService = ArtistService();
  List<Artist_resumen> favoriteArtist = [];
  String? userId;
  String? token;
  var logger = Logger(
    filter: null, // Use the default LogFilter (-> only log in debug mode)
    printer: PrettyPrinter(), // Use the PrettyPrinter to format and print log
    output: null, // Use the default LogOutput (-> send everything to console)
  );
  initState() {
    GetFavorites();
  }

  Future<void>  GetFavorites() async {
    artistService.getlistFavoriteArtist().then((response) => {
      logger.d("favoritos.name2"),
      setState(() {
        favoriteArtist = response;
        logger.d("favoritos.name3");
        logger.d(favoriteArtist);
      })
    }).catchError(()=>{
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => login()),
      )
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
              sectionTitle("Mis Suscripciones"),
              Container(
                margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                child: Column(
                  children: [
                    ListView.builder(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                      shrinkWrap: true,
                      itemCount: favoriteArtist.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ArtistCard(artistName: favoriteArtist[index].name, userId: favoriteArtist[index].userid, isFollowing: false,);
                      },
                    ),
                    /*
                    ArtistCard(numberOfSongs: 10, artistName: "ONEOKROCK"),
                    ArtistCard(numberOfSongs: 5, artistName: "Demode"),
                    ArtistCard(numberOfSongs: 1, artistName: "Kennysuher"),
                    ArtistCard(numberOfSongs: 0, artistName: "Hey You"),
                    ArtistCard(numberOfSongs: 10, artistName: "ONEOKROCK"),*/
                  ],
                ),
              )
            ])
        )
    );
  }
}

