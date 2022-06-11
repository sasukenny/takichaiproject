import 'package:flutter/material.dart';
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

    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back_ios , color: Colors.white,),
        title: Text(widget.title),
        actions: myActions(),
        backgroundColor: Color.fromRGBO(55, 0, 0, 0.5),

      ),
      body: widget.activitieChild,
      bottomNavigationBar: bottomNavBar(),
    );
  }
  List<Widget> myActions(){
    return <Widget>[
      IconButton(
        icon: const Icon(Icons.add_alert),
        tooltip: 'Show Snackbar',
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('This is a snackbar')));
        },
      ),
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
      PopupMenuButton<int>(
        itemBuilder: (context) => [
          PopupMenuItem<int>(
              value: 1,
              child: Text('Mi cuenta')
          ),
          PopupMenuItem<int>(
              value: 1,
              child: Text('cerrar sesión')
          ),
        ],
      ),
    ];
  }
}