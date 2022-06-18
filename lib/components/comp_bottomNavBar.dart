import 'dart:js';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../activities/act_Home.dart';
import '../activities/act_myFavoriteSongs.dart';
class bottomNavBar extends StatelessWidget{
  //attributes
  //final String titulo;
  //final int flexText;
  //final String img;
  //final StatefulWidget newRoute;
  //constructor
  const bottomNavBar({Key? key,
    //this.img = "",
    //required this.titulo,
    //required this.flexText,
    //required this.newRoute}) : super(key: key);
    }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Inicio',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.star),
          label: 'Favoritos',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_box_outlined),
          label: 'Mis artistas',
        ),
      ],
      //currentIndex: _selectedIndex,
      selectedItemColor: Colors.amber[800],
      onTap: (item)=>_onItemTapped(context,item),
    );
  }
  void _onItemTapped(BuildContext context, int index) {
    print("object");
    switch (index){
      case 0:
        print('Mi perfil');
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Home(title: 'Takichai',)));
        break;
      case 1:
        print('MyFavoriteSongs ');
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>MyFavoriteSongs(title: 'Takichai',)));
        break;
      case 2:
        print('cerrando sesion 2');
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Home(title: 'Takichai',)));
        break;
      case 3:
        print('cerrando sesion 3');
        break;
    }
  }
}