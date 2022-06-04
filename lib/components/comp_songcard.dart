import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SongCard extends StatelessWidget {

  const SongCard({
    Key? key,
    this.time="0:00" ,
    this.title="0:00" ,
  }) : super(key: key);
  
  final String time;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      width: 380,
      height: 50,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        color: Colors.black,
      ),
      padding: const EdgeInsets.only(left: 15, bottom: 5, top: 5, right: 30),
      alignment: Alignment.center,
      child: Flex(
        direction: Axis.horizontal,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flex( // Columna 1
            direction: Axis.vertical,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
              Text(time, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 10, color: Colors.white))
            ],
          ),
          Flex( // Columna 2
            direction: Axis.horizontal,
            children: const [
              Icon(Icons.play_arrow, color: Colors.white,),
              Icon(Icons.favorite, color: Colors.white),
            ],
          )
        ],
      ),
    );
  }
}