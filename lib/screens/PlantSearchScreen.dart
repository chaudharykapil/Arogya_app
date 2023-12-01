import 'dart:io';
import 'dart:typed_data';
import 'package:camera/camera.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:tflite_flutter/tflite_flutter.dart' as tfl;
import 'package:image/image.dart' as imageLib;
class PlantSearchScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _plant_search_state();
  }
}
class _plant_search_state extends State<PlantSearchScreen>{
  late XFile? image;
  _plant_search_state();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    image = null;
  }
  // Image tensorBufferToImage(TensorBuffer buffer, int w, int h) {
  //   List<int> floatList = buffer.getIntList();
  //   Uint8List uint8list =
  //   Uint8List.fromList(floatList.map((f) => f.toInt()).toList());
  //
  //   int channels = 3;
  //   Image image = Image(w, h);
  //   for (int y = 0; y < h; y++) {
  //     for (int x = 0; x < w; x++) {
  //       int r = uint8list[y * w * channels + x * channels];
  //       int g = uint8list[y * w * channels + x * channels + 1];
  //       int b = uint8list[y * w * channels + x * channels + 2];
  //       image.setPixel(x, y, getColor(r, g, b));
  //     }
  //   }
  //   return image;
  // }
  // Future<void> Predict() async{
  //   final interpreter = await tfl.Interpreter.fromAsset('assets/model.tflite');
  //   final image_inp = imageLib.decodeImage(File(image!.path).readAsBytesSync());
  //   dynamic t = interpreter.getInputTensors();
  //   Object output = new Object();
  //   // interpreter.run(image_inp as Object, output);
  //   print(t[0]);
  //   return null;
  // }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("Search Plant"),elevation: 10),
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        child:image == null?
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                child:Text("Open Camrera"),
                onPressed: ()async{
                  dynamic img = await Navigator.pushNamed(context, "/camera");
                  setState(() {image = img;});
                },
              ),
              Center(child: Text("OR"),),
              ElevatedButton(
                child: Text("Upload File"),
                onPressed: ()async{
                  FilePickerResult? res = await FilePicker.platform.pickFiles(type: FileType.image);
                  if(res != null){
                    setState(() {
                      image = XFile(res.files.single.path!);
                    });
                  }
                  else{
                    setState(() {
                      image = null;
                    });
                  }
                },
              )
            ],
          ):
          Container(
            child: Column(
              children: [
                Center(
                  child: Image.file(File(image!.path)),
                ),
                ElevatedButton(onPressed: (){}, child: Text("Predict"))
              ],
            ),
          ),
      ),
    );
  }
}