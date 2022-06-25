import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Header extends StatefulWidget {
  const Header({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {

  @override
  Widget build(BuildContext context) {

    return
          Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child:
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    //const Icon(CupertinoIcons.back,size: 32),
                    Text(widget.title,
                      style:
                        Theme.of(context).textTheme.headline4
                    ),
                    //const Icon(CupertinoIcons.ellipsis_vertical ,size: 32)
                  ],
                )
          )
    ;
  }
}
