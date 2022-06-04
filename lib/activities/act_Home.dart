import 'package:flutter/material.dart';
import '../components/comp_card.dart';

class Home extends StatefulWidget {
  const Home({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
    Container FristComponent = component1(titulo: 'Descubre', flexText: 7, img: "assets/images/heart.png");
    Container SecondComponent = component1(titulo: 'Mis favoritos', flexText: 9);
    Container ThirdComponent = component1(titulo: 'Sube tu música', flexText: 9);
    Container FourthComponent = component1(titulo: 'Sobre TakiChai', flexText: 7);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(

        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              const Text(
                'Bienvenido Xocrona!!',
                style: TextStyle(
                  //color: Colors.white,
                  fontSize: 24,
                  fontFamily: 'Montserrat',
                ),
              ),
              /*
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),*/
              new Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  FristComponent,
                  Container(
                      margin: const EdgeInsets.all(1.0),
                      padding: const EdgeInsets.all(1.0),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.blueAccent)
                      ),
                      child:
                      new Row(
                        children: [
                          Expanded(
                            flex: 5,
                            child:
                            SecondComponent,
                          ),
                          Expanded(
                            flex: 5,
                            child:
                            ThirdComponent,
                          ),
                        ],
                      )
                  ),
                  FourthComponent,
                ],
              ),
            ]
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

}