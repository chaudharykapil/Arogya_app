import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class CameraHandler{
  static late  List<CameraDescription> _camera;
  static dynamic _backcamera;
  CameraHandler(){
  }
  void init() async{
    WidgetsFlutterBinding.ensureInitialized();
    if(await Permission.camera.isDenied){
      await Permission.camera.request();
      if(await Permission.camera.isGranted){
        _camera = await availableCameras();
      }
    }
    else if(await Permission.camera.isGranted){
      _camera = await availableCameras();
    }

  }
  void list_allCamera() async {
    if(await Permission.camera.isDenied){

      return;
    }
    _camera = await availableCameras();
    for(CameraDescription x in _camera){
      print(x);
    }
  }
  CameraDescription getBackCamera(){
    return _camera[0];
  }
  CameraDescription getFrontCamera(){
    return _camera[1];
  }

}