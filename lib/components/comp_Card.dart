import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Container component1( {Key? key,
  required String titulo,
  required int flexText,
  String img="",

})  {
  int InvertflexText = 10 - flexText;
  return
    Container(
        height: 100.0,
        width: double.infinity,
        margin: const EdgeInsets.all(5.0),
        padding: const EdgeInsets.all(3.0),
        decoration: BoxDecoration(
          color: Color.fromRGBO(24, 24, 24, 1),
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
    );

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