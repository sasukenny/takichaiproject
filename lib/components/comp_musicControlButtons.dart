import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class musicControlButtons extends StatefulWidget {
  const musicControlButtons({Key? key, this.playing = false}) : super(key: key);

  final bool playing;

  @override
  State<musicControlButtons> createState() => _musicControlButtonsState();
}

class _musicControlButtonsState extends State<musicControlButtons> {

  backward(){

  }

  playPause(){

  }

  forward(){

  }

  @override
  Widget build(BuildContext context) {
    return
      Container(
        width: 170,
        child:
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton.icon(
                  onPressed: backward,
                  label: const Text(''),
                  style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.resolveWith((states) => Colors.black)
                  ),
                  icon: Icon(CupertinoIcons.backward_end_alt_fill,size: 32)
              ),
              TextButton.icon(
                  onPressed: playPause,
                  label: const Text(''),
                  style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.resolveWith((states) => Colors.black)
                  ),
                  icon: Icon(CupertinoIcons.play_fill,size: 32)
              ),
              TextButton.icon(
                  onPressed: forward,
                  label: const Text(''),
                  style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.resolveWith((states) => Colors.black)
                  ),
                  icon: Icon(CupertinoIcons.forward_end_alt_fill,size: 32)
              )
            ],
          ),
      );
  }
}

