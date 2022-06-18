import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:takichaiproject/components/comp_songcard.dart';

import '../Wrapper/wrapper.dart';
import '../components/comp_header.dart';
import '../components/comp_songDisplay.dart';
import '../components/comp_musicButtons.dart';

class MyFavoriteSongs extends StatefulWidget {
  const MyFavoriteSongs({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyFavoriteSongs> createState() => _MyFavoriteSongsState();
}

class _MyFavoriteSongsState extends State<MyFavoriteSongs> {
  @override
  Widget build(BuildContext context) {
    return Wrapper(title: widget.title, activitieChild: elements());
  }
  Container elements(){
    return Container(
      height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color.fromRGBO(41, 44, 45, 1.0),Color.fromRGBO(18, 23, 26, 1.0)],
          ),
        ),
        child:SingleChildScrollView(
            child: Column(children: [
              Container(
                alignment: Alignment(-1, 0),
                margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(width: 2.0, color: Colors.white),
                    )
                ),
                child: Text(
                  textAlign: TextAlign.start,
                  widget.title,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                  ),
                ),
              ),
              Container(
                  margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  padding: const EdgeInsets.all(20.0),
                  height: 150.0,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/discover.jpg"),
                      fit: BoxFit.cover,
                    ),
                    shape: BoxShape.circle
                  )
              ),
              Container(
                margin: EdgeInsets.fromLTRB(10, 20, 10, 20),
                padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color.fromRGBO(24, 24, 24, 1),Color.fromRGBO(7, 7, 7, 1)],
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: Column(
                  children: [
                    Column(
                      children: [Container(
                        margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
                        height: 10,
                        decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(width: 2.0, color: Colors.white),
                            )
                        ),
                      )]
                    ),

                    SongCard(
                      time: "1:12",
                      title: "Time",
                    ),
                    SongCard(
                      time: "4:23",
                      title: "Comfortably Numb",
                    ),
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
