import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

import '../Wrapper/wrapper.dart';
import '../components/comp_artistCard.dart';
import '../components/comp_sectionTitle.dart';
import '../models/mod_User.dart';
import '../services/UserService.dart';

class ArtistList extends StatefulWidget {
  const ArtistList({Key? key}) : super(key: key);
  @override
  State<ArtistList> createState() => _ArtistListState();
}

class _ArtistListState extends State<ArtistList> {
  List<User> allusers = [];
  List<Widget> usersCard = [];
  List<String> products = [];
  var logger = Logger(
    filter: null, // Use the default LogFilter (-> only log in debug mode)
    printer: PrettyPrinter(), // Use the PrettyPrinter to format and print log
    output: null, // Use the default LogOutput (-> send everything to console)
  );
  @protected
  @mustCallSuper
  initState() {
    GetAllUsers();
  }
  GetAllUsers() async {
    UserService userService = UserService();
    List<User> response = await userService.getAllUsers();
    //logger.d("responseq ");
    setState(()  {
      allusers = response;

    });
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
              sectionTitle("Descubre nuevos artistas"),
              ListView.builder(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                shrinkWrap: true,
                itemCount: allusers.length,
                itemBuilder: (BuildContext context, int index) {
                  return ArtistCard(artistName: allusers[index].name);
                },
              ),
            ])
        )
    );
  }


}
