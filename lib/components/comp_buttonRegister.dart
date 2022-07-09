import 'package:flutter/material.dart';
import '../util/mod_User.dart';

class buttonRegister extends StatelessWidget {

  final User user;
  final String name;
  final GlobalKey<FormState> formkey;

  const buttonRegister({Key? key, required this.formkey, required this.name, required this.user}) : super(key: key);

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
        async {
          if(formkey.currentState!.validate())
          {
            Scaffold.of(context).showSnackBar(
                SnackBar(content:Text("Accesando al Sistema"))
            );

            final User user = await RegisterUser(this.user.name, this.user.email, this.user.password, this.user.description);
            print(user);
          }
        },
      ),
    );
  }
}
