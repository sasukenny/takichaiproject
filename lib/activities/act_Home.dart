import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Wrapper/wrapper.dart';
import '../components/comp_card.dart';
import '../models/mod_User.dart';
import '../services/UserService.dart';
import 'act_AboutUs.dart';
import 'act_ArtistList.dart';
import 'act_Login.dart';
import 'act_musiclist.dart';
import 'act_myFavoriteArtists.dart';
import 'act_myFavoriteSongs.dart';
import 'act_nowPlaying.dart';
import '../globals/globalValues.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  UserService userService = UserService();
  User userdata = User('', '', '', [], [], true, '','') ;
  String? userId;
  var logger = Logger(
    filter: null, // Use the default LogFilter (-> only log in debug mode)
    printer: PrettyPrinter(), // Use the PrettyPrinter to format and print log
    output: null, // Use the default LogOutput (-> send everything to console)
  );
  @protected
  @mustCallSuper
  initState() {
    GetUserId();
  }

  Future<void> GetUserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userId = prefs.getString('userId');
    logger.d(userId);
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

  @override
  Widget build(BuildContext context) {
    return
      Wrapper(activitieChild: elements(context));
  }


  Container elements(BuildContext context){
    comp_card firstComponent = const comp_card(titulo: 'Descubre nueva música', flexText: 7, img: "assets/images/heart.png", newRoute: MusicList(title: 'Descubre'),divide: 4.75);
    comp_card secondComponent = const comp_card(titulo: 'Escucha nuevos artistas', flexText: 9, newRoute: ArtistList());
    comp_card thirdComponent = const comp_card(titulo: 'Mis creaciones', flexText: 9, newRoute: NowPlayingPage(title: 'Mis Creaciones'),divide: 2.25,);
    comp_card fourthComponent = const comp_card(titulo: 'Mi música favorita', flexText: 7, newRoute: MyFavoriteSongs(title: 'Mi música favorita')) ;
    comp_card fifthComponent = const comp_card(titulo: 'Mis Artistas favoritos', flexText: 7, newRoute: MyFavoriteArtist()) ;
    comp_card sixthComponent = const comp_card(titulo: 'Mis creaciones', flexText: 7, newRoute: AboutUs(title: "About Us")) ;
    comp_card seventhComponent = const comp_card(titulo: 'Sobre TakiChai', flexText: 7, newRoute: AboutUs(title: "About Us")) ;
    double dobleheight = MediaQuery.of(context).size.height/4;
    //print('object');
    //print(dobleheight);
    String tituloBienvenida = 'Bienvenido '  + userdata.name + '!';
    return Container(
      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            blankSpace(),

            Text(
              tituloBienvenida,
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontFamily: 'Montserrat',
              ),
            ),
            blankSpace(),
            /*
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),*/
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [

                Container(
                    margin: const EdgeInsets.all(0),
                    padding: const EdgeInsets.all(1.0),

                    decoration: const BoxDecoration(
                      //color: Colors.amber,
                    ),
                    child:
                    Row(
                      children: [
                        Expanded(
                          flex: 6,
                          child:
                          //firstComponent,
                          Column(
                            children: [

                              firstComponent,
                              secondComponent,
                            ],
                          )
                        ),
                        Expanded(
                          flex: 4,
                          child:
                          thirdComponent
                        ),
                      ],
                    )
                ),
                Container(
                    margin: const EdgeInsets.all(0),
                    padding: const EdgeInsets.all(1.0),
                    decoration: const BoxDecoration(
                    ),
                    child:
                    Row(
                      children: [
                        Expanded(
                          flex: 5,
                          child:
                          fourthComponent,
                        ),
                        Expanded(
                          flex: 5,
                          child:
                          fifthComponent,
                        ),
                      ],
                    )
                ),
                //sixthComponent,
                //seventhComponent,
                blankSpace(),
              ],
            ),
          ]
      ),
    );
  }

  Column blankSpace(){
    double height = MediaQuery.of(context).size.height;
    //print(height/35);
    return Column(
      children: [Container(
          height: height/37,
          //color: Colors.yellow
          //color: Colors.white
      )],
    );
  }
}