import 'package:flutter/material.dart';
import '../Wrapper/wrapper.dart';

class Profile extends StatefulWidget {
const Profile({Key? key, required this.title}) : super(key: key);

final String title;

@override
State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  @override
  Widget build(BuildContext context) {
    return
      Wrapper(title: widget.title, activitieChild: elements());
  }
  Container elements(){
    return Container(
      child:
        Column(
          children: [
            blankSpace(100),
            Column(
              children:
                perfil(context),
            ),
            blankSpace(37),
            Column(
              children: [Container(
                child: Text('Lista de Favoritos - componente -proximamente'),
              )],
            ),
            blankSpace(20),
            Column(
              children: [
                Container(
                  child: Text('Lista de Artistas seguidos - componente -proximamente'),
                )],
            ),
          ],
        ),
    );
  }
  List<Container> perfil(BuildContext context){
    Container my_options = opcionesUser();
    return [
      Container(
        padding: const EdgeInsets.all(20.0),
        height: 150.0,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
         ),
        ),
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/discover.jpg"),
                fit: BoxFit.cover,
              ),
              shape: BoxShape.circle
          ),
        ),
      ),
      Container(
        child: Text('Kenny Suarez'),
      ),
      Container(
        child: Text('Me gusta la música :D'),
      ),
      Container(
        margin: const EdgeInsets.all(2.0),
        padding: const EdgeInsets.all(2.0),
        child:
        Row(
          children: [
            Expanded(
                flex: 5,
                child:
                Container(
                  margin: const EdgeInsets.all(0.0),
                  padding: const EdgeInsets.fromLTRB(80, 10, 10, 10),
                  child: Column(
                    children: [
                      Text('Seguidores'),
                      Text('87')
                    ],
                  ),
                )
            ),
            Expanded(
                flex: 5,
                child:
                Container(
                  margin: const EdgeInsets.all(0.0),
                  padding: const EdgeInsets.fromLTRB(10, 10, 80, 10),
                  child: Column(
                    children: [
                      Text('Seguidos'),
                      Text('87')
                    ],
                  ),
                )
            ),
          ],
        ),
      ),
      my_options,
    ];

  }

  Container opcionesUser(){
    return
      Container(
        margin: const EdgeInsets.all(0),
        padding: const EdgeInsets.all(2.0),
        child:
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Container(
              //margin: const EdgeInsets.fromLTRB(30, 10, 5, 20),
              padding: const EdgeInsets.fromLTRB(10, 10, 5, 20),
              //padding: const EdgeInsets.fromLTRB(30, 10, 5, 20),
              child: ElevatedButton(
                onPressed: () { print("object");},
                child: Text('Editar Perfil',
                    style: TextStyle(fontSize: 11)),
              ),
            ),
            Container(
              //margin: const EdgeInsets.fromLTRB(30, 10, 5, 20),
              //padding: const EdgeInsets.all(0),
              padding: const EdgeInsets.fromLTRB(5, 10, 10, 20),
              child: ElevatedButton(
                onPressed: () { print("object");},
                child: Text('Modo Público: ON',
                    style: TextStyle(fontSize: 11)),
              ),
            )

          ],
        ),
      );
  }
  Column blankSpace(int number){
    double height = MediaQuery.of(context).size.height;
    print(height/number);
    return Column(
      children: [Container(
        height: height/number,
        //color: Colors.yellow
        //color: Colors.white
      )],
    );
  }

}