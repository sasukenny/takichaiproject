import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cupertino_icons/cupertino_icons.dart';

class songDisplay extends StatefulWidget {
  const songDisplay({Key? key, required this.songTitle, required this.songArtist, this.songImage = 'https://upload.wikimedia.org/wikipedia/commons/thumb/3/35/Simple_Music.svg/600px-Simple_Music.svg.png'}) : super(key: key);

  final String songTitle;
  final String songArtist;
  final String songImage;

  @override
  State<songDisplay> createState() => _songDisplayState();
}

class _songDisplayState extends State<songDisplay> {

  @override
  Widget build(BuildContext context) {

    return
      Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 20),
          child:
            Image(
              image: NetworkImage(widget.songImage),
              height: 300,
            ),
        ),
        Text(
          widget.songTitle,
          style: Theme.of(context).textTheme.headline4,
        ),
        Text(
          widget.songArtist,
          style: Theme.of(context).textTheme.headline6,
        )
      ],
    );

  }
}
