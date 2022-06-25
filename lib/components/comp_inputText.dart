import 'package:flutter/material.dart';

class inputText extends StatelessWidget {

  final String placeholder;
  final String voidMessage;
  final TextEditingController controller;

  const inputText({
    Key? key,
    required this.controller,
    required this.placeholder,
    required this.voidMessage
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      margin: EdgeInsets.fromLTRB(50,0,50,20),
      padding: EdgeInsets.fromLTRB(50,0,50,0),
      decoration: BoxDecoration(
        color: Color.fromRGBO(245, 245, 245, 1),
        borderRadius: BorderRadius.circular(50),
      ),
      child: TextFormField(
          controller: controller,
          decoration: InputDecoration(
            hintText: placeholder,
          ),
          validator:(value) {
            if(value!.isEmpty)
            {
              return voidMessage;
            }
          }
      ),
    );
  }
}

