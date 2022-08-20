import 'package:flutter/material.dart';

class textArea extends StatelessWidget {

  final String placeholder;
  final String voidMessage;
  final TextEditingController controller;

  const textArea({
    Key? key,
    required this.controller,
    required this.placeholder,
    required this.voidMessage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      margin: EdgeInsets.fromLTRB(50,0,50,20),
      padding: EdgeInsets.fromLTRB(50,0,50,0),
      decoration: BoxDecoration(
        color: Color.fromRGBO(245, 245, 245, 1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextFormField(
          minLines: 2,
          maxLines:5 ,
          keyboardType: TextInputType.multiline,
          controller: controller,
          decoration: InputDecoration(
            hintText: placeholder,
          ),
      ),
    );
  }
}
