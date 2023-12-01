import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

class CameraScreen extends StatefulWidget{
  CameraDescription _camera;
  CameraScreen(this._camera, {super.key});
  @override
  State<StatefulWidget> createState() {
    return _camera_screen();
  }
}
class _camera_screen extends State<CameraScreen>{
  late CameraController _controller;
  late Future _init_camera;
  @override
  void initState() {
    super.initState();
    _controller = CameraController(widget._camera, ResolutionPreset.max);
    _init_camera = _controller.initialize();

  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("Search Plant"),),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: ElevatedButton(
        child: Icon(Icons.camera),
        onPressed: ()async{
          XFile image = await _controller.takePicture();
          Navigator.pop(context,image);
        },
      ),
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        child: FutureBuilder<void>(
          future: _init_camera,
          builder: (context,snapshot){
            if(snapshot.connectionState == ConnectionState.done){
              return CameraPreview(_controller);
            }
            else{
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}