import 'package:flutter/material.dart';
import '../components/comp_bottomNavBar.dart';
import '../components/comp_TakichayAppbar.dart';
import '../activities/act_Profile.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({Key? key, required this.title, required this.activitieChild}) : super(key: key);
  final String title;
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
          backgroundColor: Color(0xFFE5E5E5),
          appBar:       AppBar(
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
          ),
          body: widget.activitieChild,
          bottomNavigationBar: bottomNavBar(),
        )
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