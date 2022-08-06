import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Wrapper/wrapper.dart';
import '../components/comp_card.dart';
import '../models/mod_User.dart';
import '../services/UserService.dart';
import 'act_Login.dart';
import 'act_musiclist.dart';
import 'act_myFavoriteArtists.dart';
import 'act_myFavoriteSongs.dart';
import 'act_mySongs.dart';
import 'act_nowPlaying.dart';
import '../globals/globalValues.dart';

class Profile extends StatefulWidget {
const Profile({Key? key, required this.title}) : super(key: key);

final String title;


@override
State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  UserService userService = UserService();
  User userdata = User('', '', '', [], [], true, '','') ;
  String? userId;
  @protected
  @mustCallSuper
  initState(){
    GetUserId();
  }
  Future<void> GetUserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userId = prefs.getString('userId');
    if(userId!=null){
      userService.getUserData(userId!).then((response) => {
        setState(() {
          userdata = response;
        })
      }).catchError(()=>{
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => login()),
        )
      });
    }
    else{
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => login()),
      );
    }
  }
  String CountItems( List<String> listParam){
    return listParam.length.toString();
  }
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
        child: Text(userdata.name,
          style: blancoColor()
        ),
      ),
      Container(
        child: Text(userdata.email,
          style: blancoColor()
        ),
      ),
      Container(
        child: Text(userdata.description,
          style: blancoColor()
        ),
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
                      Text('Seguidores',
                      style: blancoColor(),),
                      Text(CountItems(userdata.subscribers),
                      style: blancoColor(),)
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
                      Text('Seguidos',
                      style: blancoColor()
                      ),
                      Text(CountItems(userdata.subscriptions),
                      style: blancoColor()
                        ,)
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
                onPressed: () { print("Edit Profile pressed");},
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
    return Column(
      children: [Container(
        height: height/number,
        //color: Colors.yellow
        //color: Colors.white
      )],
    );
  }
  TextStyle blancoColor(){
    return TextStyle(
        color: Colors.white,
        fontSize: 12,
        fontFamily: 'Montserrat',
    );
  }

}