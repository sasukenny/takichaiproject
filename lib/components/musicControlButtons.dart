import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class musicControlButtons extends StatefulWidget {
  const musicControlButtons({Key? key, this.playing = false}) : super(key: key);

  final bool playing;

  @override
  State<musicControlButtons> createState() => _musicControlButtonsState();
}

class _musicControlButtonsState extends State<musicControlButtons> {

  @override
  Widget build(BuildContext context) {
    return
      Container(
        width: 170,
        child:
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Icon(CupertinoIcons.backward_end_alt_fill ,size: 32),
              const Icon(CupertinoIcons.play_fill ,size: 32),
              const Icon(CupertinoIcons.forward_end_alt_fill ,size: 32)
            ],
          ),
      )
    // This trailing comma makes auto-formatting nicer for build methods.
        ;
  }
}

