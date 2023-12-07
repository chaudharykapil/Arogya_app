import 'dart:io';
import 'package:ayu_care/Constants.dart';
import 'package:ayu_care/screens/InfoIcon.dart';
import 'package:camera/camera.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image/image.dart' as imageLib;
import 'package:http/http.dart' as http;
class PlantSearchScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _plant_search_state();
  }
}
class _plant_search_state extends State<PlantSearchScreen>{
  late XFile? image;
  String? image_res = "";
  _plant_search_state();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    image = null;
  }
  
  void Predict() async{
    image_res = null;
    setState(() {});
    Uri url = Uri.parse(image_pred_uri);
    http.MultipartRequest request = http.MultipartRequest("POST", url);
    request.files.add(http.MultipartFile.fromBytes("image", File(image!.path).readAsBytesSync(),filename: image!.path));
    //http.Response res = await http.post(url,body: {});
    http.StreamedResponse stream  = await request.send();
    http.Response res = await http.Response.fromStream(stream);
    print(res.body);
    image_res = res.body;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("Search Plant"),elevation: 10,backgroundColor: Color.fromRGBO(255, 242, 222, 1),actions: <Widget>[InfoIcon()]),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/icons/page_2bg.png"),opacity: 0.2)
        ),
        height: double.maxFinite,
        width: double.maxFinite,
        child:image == null?
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              
              InkWell(
                child:SizedBox(
                  child: Image.asset("assets/icons/camera.png",scale: 0.8,),
                ),
                onTap: ()async{
                  dynamic img = await Navigator.pushNamed(context, "/camera");
                  setState(() {image = img;});
                },
              ),
              
              Center(child: Text("Open Camera",style: TextStyle(fontFamily: "Iceberg",fontSize: 25),),),

              InkWell(
                child:SizedBox(
                  child: Image.asset("assets/icons/badaal.png",scale: 0.8,),
                ),onTap: ()async{
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
              ),
              Center(child: Text("Upload File",style: TextStyle(fontFamily: "Iceberg",fontSize: 25)),)
            ],
          ):
          Container(
            child: Column(
              children: [
                Center(
                  child: Container(
                    height: 400,
                    child: Image.file(File(image!.path)),
                  )
                ),
                ElevatedButton(onPressed: (){Predict();}, child: Text("Predict")),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  child: image_res == null?
                  CircularProgressIndicator()
                  : Text(
                    "Result: " + image_res!,
                    style: TextStyle(
                      fontSize: 25,
                      fontFamily: "Iceberg"
                    ),
                    
                  ),
                )
              ],
            ),
          ),
      ),
    );
  }
}