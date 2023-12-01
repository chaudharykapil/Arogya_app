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
  _medical_search_state(){
    curr_symp = [symptoms.first,symptoms.first,symptoms.first,symptoms.first];
    ans = null;
  }
  void Analyse()async{
    print("input");
    print(curr_symp);
    http.Response res =  await http.post(
        Uri.parse(disease_uri),
        body:jsonEncode(curr_symp),
        encoding: Encoding.getByName("utf-8"),
        headers: {"Accept": "application/json", "Content-Type": "application/json"}
    );
    ans = json.decode(res.body)["res"];
    setState(() {});

  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("Search Medicine"),elevation: 10,),
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Column(

          children: [
            Container(
              padding: EdgeInsets.all(20),
              width: double.maxFinite,
              child: Center(child: Text("Select Symptoms",style: TextStyle(fontSize: 20,fontWeight:FontWeight.bold)),),
            ),
            DropdownButton(
              value: curr_symp.elementAt(0),
                items: symptoms.map((e) => DropdownMenuItem(value:e , child: Text(e.toString()))).toList(),
                onChanged: (String? value){
                  curr_symp[0] = value??"";
                    setState(() {});
                },
            ),
            DropdownButton(
              value: curr_symp.elementAt(1),
              items: symptoms.map((e) => DropdownMenuItem(value:e , child: Text(e.toString()))).toList(),
              onChanged: (String? value){
                curr_symp[1] = value??"";
                setState(() {});
              },
            ),
            DropdownButton(
              value: curr_symp.elementAt(2),
              items: symptoms.map((e) => DropdownMenuItem(value:e , child: Text(e.toString()))).toList(),
              onChanged: (String? value){
                curr_symp[2] = value??"";
                setState(() {});
              },
            ),
            DropdownButton(
              value: curr_symp.elementAt(3),
              items: symptoms.map((e) => DropdownMenuItem(value:e , child: Text(e.toString()))).toList(),
              onChanged: (String? value){
                curr_symp[3] = value??"";
                setState(() {});
              },
            ),
            Container(
              padding: EdgeInsets.all(10),
                child: ElevatedButton(onPressed: (){Analyse();}, child: Text("Analyse"),)
            ),
            Container(
              child: ans!=null?Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(child: Text("Predictive Disease: ",style: TextStyle(fontSize: 15),),),
                  Center(child: Text(ans!,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),),
                ],
              ):null,
            )
          ]
        ),
      ),
    );
  }
}