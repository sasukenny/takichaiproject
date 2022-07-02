import 'package:flutter/material.dart';

import 'activities/act_ArtistProfile.dart';
import 'activities/act_Home.dart';
import 'activities/act_Register.dart';
import 'activities/act_Login.dart';
import 'activities/act_musiclist.dart';
import 'util/createMaterialColor.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Takichai',
      theme: ThemeData(

        primarySwatch: createMaterialColor(Color(0xFFE5E5E5)),
        textTheme: const TextTheme(

          headline4: TextStyle(color: Color(0xFF000000),fontFamily: 'Montserrat',fontSize: 24.0, fontWeight: FontWeight.w700),
          headline6: TextStyle(color: Color(0xFF000000),fontFamily: 'Montserrat',fontSize: 20.0, fontWeight: FontWeight.w100),
        )
      ),
       //home: const NowPlayingPage(title: 'Takichai'),
       home: const Home(title: 'Takichai',),
      // home: const NowPlayingPage(title: 'Takichai'),
      //home: const MusicList(title: 'Takichai'),
      // home: const Wrapper(title: 'Now Playing'),
      //home: const NowPlayingPage(title: 'Now Playing'),
      // home: const MusicList(title: 'Music List'),
      //home: const AboutUs(title: "About Us"),
      // home: const register(),

    );
  }
}

