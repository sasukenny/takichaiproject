import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../activities/act_Profile.dart';

class TakichayAppbar extends StatefulWidget {
  const TakichayAppbar({Key? key, required this.title, PreferredSizeWidget? bottom}) : super(key: key);

  final String title;

  @override
  State<TakichayAppbar> createState() => _TakichayAppbarState();
}

class _TakichayAppbarState extends State<TakichayAppbar> {

  @override
  Widget build(BuildContext context) {

    return
      AppBar(
          leading: Container(
              margin: const EdgeInsets.only(left: 15),
              child:IconButton(
                  icon: Icon(Icons.arrow_back_ios , color: Colors.black),
                  onPressed:  () => Navigator.of(context).pop()
              )
          ),
          title: Center(child:Text(widget.title, style: TextStyle(fontWeight: FontWeight.bold))),
          actions: myActions(),
          backgroundColor: Color(0xFFE5E5E5)
      );

  }
  List<Widget> myActions(){
    return <Widget>[
      Container(
          margin: const EdgeInsets.only(right: 15),
          child:PopupMenuButton<int>(
            onSelected: (item)=>onSelected(context,item),
            itemBuilder: (context) => [
              const PopupMenuItem<int>(
                  value: 0,
                  child: Text('Mi perfil')
              ),
              const PopupMenuItem<int>(
                  value: 1,
                  child: Text('cerrar sesión')
              ),
            ],
          )
      ),
    ];
  }
  void onSelected(BuildContext context, int item ){
    switch (item){
      case 0:
        print('Mi perfil');
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Profile(title: 'Mi perfil',)));
        break;
      case 1:
        print('cerrando sesion');
        break;

    }
  }
}
