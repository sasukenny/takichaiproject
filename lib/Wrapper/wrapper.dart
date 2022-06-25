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
          body: Container(

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
          /*
          Text(
            'Subir una canción',
          ),*/
          IconButton(
            padding: EdgeInsets.all(0),
            icon: const Icon(Icons.download_sharp),
            tooltip: 'Show Snackbar',
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('This is a snackbar')));
            },
          ),
        ],
      ),

      /*
      IconButton(
        icon: const Icon(Icons.more_vert),
        tooltip: 'Go to the next page',
        onPressed: () {
          Navigator.push(context, MaterialPageRoute<void>(
            builder: (BuildContext context) {
              return Scaffold(
                appBar: AppBar(
                  title: const Text('Next page'),
                ),
                body: const Center(
                  child: Text(
                    'This is the next page',
                    style: TextStyle(fontSize: 24),
                  ),
                ),
              );
            },
          ));
        },
      ),
    */
      PopupMenuButton<int>(
        onSelected: (item)=>onSelected(context,item),
        itemBuilder: (context) => [
          PopupMenuItem<int>(
              value: 0,
              child: Text('Mi perfil')
          ),
          PopupMenuItem<int>(
              value: 1,
              child: Text('cerrar sesión')
          ),
        ],
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