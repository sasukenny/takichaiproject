import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../activities/act_Home.dart';
import '../activities/act_myFavoriteArtists.dart';
import '../activities/act_myFavoriteSongs.dart';
class bottomNavBar extends StatelessWidget{
  const bottomNavBar({Key? key,
    }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(

      backgroundColor: Color.fromRGBO(7, 7, 7, 1.0),
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
          label: 'Suscripciones',
        ),
      ],
      //currentIndex: _selectedIndex,
      unselectedItemColor:  Colors.white,
      selectedItemColor: Color.fromRGBO(26, 115, 232, 1),
      onTap: (item)=>_onItemTapped(context,item),
    );
  }
  void _onItemTapped(BuildContext context, int index) {
    print("object");
    switch (index){
      case 0:
        print('Mi perfil');
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Home()));
        break;
      case 1:
        print('MyFavoriteSongs ');
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>MyFavoriteSongs(title: 'Mis Canciones Favoritas',)));
        break;
      case 2:
        print('MyFavoriteArtist ');
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>MyFavoriteArtist()));
        break;
      case 3:
        print('cerrando sesion 3');
        break;
    }
  }
}