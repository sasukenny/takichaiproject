import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'musicControlButtons.dart';
import 'package:cupertino_icons/cupertino_icons.dart';

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

  @override
  Widget build(BuildContext context) {
    return
      Container(
        margin: EdgeInsets.symmetric(vertical: 30),
        child:
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Icon(CupertinoIcons.shuffle,size: 32),
              const musicControlButtons(),
              const Icon(CupertinoIcons.repeat ,size: 32)
            ],
          )
        ,
      )
    // This trailing comma makes auto-formatting nicer for build methods.
        ;
  }
}
