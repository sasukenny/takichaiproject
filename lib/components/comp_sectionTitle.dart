import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Container sectionTitle(String title){
  return
    Container(
      alignment: Alignment(-1, 0),
      margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
      padding: EdgeInsets.fromLTRB(20, 20, 20, 30),
      child: Text(
        textAlign: TextAlign.start,
        title,
        style: TextStyle(
            fontSize: 20,
            //fontWeight: FontWeight.bold,
            color: Colors.white
        ),
      ),
    );
}