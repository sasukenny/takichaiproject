import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:takichaiproject/components/comp_songcard.dart';
import '../models/mod_Song.dart';
import 'act_Login.dart';
import 'act_newSong.dart';
import '../Wrapper/wrapper.dart';
import '../components/comp_sectionTitle.dart';
import '../models/mod_User.dart';
import '../services/UserService.dart';

class MySongs extends StatefulWidget {
  const MySongs({Key? key}) : super(key: key);
  @override
  State<MySongs> createState() => _MySongsState();
}

class _MySongsState extends State<MySongs> {
  UserService userService = UserService();
  List<Song> mySongs = [];
  User userdata = User('', '', '', [], [], true, '','') ;
  String? userId;
  var logger = Logger(
    filter: null, // Use the default LogFilter (-> only log in debug mode)
    printer: PrettyPrinter(), // Use the PrettyPrinter to format and print log
    output: null, // Use the default LogOutput (-> send everything to console)
  );
  @protected
  @mustCallSuper
  initState(){
    getMySongs();
    GetUserId();
  }
  Future<void>getMySongs() async{
    logger.d("inicio de get my songs");
    userService.getMySongs().then((response) => {
      setState((){
      mySongs=response;
    })
    });
    logger.d("fin de get my songs");
  }
  Future<void> GetUserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userId = prefs.getString('userId');

    if (userId != null) {
      userService.getUserData(userId!).then((response) =>
      {
        setState(() {
          userdata = response;
        })
      }).catchError(() =>
      {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => login()),
        )
      });

    }
    else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => login()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Wrapper(activitieChild: elements());
  }
  Container elements(){
    return Container(
        height: MediaQuery.of(context).size.height,
        child:SingleChildScrollView(
            child: Column(children: [
              Row(children:[

                sectionTitle("Mis canciones subidas"),
                TextButton(
                    style: textButtonStyle,
                    onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => newSong()),
                      );
                    },
                    child: const Text(
                    " + Subir canción",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontFamily: 'Montserrat',
                    )
                )
                )
              ])
              ,
              Container(
                margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                child: ListView.builder(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                  shrinkWrap: true,
                  itemCount: mySongs.length,
                  itemBuilder: (BuildContext context, int index) {
                    return SongCard(song: mySongs[index]);
                  },
                ),
              )
            ])
        )
    );
  }

  final ButtonStyle textButtonStyle = TextButton.styleFrom(
    backgroundColor: Colors.white,
    padding: const EdgeInsets.fromLTRB(40, 15, 40, 15),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(5)),
    ),
  );
}
