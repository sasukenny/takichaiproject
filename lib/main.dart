import 'package:flutter/material.dart';

import 'activities/act_ArtistProfile.dart';
import 'activities/act_Home.dart';
import 'activities/act_Register.dart';
import 'activities/act_Login.dart';
import 'activities/act_musiclist.dart';
import 'activities/act_EditProfile.dart';
import 'util/createMaterialColor.dart';

void main() {
  runApp(const MyApp());
}

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
       //home: const NowPlayingPage(title: 'Takichai'),
      //home: const AboutUs(title: "About Us"),
      //home: const Home(),
      // home: const editProfile(),
        home: const register(),

    );
  }
}

