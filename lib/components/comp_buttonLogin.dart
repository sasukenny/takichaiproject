import 'package:flutter/material.dart';

class buttonLogin extends StatelessWidget {

  final String name;
  final GlobalKey<FormState> formkey;

  const buttonLogin({Key? key, required this.formkey, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      margin: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        color: Colors.black54,
        borderRadius: BorderRadius.circular(50),
      ),
      padding: EdgeInsets.fromLTRB(60,0,60,0),
      child: FlatButton(
        child: Text(
          name,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontFamily: 'Montserrat',
          ),
        ),
        onPressed: ()
        {
          if(formkey.currentState!.validate())
          {
            Scaffold.of(context).showSnackBar(
                SnackBar(content:Text("Accesando al Sistema"))
            );
          }
        },
      ),
    );
  }
}
