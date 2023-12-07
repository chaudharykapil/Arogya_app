import 'dart:convert';

import 'package:ayu_care/Constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; 
class DiseaseSearchScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _medical_search_state();
  }
}

class _medical_search_state extends State<DiseaseSearchScreen>{
  List <String> symptoms = SymptomMapping.keys.toList();
  List <String> curr_symp = [];
  String? ans;
  String suggetion = "# You can find medication in “Search Medicine”. \n# Consult Your doctor in any severe condition.";
  bool is_start = false;
  _medical_search_state(){
    curr_symp = [symptoms.first,symptoms.first,symptoms.first,symptoms.first];
    ans = null;
  }
  void Analyse()async{
    print("input");
    print(curr_symp);
    is_start = true;
    setState(() {});
    http.Response res =  await http.post(
        Uri.parse(disease_uri),
        body:jsonEncode(curr_symp),
        encoding: Encoding.getByName("utf-8"),
        headers: {"Accept": "application/json", "Content-Type": "application/json"}
    );
    ans = json.decode(res.body)["res"];
    is_start = false;
    setState(() {});

  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("Search Disease"),elevation: 10,backgroundColor: Color.fromRGBO(255, 227, 181, 1),),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/icons/page_3_bg.jpg"),opacity: 1)
        ),
        width: double.maxFinite,
        height: double.maxFinite,
        child: Column(

          children: [
            Container(
              padding: EdgeInsets.all(30),
              width: double.maxFinite,
              child: Center(child: Text("Select Symptoms",style: TextStyle(fontSize: 27,fontFamily: "Anton",letterSpacing: 1.97)),),
            ),
            DropdownButton(
              style: TextStyle(fontFamily: "Iceberg",fontSize: 25,color: Colors.black),
              value: curr_symp.elementAt(0),
                items: symptoms.map((e) => DropdownMenuItem(value:e , child: Text(e.toString()))).toList(),
                onChanged: (String? value){
                  curr_symp[0] = value??"";
                    setState(() {});
                },
            ),
            DropdownButton(
              style: TextStyle(fontFamily: "Iceberg",fontSize: 25,color: Colors.black),
              value: curr_symp.elementAt(1),
              items: symptoms.map((e) => DropdownMenuItem(value:e , child: Text(e.toString()))).toList(),
              onChanged: (String? value){
                curr_symp[1] = value??"";
                setState(() {});
              },
            ),
            DropdownButton(
              style: TextStyle(fontFamily: "Iceberg",fontSize: 25,color: Colors.black),
              value: curr_symp.elementAt(2),
              items: symptoms.map((e) => DropdownMenuItem(value:e , child: Text(e.toString()))).toList(),
              onChanged: (String? value){
                curr_symp[2] = value??"";
                setState(() {});
              },
            ),
            DropdownButton(
              style: TextStyle(fontFamily: "Iceberg",fontSize: 25,color: Colors.black),
              value: curr_symp.elementAt(3),
              items: symptoms.map((e) => DropdownMenuItem(value:e , child: Text(e.toString()))).toList(),
              onChanged: (String? value){
                curr_symp[3] = value??"";
                setState(() {});
              },
            ),
            Container(
              padding: EdgeInsets.all(30),
                child: InkWell(
                  child: Image.asset("assets/icons/ana_button.png"),
                  onTap: (){Analyse();},
                )
            ),
            Container(
              child: ans!=null?Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(child: Text("Probable Disease: ",style: TextStyle(fontSize: 25,fontFamily: "Iceberg"),),),
                  Center(child: Text(ans!,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25,fontFamily: "Iceberg"),),),
                  Center(
                    child: Container(
                      child: Text(suggetion,style:TextStyle(fontSize: 15,fontFamily: "Iceberg")),
                    ),
                  )
                ],
              ):is_start?CircularProgressIndicator():null,
            )
          ]
        ),
      ),
    );
  }
}