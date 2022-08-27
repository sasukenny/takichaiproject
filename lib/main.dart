import 'package:flutter/material.dart';

import '../models/mod_Song.dart';
import '../services/SongService.dart';

import 'activities/act_nowPlaying.dart';
import 'util/createMaterialColor.dart';

void main() {
  runApp(const MyApp());
}
SongService ss = new SongService();
Song song1 = ss.getSong('62f5f98c0a4d833d51136bbc');

class MyApp extends StatelessWidget {

  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Takichai',
      theme: ThemeData(

        primarySwatch: createMaterialColor(Color(0xFFE5E5E5)),
        textTheme: const TextTheme(

          headline4: TextStyle(color: Color(0xFF000000),fontFamily: 'Montserrat',fontSize: 24.0, fontWeight: FontWeight.w700),
          headline6: TextStyle(color: Color(0xFF000000),fontFamily: 'Montserrat',fontSize: 20.0, fontWeight: FontWeight.w100),
        )
      ),
       home: NowPlayingPage(song: song1),
      //home: const AboutUs(title: "About Us"),
      //home: const Home(),
       //home: const editProfile(),
       // home: const register(),

    );
  }
}

