import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:logger/logger.dart';
import 'package:open_file/open_file.dart';
import 'package:shared_preferences/shared_preferences.dart';

import './act_Home.dart';
import '../Wrapper/wrapper.dart';
import '../components/comp_inputText.dart';
import '../components/comp_textArea.dart';
import '../models/mod_User.dart';
import '../services/UserService.dart';
import 'act_Login.dart';

TextStyle labels = const TextStyle(
    color: Colors.white,
    fontSize: 16);

class editProfile extends StatefulWidget {
  const editProfile({Key? key}) : super(key: key);
  @override
  _editProfileState createState() => _editProfileState();
}

class _editProfileState extends State<editProfile> {

  UserService userService = UserService();

  User userdata = User('', '', '', [], [], true, '','') ;
  String? userId;
  String? token;
  @protected
  @mustCallSuper
  void initState() {
    GetUserId();
  }

  Future<void> GetUserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userId = prefs.getString('userId')!;
    if(userId!=null){
      token = prefs.getString('token');
      print("TokenEditProfile: ");
      print(token);
      userService.getUserData(userId!).then((response) => {
        setState(() {
          userdata = response;
        })
      }).catchError(()=>{
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => login()),
        )
      });
    }
    else{
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => login()),
      );
    }
  }

  //////////////////////////////////////////////////////////////////////////

  bool _publicProfile = false;
  String _imageURL = "";
  late File _img;
  String _imgBase64 = "";

  Widget _buildPublicProfile(){
    return
      FlutterSwitch(
        width: 50.0,
        height: 25.0,
        valueFontSize: 25.0,
        toggleSize: 25.0,
        value: _publicProfile,
        borderRadius: 10.0,
        padding: 8.0,
        showOnOff: true,
        onToggle: (val) {
          setState(() {
            _publicProfile = val;
          });
        },
      );
  }

  Widget _buildImage(){
    return ElevatedButton(
      child: const Text("Editar imagen de Perfil"),
      onPressed: () async {
        final response = await FilePicker.platform.pickFiles();
        if(response == null){
          return;
        }
        print("result img" );
        final imageFile = response.files.first;
        final File fileForFirebase = File(imageFile.path!);
        _img = fileForFirebase;
        OpenFile.open(imageFile.path!); //Para simulador movil cambiar bytes.toString() por path
        //OpenFile.open(imageFile.bytes.toString());

        _imageURL = imageFile.path!; //Para simulador movil cambiar bytes.toString() por path
        //_songURL = imageFile.bytes.toString()!; //Para simulador movil cambiar bytes.toString() por path
        logger.d("werty");
        List<int> fileBytes = await fileForFirebase.readAsBytes();
        _imgBase64 = base64Encode(fileBytes);
        logger.d(_imgBase64);
      },
    );
  }
  ////////////////////////////////////////////////////////////

  TextEditingController passwordController = new TextEditingController();
  TextEditingController descriptionController = new TextEditingController();
  TextEditingController publicProfileController = new TextEditingController();
  TextEditingController imageController = new TextEditingController();



  late User userRes;
  var logger = Logger(
    filter: null, // Use the default LogFilter (-> only log in debug mode)
    printer: PrettyPrinter(), // Use the PrettyPrinter to format and print log
    output: null, // Use the default LogOutput (-> send everything to console)
  );
  final _formkey = GlobalKey<FormState>();

  //build
  @override
  Widget build(BuildContext context) {
    return
      Wrapper(activitieChild: elements());
  }

  Container elements() {
    return Container(
        padding: const EdgeInsets.fromLTRB(10, 80, 10, 50),
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color.fromRGBO(24, 24, 36, 1.0),Color.fromRGBO(8, 13, 25, 1.0)],
          ),
        ),
        child:
        Form(
          key: _formkey,
          child: Column(
            children:[
              inputText(
                controller: passwordController,
                placeholder: "Editar contraseña",
                voidMessage:"Ingrese contraseña (mínimo 8 caracteres)",
                regexp: new RegExp(r'.*'),
              ),
              textArea(
                controller: descriptionController,
                placeholder: "Editar descripción...",
                voidMessage:"",
              ),

              Text("Perfil público", style: labels),
              Container(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                child:_buildPublicProfile(),
              ),
              Text(" ", style: labels),
              Container(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                child:_buildImage(),
              ),
              Container(
              padding: EdgeInsets.all(35),
              child: ElevatedButton(
                style: raisedButtonStyle,
                child: Text(
                  "Registrar cambios",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontFamily: 'Montserrat',
                ),
              ),
              onPressed: ()
              async {
                try{
                  userRes = await userService.EditProfile(
                    passwordController.text,
                    descriptionController.text,
                    publicProfileController.text,
                      _imgBase64,
                    token,
                    userId
                  );
                  SharedPreferences prefs = await SharedPreferences.getInstance();
                  logger.d("Debug log");
                  logger.d(prefs.getString('userID'));
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Home()),
                  );
                }
                catch (e){
                    print(e);
                }
              },
              ),
              ),
              Container(
                  margin: EdgeInsets.only(top: 15),
                  padding: EdgeInsets.fromLTRB(0,10,0,10),
                  child: InkWell(
                    child: const Text('Volver a Home',style: TextStyle(color: Colors.white)),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const Home()),);
                    },
                  )
              )
            ],
          )
        )
      );
  }
  final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
    primary: Colors.black87,
    onPrimary: Colors.grey[300],
    padding: EdgeInsets.fromLTRB(40, 15, 40, 15),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(5)),
    ),
    side: BorderSide(width: 1.5, color: Color.fromRGBO(255, 255, 255, 0)),
  );
}