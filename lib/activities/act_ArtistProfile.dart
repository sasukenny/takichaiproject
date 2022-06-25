import 'package:flutter/material.dart';

import '../Wrapper/wrapper.dart';
import '../components/comp_card.dart';
import '../components/comp_sectionTitle.dart';
import 'act_musiclist.dart';
import 'act_nowPlaying.dart';

class ArtistProfile extends StatefulWidget {
  const ArtistProfile({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<ArtistProfile> createState() => _ArtistProfileState();
}

class _ArtistProfileState extends State<ArtistProfile> {

  @override
  Widget build(BuildContext context) {
    return
      Wrapper(activitieChild: elements());
  }
  Container elements(){
    comp_card firstComponent = const comp_card(titulo: 'Mis videos subidos', flexText: 9, newRoute: MusicList(title: 'Descubre'),divide: 7);
    comp_card secondComponent = const comp_card(titulo: 'Mis artistas favoritos', flexText: 9, newRoute: MusicList(title: 'Descubre'),divide: 7);
    comp_card thirdComponent = const comp_card(titulo: 'Mis artistas favoritos', flexText: 9, newRoute: NowPlayingPage(title: 'Mis favoritos'),divide: 7);
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
              //sectionTitle("ONE OK ROCK"),
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
    return [
      PerfilImage(),
      Container(
        child: Text('Me gusta la música :D'),
      ),
    ];
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
  Container PerfilImage(){
    return
      Container(
        padding: const EdgeInsets.all(0),
        height: 150.0,
        width: double.infinity,
        child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/oor.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            child:
            Container(
              height: 149.0,
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color.fromRGBO(0, 0, 0, 0.05), Color.fromRGBO(0, 0, 0, 1)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                )
              ),
              child:
                  new Row(
                    children: [
                      Expanded(
                        flex: 5,
                        child:
                          new Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                textAlign: TextAlign.start,
                                "ONE OK ROCK",
                                style: TextStyle(
                                    fontSize: 20,
                                    //fontWeight: FontWeight.bold,
                                    color: Colors.white
                                ),
                              ),
                            ],
                          )
                      ),
                      Expanded(
                          flex: 5,
                          child:
                          Container(
                            padding: EdgeInsets.all(0),
                            alignment: Alignment(0.0, 1.0),
                              child: new Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    textAlign: TextAlign.start,
                                    "10 canciones",
                                    style: TextStyle(
                                        fontSize: 10,
                                        //fontWeight: FontWeight.bold,
                                        color: Colors.white
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
                                    padding: EdgeInsets.all(0),
                                    child: ElevatedButton(
                                      style: raisedButtonStyle,
                                      onPressed: () { },
                                      child:
                                      Flexible(
                                          child: new Text(
                                            "Seguir",
                                            style: TextStyle(
                                                fontSize: 10,
                                                color: Colors.white
                                            ),)
                                      ),
                                    ),
                                  )
                                ],
                              ),
                          )

                      ),
                    ],
                  )


            )
        ),
      );
  }
}
final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
  //onPrimary: Colors.black87,
  //primary: Colors.grey[300],
  primary: Colors.black87,
  onPrimary: Colors.grey[300],
  //minimumSize: Size(88, 36),
  padding: EdgeInsets.all(1),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(5)),
  ),
  side: BorderSide(width: 1, color: Colors.grey),
);