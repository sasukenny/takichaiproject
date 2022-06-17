import 'package:flutter/material.dart';
import '../Wrapper/wrapper.dart';
import '../components/comp_bottomNavBar.dart';
import '../components/comp_card.dart';
import 'act_musiclist.dart';
import 'act_nowPlaying.dart';

class Home extends StatefulWidget {
  const Home({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    return
      Wrapper(title: widget.title, activitieChild: elements());
  }


  Container elements(){
    comp_card firstComponent = const comp_card(titulo: 'Descubre nueva música', flexText: 7, img: "assets/images/heart.png", newRoute: MusicList(title: 'Descubre') ,);
    comp_card secondComponent = const comp_card(titulo: 'Escucha nuevos artistas', flexText: 9, newRoute: NowPlayingPage(title: 'Mis favoritos'));
    comp_card thirdComponent = const comp_card(titulo: 'Sube tu música', flexText: 9, newRoute: NowPlayingPage(title: 'Mis favoritos'),divide: 4,);
    comp_card fourthComponent = const comp_card(titulo: 'Mi música favorita', flexText: 7, newRoute: MusicList(title: 'Sube tu música')) ;
    comp_card fifthComponent = const comp_card(titulo: 'Mis Artistas favoritos', flexText: 7, newRoute: MusicList(title: 'Sobre TakiChai')) ;
    comp_card sixthComponent = const comp_card(titulo: 'Sobre TakiChai', flexText: 7, newRoute: MusicList(title: 'Sobre TakiChai')) ;
    double dobleheight = MediaQuery.of(context).size.height/4;
    print('object');
    print(dobleheight);
    return Container(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            blankSpace(),
            const Text(
              'Bienvenido Xocrona!!',
              style: TextStyle(
                //color: Colors.white,
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
                    margin: const EdgeInsets.all(1.0),
                    padding: const EdgeInsets.all(1.0),

                    decoration: const BoxDecoration(
                      //color: Colors.amber,
                    ),
                    child:
                    Row(
                      children: [
                        Expanded(
                          flex: 7,
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
                          flex: 3,
                          child:
                          thirdComponent
                        ),
                      ],
                    )
                ),
                Container(
                    margin: const EdgeInsets.all(1.0),
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
                sixthComponent,
                sixthComponent,
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
          height: height/35,
          //color: Colors.yellow
          //color: Colors.white
      )],
    );
  }
}