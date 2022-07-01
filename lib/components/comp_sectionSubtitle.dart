import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Container sectionSubtitle(String title){
  return
    Container(
      alignment: Alignment(-1, 0),
      margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
      padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
      child: Text(
        textAlign: TextAlign.start,
        title,
        style: TextStyle(
            fontSize: 15,
            //fontWeight: FontWeight.bold,
            color: Colors.white
        ),
      ),
    );
}