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
    double width = MediaQuery.of(context).size.width;

    return Container(
      margin: const EdgeInsets.all(10),
      width: width,
      height: 85,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        color: Colors.black,
      ),
      padding: const EdgeInsets.only(left: 15, bottom: 5, top: 5, right: 15),
      alignment: Alignment.center,
        child:
        Row(
          children: [
            Expanded(
                flex: 6,
                child:
                //firstComponent,
                Row(
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.amber
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(10, 5, 5, 5),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                                textAlign: TextAlign.left,
                                title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: Colors.white))
                          ),
                          Container(
                              alignment: Alignment(-1, 0),
                              child: Text(
                                  textAlign: TextAlign.left,
                                  'autor: Artista Name', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 7, color: Colors.white)),
                          ),
                          Container(
                              alignment: Alignment(-1, 0),
                              child:  Text(
                                  textAlign: TextAlign.left,
                                  'duración: ' + time, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 7, color: Colors.white)),
                          ),
                          Container(
                              alignment: Alignment(-1, 0),
                              child: Text(
                                  textAlign: TextAlign.left,
                                  'genero: Rock', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 7, color: Colors.white))
                          ),
                        ],
                      ),
                    )
                  ],
                )
            ),
            Expanded(
                flex: 4,
                child:
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      padding: EdgeInsets.all(7),
                      child: Icon(Icons.favorite, color: Colors.white),
                    ),
                    Container(
                      padding: EdgeInsets.all(7),
                      child: Icon(Icons.play_arrow, color: Colors.white,),
                    ),
                  ],
                )
            ),
          ],
        )
    );
  }
}