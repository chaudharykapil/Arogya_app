import 'package:ayu_care/screens/CameraScreen.dart';
import 'package:ayu_care/utils/CameraHandler.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget{
  HomeScreen({super.key});
  @override
  State<StatefulWidget> createState() {
    return _home_state();
  }
}
class _home_state extends State<HomeScreen>{
  _home_state();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home"),elevation: 10,),
      body: Container(

      ),
    );
  }
}