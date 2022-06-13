import 'dart:js';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../activities/act_Login.dart';
import '../activities/act_musiclist.dart';

class comp_card extends StatelessWidget {
  const comp_card({Key? key,
        this.img = "",
        required this.titulo,
        required this.flexText,
        required this.newRoute,
        this.divide = 8
  }) : super(key: key);
  final String titulo;
  final int flexText;
  final String img;
  final StatefulWidget newRoute;
  final int divide;
  @override
  Widget build(BuildContext context) {
    int InvertflexText = 10 - flexText;
    double height = MediaQuery.of(context).size.height;
    print("height/8");
    print(height/8);
    print(this.divide);
    return
      InkWell(

        child: Container(
            height: height/this.divide,
            width: double.infinity,
            margin: const EdgeInsets.all(5.0),
            padding: const EdgeInsets.all(3.0),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color.fromRGBO(24, 24, 24, 1),Color.fromRGBO(7, 7, 7, 1)],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
              //color: Color.fromRGBO(24, 24, 24, 1),
              //border: Border.all(color: Colors.blueAccent),
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            child:
            new Row(
              children: [
                Expanded(
                  flex: flexText,
                  child: Container(
                      margin: const EdgeInsets.all(3.0),
                      padding: const EdgeInsets.all(3.0),
                      alignment: Alignment(0.0, 1.0),
                      decoration: BoxDecoration(
                        //border: Border.all(color: Colors.blueAccent)
                      ),
                      child:
                      new Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            margin: const EdgeInsets.all(3.0),
                            padding: const EdgeInsets.all(3.0),
                            alignment: Alignment(-1.0, 1.0),
                            child: Text(
                              titulo,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontFamily: 'Montserrat',
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.all(3.0),
                            padding: const EdgeInsets.all(3.0),
                            alignment: Alignment(-1.0, 1.0),
                            child: Text(
                              'Encuentra nueva música que te puede gustar',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 5,
                                fontFamily: 'Montserrat',
                              ),
                            ),
                          ),
                        ],
                      )

                  ),
                ),
                Expanded(
                  flex: InvertflexText,
                  child: !img.isEmpty?logo(img):Container(
                    margin: const EdgeInsets.all(3.0),
                    padding: const EdgeInsets.all(3.0),
                    alignment: Alignment(0.0, 1.0),
                    decoration: BoxDecoration(
                      //border: Border.all(color: Colors.blueAccent)
                    ),

                  ),
                ),

              ],
            )
        ),
        onTap: () {
          print("Click event on Container");
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => newRoute),
          );
          /*
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MusicList(title: 'hola')),
          );*/
        },
      );
    throw UnimplementedError();
  }
}



Container logo(String img){
  return
    Container(
      margin: const EdgeInsets.all(3.0),
      padding: const EdgeInsets.all(3.0),
      alignment: Alignment(0.0, 1.0),
      decoration: BoxDecoration(
        //border: Border.all(color: Colors.blueAccent)
      ),
      child:Image.asset(img, width: 20.0,),
    );
}