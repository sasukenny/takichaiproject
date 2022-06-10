import 'dart:js';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
          icon: Icon(Icons.search),
          label: 'Buscar',
        ),
      ],
      //currentIndex: _selectedIndex,
      selectedItemColor: Colors.amber[800],
      //onTap: _onItemTapped,
    );
  }

}