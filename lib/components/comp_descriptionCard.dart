import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Container descriptionCard(String description){
  return
    Container(
      alignment: Alignment(-1, 0),
      margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
      padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
      child: Text(
        textAlign: TextAlign.start,
        description,
        style: TextStyle(
            fontSize: 11,
            color: Colors.white
        ),
      ),
    );
}