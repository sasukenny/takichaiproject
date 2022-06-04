/**
 * Alumno: RAMOS PAREDES ROGER ANTHONY (18200096)
 */


// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:io';

import 'package:hello_world/comp_songcard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      theme: ThemeData(
        // Define the default brightness and colors.
        brightness: Brightness.dark,
        primaryColor: Colors.lightBlue[800],

        // Define the default font family.
        fontFamily: 'Montserrat',

        // Define the default `TextTheme`. Use this to specify the default
        // text styling for headlines, titles, bodies of text, and more.
        textTheme: const TextTheme(
          headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
          headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
          bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
        ),
      ),
      home: Scaffold(
          body: Column(children: [
        Container(
          margin: const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 50),
          child: Flex(
            direction: Axis.horizontal,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Icon(Icons.arrow_back),
              Text("Music List", style: TextStyle(fontSize: 32),),
              Icon(Icons.more_vert),
            ],
          ),
        ),
        Image.asset('assets/images/music-player.png'),
        const Text(
          "PINK FLOYD", 
          textAlign: TextAlign.center, 
          style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
        ),
        Container(
          margin: const EdgeInsets.only(top: 40),
          child: Column(
            children: const [
            SongCard(time: "1:12"),
            SongCard(time: "4:23"),
            SongCard(time: "3:20"),
          ],
          ),
        )
      ])),
    );
  }
}


