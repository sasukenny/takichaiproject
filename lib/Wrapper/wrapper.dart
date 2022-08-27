import 'dart:ui';

import 'package:flutter/material.dart';

import '../activities/act_Login.dart';
import '../activities/act_Profile.dart';
import '../components/comp_bottomNavBar.dart';
import '../services/UserService.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({Key? key, required this.activitieChild}) : super(key: key);
  final Widget activitieChild;
  @override
  State<Wrapper> createState() => _HomeState();
}

class _HomeState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
  
    return WillPopScope(
        onWillPop: ()async{
          print('s');
          return false;
        },
        child: Scaffold(
          backgroundColor: Color.fromRGBO(24, 24, 24, 1),
          appBar:       AppBar(
              leading: Container(
                  margin: const EdgeInsets.only(left: 15),
                  child:IconButton(
                      icon: Icon(Icons.arrow_back_ios , color: Colors.white),
                      onPressed:  () => Navigator.of(context).pop()
                  )
              ),

              title: Center(child:Text("Takichai", style:
              TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white
              ))),
              actions: myActions(),
              backgroundColor: Color.fromRGBO(7, 7, 7, 1.0)
          ),
          body: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color.fromRGBO(24, 24, 36, 1.0),Color.fromRGBO(8, 13, 25, 1.0)],
              ),
            ),
            child: widget.activitieChild,
          ),
          bottomNavigationBar: bottomNavBar(),
        )
    );
  }

  List<Widget> myActions(){
    return <Widget>[
      Row(
        children: [
          IconButton(
            color: Color.fromRGBO(255, 255, 255, 1),
            padding: EdgeInsets.all(0),
            icon: const Icon(Icons.upload_sharp),
            tooltip: 'Show Snackbar',
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('This is a snackbar')));
            },
          ),
        ],
      ),
      PopupMenuButton<int>(
        color: Color.fromRGBO(255, 255, 255, 1),
        icon: const Icon( Icons.more_vert , color: Colors.white),
        onSelected: (item)=>onSelected(context,item),
        itemBuilder: (context) => [
          PopupMenuItem<int>(
              value: 0,
              child: Text('Mi Perfil')
          ),
          PopupMenuItem<int>(
              value: 1,
              child: Text('Cerrar Sesión')

          ),
        ],
      ),
    ];
  }
  void onSelected(BuildContext context, int item ){
    UserService userService = UserService();
    switch (item){
      case 0:
        print('Mi perfil');
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Profile(title: 'Mi perfil',)));
        break;
      case 1:
        print('cerrando sesion');
        userService.LogoutUser();
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>login()));
        break;

    }
  }


}