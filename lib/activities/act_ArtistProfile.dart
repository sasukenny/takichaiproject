import 'package:flutter/material.dart';

import '../Wrapper/wrapper.dart';
import '../components/comp_TextCard.dart';
import '../components/comp_card.dart';
import '../components/comp_listFullSongs.dart';
import '../components/comp_sectionSubtitle.dart';
import '../components/comp_sectionTitle.dart';
import '../components/comp_songcard.dart';
import '../models/mod_User.dart';
import '../services/ArtistService.dart';
import '../services/UserService.dart';
import 'act_musiclist.dart';
import 'act_nowPlaying.dart';

class ArtistProfile extends StatefulWidget {
  const ArtistProfile({Key? key, required this.userId, this.isFollowing = true}) : super(key: key);

  final String userId;
  final bool isFollowing;
  @override
  State<ArtistProfile> createState() => _ArtistProfileState();
}

class _ArtistProfileState extends State<ArtistProfile> {
  UserService userService = UserService();
  ArtistService artistService = ArtistService();
  bool following = false;
  bool isFollowingState = true;
  User userdata = User('', '', '', [], [],true, '', ''
  ) ;
  @protected
  @mustCallSuper
  initState(){
    print("widget.UserId");
    print(widget.userId);
    setState(() {
      isFollowingState = widget.isFollowing;
    });
    userService.getUserData(widget.userId).then((response) => {
      setState(() {
        userdata = response;
      })
    });
  }
  /*
  callFollow(){
    userService.followArtist().then((response) => {
      setState(() {
        userdata = response;
      })
    });
  }
  */
  @override
  Widget build(BuildContext context) {
    return
      Wrapper(activitieChild: elements());
  }
  Container elements(){
    return Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color.fromRGBO(24, 24, 36, 1.0),Color.fromRGBO(8, 13, 25, 1.0)],
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
              listFullSongs(),
            ],
          ),
        ),
    );
  }
  List<Container> perfil(BuildContext context){
    return [
      PerfilImage(context),
      Container(
        alignment: Alignment(-1, 0),
        margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
        padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
        decoration: BoxDecoration(
          color: Color.fromRGBO(0, 0, 0, 1)
        ),
        child: Text(
          textAlign: TextAlign.start,
          userdata.description,
          style: TextStyle(
              fontSize: 11,
              color: Colors.white
          ),
        ),
      ),
      sectionSubtitle("Canciones"),
    ];
  }
  Container PerfilImage(BuildContext context){
    return
      Container(
        padding: const EdgeInsets.all(0),
        height: 170.0,
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
              height: 169.0,
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color.fromRGBO(0, 0, 0, 0.05),Color.fromRGBO(0, 0, 0, 0.77), Color.fromRGBO(0, 0, 0, 1)],
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
                              Container(
                                padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                                child: Text(
                                  textAlign: TextAlign.start,
                                  userdata.name,
                                  style: TextStyle(
                                      fontSize: 20,
                                      //fontWeight: FontWeight.bold,
                                      color: Colors.white
                                  ),
                                ),
                              )
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
                                    child: widget.isFollowing?botonSeguir(context,widget.userId):botonDejarSeguir(context, widget.userId)
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

  Widget botonSeguir(BuildContext context, String userId){
    return
      ElevatedButton(
        style: raisedButtonStyle,
        onPressed: () {
          artistService.followArtist(widget.userId);
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Ahora está siguiendo al artista'))
          );
          setState(() {
            isFollowingState = !widget.isFollowing;
          });
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ArtistProfile(userId: userdata.userId, isFollowing: isFollowingState,)),
          );
        },
        child:
        Flexible(
            child: new Text(
              "Seguir",
              style: TextStyle(
                  fontSize: 10,
                  color: Colors.white
              ),)
        ),
      );
  }

  Widget botonDejarSeguir(BuildContext context, String userId){
    return
      ElevatedButton(
        style: raisedButtonStyle,
        onPressed: () {
          artistService.unfollowArtist(widget.userId);
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Dejó de seguir al artista'))
          );
          setState(() {
            isFollowingState = !widget.isFollowing;
          });
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ArtistProfile(userId: userdata.userId, isFollowing: isFollowingState,)),
          );
        },
        child:
        Flexible(
            child: new Text(
              "Dejar de seguir",
              style: TextStyle(
                  fontSize: 10,
                  color: Colors.white
              ),)
        ),
      );
  }

  Container PerfilDescription(){
    return
      Container(
        padding: const EdgeInsets.all(0),
        height: 40.0,
        width: double.infinity,
        child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color.fromRGBO(7, 7, 7, 1),Color.fromRGBO(24, 24, 24, 1)],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
            ),
            child:
            Container(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                child:
                new Row(
                  children: [
                    Expanded(
                        child:
                        new Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              textAlign: TextAlign.start,
                              "Somos una banda reconocida con canciones muy gozus",
                              style: TextStyle(
                                  fontSize: 10,
                                  //fontWeight: FontWeight.bold,
                                  color: Colors.white
                              ),
                            ),
                          ],
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