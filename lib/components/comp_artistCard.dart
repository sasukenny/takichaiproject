import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../activities/act_ArtistProfile.dart';
import '../models/mod_ArtistResumen.dart';


class ArtistCard extends StatelessWidget {

  const ArtistCard({
    Key? key,
    this.artistData,
    this.numberOfSongs= 0,
    this.artistName="artist name" ,
  }) : super(key: key);
  final int numberOfSongs;
  final String artistName;
  final Artist_resumen? artistData;

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
                          image: DecorationImage(
                            image: AssetImage("assets/images/discover.jpg"),
                            fit: BoxFit.cover,
                          ),
                          shape: BoxShape.circle
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
                                  artistName, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: Colors.white))
                          ),
                          Container(
                            alignment: Alignment(-1, 0),
                            child: Text(
                                textAlign: TextAlign.left,
                                'Artista/Banda', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 7, color: Colors.white)),
                          ),
                          Container(
                            alignment: Alignment(-1, 0),
                            child:  Text(
                                textAlign: TextAlign.left,
                                numberOfSongs.toString() + (numberOfSongs==1?" canción":" canciones"), style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 7, color: Colors.white)),
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
                      child: ElevatedButton(
                        style: raisedButtonStyle,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ArtistProfile(UserId: "62bf6513929a04ce7230db56")),
                          );
                        },
                        child:
                          Flexible(
                            child: new Text("Ver Artista"))
                          //Text('Looks like a RaisedButton'),
                        ,
                      ),
                    ),
                  ],
                )
            ),
          ],
        )
    );
  }
}
final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
  //onPrimary: Colors.black87,
  //primary: Colors.grey[300],
  primary: Colors.black87,
  onPrimary: Colors.grey[300],
  //minimumSize: Size(88, 36),
  padding: EdgeInsets.symmetric(horizontal: 16),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(5)),
  ),
  side: BorderSide(width: 1.5, color: Colors.grey),
);