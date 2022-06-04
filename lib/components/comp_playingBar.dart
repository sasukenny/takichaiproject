import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../util/playingTime.dart';

class playingBar extends StatefulWidget {
  playingBar({Key? key,required PlayingTime this.timePlayed,required PlayingTime this.songDuration}) : super(key: key);

  PlayingTime timePlayed;
  PlayingTime songDuration;

  @override
  State<playingBar> createState() => _playingBarState();
}

class _playingBarState extends State<playingBar> {

  @override
  Widget build(BuildContext context) {

    var timePlayed = PlayingTime.copy(widget.timePlayed);
    var songDuration = PlayingTime.copy(widget.songDuration);

    var format = new NumberFormat();
    format.minimumIntegerDigits = 2;

    return
      Row(
        children: [
          Text('${timePlayed.minutes}:${format.format(timePlayed.seconds)} - ${songDuration.minutes}:${format.format(songDuration.seconds)} \n'
              '${(timePlayed.numEquiv/songDuration.numEquiv * 100).toInt()}%')
        ],
      )
    ;
  }
}
