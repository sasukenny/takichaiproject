import 'package:flutter/cupertino.dart';
import 'comp_songcard.dart';

class listFullSongs extends StatelessWidget {
  const listFullSongs({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
        child: Column(
          children: [
            SongCard(time: "1:12", title: "Takking off",),
            SongCard(time: "4:23", title: "Dreamer",),
            SongCard(time: "3:20", title: "Hey You"),
            SongCard(time: "1:12", title: "Your Time",),
            SongCard(time: "4:23", title: "is Over",),
            SongCard(time: "3:20", title: "Hey You"),
          ],
        ),
    );
  }
}