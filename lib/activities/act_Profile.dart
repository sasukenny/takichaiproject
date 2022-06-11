import 'package:flutter/material.dart';
import '../Wrapper/wrapper.dart';

class Profile extends StatefulWidget {
const Profile({Key? key, required this.title}) : super(key: key);

final String title;

@override
State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  @override
  Widget build(BuildContext context) {
    return
      Wrapper(title: widget.title, activitieChild: elements());
  }
  Container elements(){
    return Container();
  }
}