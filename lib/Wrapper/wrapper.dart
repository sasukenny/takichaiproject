import 'package:flutter/material.dart';
import '../activities/act_Profile.dart';
import '../components/comp_bottomNavBar.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({Key? key, required this.title, required this.activitieChild}) : super(key: key);
  final String title;
  final Widget activitieChild;

  @override
  State<Wrapper> createState() => _HomeState();
}

class _HomeState extends State<Wrapper> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {

    return WillPopScope(
        onWillPop: ()async{
          print('s');
          return false;
        },
        child: Scaffold(
          backgroundColor: Color(0xFFE5E5E5),
          //backgroundColor: Color(0xFF0B0C0E),
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios , color: Colors.white),
              onPressed:  () => Navigator.of(context).pop() ),
            //title: Text(widget.title, style: TextStyle(fontWeight: FontWeight.bold),),
            title: Text( 'TakiChai', style: TextStyle(fontWeight: FontWeight.bold),),
            actions: myActions(),
            backgroundColor: Color.fromRGBO(225, 225, 255, 0.5),

          ),
          body: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color.fromRGBO(41, 44, 45, 1.0),Color.fromRGBO(18, 23, 26, 1.0)],
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