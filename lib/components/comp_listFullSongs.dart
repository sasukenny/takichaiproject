import 'package:flutter/cupertino.dart';

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
            /*
            SongCard(time: "1:12", title: "Takking off",songId: "62f5f9920a4d833d51136bc2",),
            SongCard(time: "4:23", title: "Dreamer",songId: "62f5f9920a4d833d51136bc2",),
            SongCard(time: "3:20", title: "Hey You",songId: "62f5f9920a4d833d51136bc2",),
            SongCard(time: "4:23", title: "is Over",songId: "62f5f9920a4d833d51136bc2",),
            SongCard(time: "3:20", title: "Hey You",songId: "62f5f9920a4d833d51136bc2",),
            */
          ],
        ),
    );
  }
}