import 'package:flutter/material.dart';
import '../activities/act_Home.dart';
import '../components/comp_bottomNavBar.dart';
import '../components/comp_card.dart';

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
        title: Text(widget.title),
        backgroundColor: Color.fromRGBO(55, 0, 0, 0.5),

      ),
      //body: const Home(title: 'Now Playing'),
      body: widget.activitieChild,
      /*
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), */// This trailing comma makes auto-formatting nicer for build methods.
      bottomNavigationBar: bottomNavBar(),
    );
  }

}