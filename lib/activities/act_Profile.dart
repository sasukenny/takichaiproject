import 'package:flutter/material.dart';

import '../Wrapper/wrapper.dart';
import '../components/comp_card.dart';
import 'act_musiclist.dart';
import 'act_myFavoriteArtists.dart';
import 'act_myFavoriteSongs.dart';
import 'act_mySongs.dart';
import 'act_nowPlaying.dart';

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
      Wrapper(activitieChild: elements());
  }
  Container elements(){
    comp_card firstComponent = const comp_card(titulo: 'Mis videos subidos', flexText: 9, newRoute: MySongs(),divide: 7);
    comp_card secondComponent = const comp_card(titulo: 'Mis favoritos', flexText: 9, newRoute: MyFavoriteSongs(title: 'Descubre'),divide: 7);
    comp_card thirdComponent = const comp_card(titulo: 'Mis suscripciones', flexText: 9, newRoute: MyFavoriteArtist(),divide: 7);
    return Container(
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color.fromRGBO(41, 44, 45, 1.0),Color.fromRGBO(18, 23, 26, 1.0)],
        ),
      ),
      child:
         SingleChildScrollView(
            child: Column(
              children: [
                blankSpace(100),
                Column(
                  children:
                  perfil(context),
                ),
                blankSpace(100),
                Column(
                  children: [Container(
                      child:
                      //Text('Lista de Favoritos - componente -proximamente'),
                      firstComponent
                  )],
                ),
                blankSpace(100),
                Column(
                  children: [
                    Container(
                        child:
                        //Text('Lista de Artistas seguidos - componente -proximamente'),
                        secondComponent
                    )],
                ),
                blankSpace(100),
                Column(
                  children: [
                    Container(
                        child:
                        //Text('Lista de Artistas seguidos - componente -proximamente'),
                        thirdComponent
                    )],
                ),
              ],
            ),
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
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/discover.jpg"),

                fit: BoxFit.fitHeight,
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