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

  double actualTime = 0;

  @override
  Widget build(BuildContext context) {

    var timePlayed = PlayingTime.copy(widget.timePlayed);
    var songDuration = PlayingTime.copy(widget.songDuration);

    var format = new NumberFormat("00");
    format.minimumIntegerDigits = 2;
    // format.significantDigits = 2;

    return
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: Column(
          children: [
            Slider(
              value: actualTime,
              max: songDuration.numEquiv,
              min: 0,
              label: actualTime.toString(),
              activeColor: Color(0xFF000000),
              inactiveColor: Color(0xFF000000),
              onChanged: (double value) {
                setState(() {
                  actualTime = value;
                });
              }
            ),
            Row(
              children: [
                Text('${actualTime~/60}'':''${format.format(actualTime%60)}'),
                const Spacer(),
                Text(' ${songDuration.minutes}:${format.format(songDuration.seconds)}')
              ],
            )
          ],

        ),
      );

  }
  // double _currentSliderValue = 20;
  //
  // @override
  // Widget build(BuildContext context) {
  //   return Slider(
  //     value: _currentSliderValue,
  //     max: 100,
  //     divisions: 5,
  //     label: _currentSliderValue.round().toString(),
  //     onChanged: (double value) {
  //       setState(() {
  //         _currentSliderValue = value;
  //       });
  //     },
  //   );
  // }
}
