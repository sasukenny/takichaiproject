import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SongCard extends StatelessWidget {

  const SongCard({
    Key? key,
    this.time="0:00" ,
    this.title="0:00" ,
    this.genre="rock"
  }) : super(key: key);
  
  final String time;
  final String title;
  final String genre;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Container(
      margin: const EdgeInsets.fromLTRB(3, 0.5, 3, 0.5),
      width: width,
      height: 85,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(2)),
        gradient: LinearGradient(
          colors: [Color.fromRGBO(24, 24, 24, 0.75),Color.fromRGBO(7, 7, 7, 0.75)],
        ),
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(26, 115, 232, 0.125),
            spreadRadius: 2,
            blurRadius: 27,
            offset: Offset(0, 1), // changes position of shadow
          ),
        ],
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
                                  '', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 7, color: Colors.white)),
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
                                  'genero: ' + genre, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 7, color: Colors.white))
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