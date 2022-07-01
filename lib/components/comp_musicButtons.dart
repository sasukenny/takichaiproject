import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'comp_musicControlButtons.dart';
<<<<<<< HEAD
import '../UTIL/createMaterialColor.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
=======

import '../UTIL/createMaterialColor.dart';
import 'package:cupertino_icons/cupertino_icons.dart';

>>>>>>> bd8da63ca4ec16170e29d18db1f3b2ff691e0474

enum repeatEnum {
  none,
  one,
  all
}

class musicButtons extends StatefulWidget {
  const musicButtons({Key? key, this.shuffle = false, this.playing = false ,this.repeat = repeatEnum.none}) : super(key: key);

  final bool shuffle;
  final bool playing;
  final repeatEnum repeat;

  @override
  State<musicButtons> createState() => _musicButtonsState();
}

class _musicButtonsState extends State<musicButtons> {

  toggleShuffle(){
    //Shuffle songs: aleatorias
  }
  toggleRepeat(){
    //Repeat set of songs: repetir
  }

  @override
  Widget build(BuildContext context) {
    return
      Container(
        margin: EdgeInsets.symmetric(vertical: 30),
        child:
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton.icon(
                  onPressed: toggleShuffle,
                  label: const Text(''),
                  style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.resolveWith((states) => Colors.black)
                  ),
                  icon: Icon(CupertinoIcons.shuffle,size: 32)
              ),
              const musicControlButtons(),
              TextButton.icon(
                  onPressed: toggleRepeat,
                  label: const Text(''),
                  style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.resolveWith((states) => Colors.black)
                  ),
                  icon: Icon(CupertinoIcons.repeat,size: 32)
              )
            ],
          )
      );
  }
}
