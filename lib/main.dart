import 'package:flutter/material.dart';

import '../models/mod_Song.dart';
import 'activities/act_nowPlaying.dart';
import 'util/createMaterialColor.dart';

void main() {
  runApp(const MyApp());
}

Song song1 = Song.emptySong();

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

