import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Container sectionTitle(String title){
  return
    Container(
      alignment: Alignment(-1, 0),
      margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
      padding: EdgeInsets.fromLTRB(20, 20, 10, 30),
      decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(width: 0.5, color: Color.fromRGBO(7, 7, 7, 1.0)),
          )
      ),
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