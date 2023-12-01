import 'dart:convert';

import 'package:ayu_care/Constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class MedicineSearchScreen  extends StatefulWidget{
  //disease , age, gender, severity
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _medicine_search_state();
  }

}
class _medicine_search_state extends State<MedicineSearchScreen>{
  List<String> inputs = [];
  List<String> gend = gender.keys.toList();
  List<String> dis = diseases.keys.toList();
  List<String> sever = severity.keys.toList();
  String ? ans;
  _medicine_search_state(){
    inputs = [dis.first,"0",gend.first,sever.first];
    ans = null;

  }
  void Analysis()async{
    List<String> ip = ["","","",""];
    ip[0] = diseases[inputs[0]]!;
    ip[1] = inputs[1]!;
    ip[2] = gender[inputs[2]]!;
    ip[3] = severity[inputs[3]]!;
    print(ip);
    http.Response res =  await http.post(
        Uri.parse(med_uri),
        body:jsonEncode(ip),
        encoding: Encoding.getByName("utf-8"),
        headers: {"Accept": "application/json", "Content-Type": "application/json"}
    );
    ans = json.decode(res.body)["res"];
    setState(() {});
    print(ans);
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
                child: Center(child: Text("Enter Required detail",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),)
            ),
            DropdownButton(
                value: inputs[0],
                items: dis.map((e){
                  return DropdownMenuItem(value: e,child: Text(e));
                }).toList(),
                onChanged: (String? v){
                  inputs[0] = v!;
                  setState(() {});
                }
            ),
            SizedBox(
              width: 130,
              child: TextField(
                decoration: InputDecoration(hintText: "Age"),
                keyboardType: TextInputType.number,
                onChanged: (String v){
                  inputs[1] = v;
                  setState(() {});
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: DropdownButton(
                  value: inputs[2],
                  items: gend.map((e){
                    return DropdownMenuItem(value: e,child: Text(e));
                  }).toList(),
                  onChanged: (String? v){
                    inputs[2] = v!;
                    setState(() {});
                  }
              ),
            ),
            DropdownButton(
                value: inputs[3],
                items: sever.map((e){
                  return DropdownMenuItem(value: e,child: Text(e));
                }).toList(),
                onChanged: (String? v){
                  inputs[3] = v!;
                  setState(() {});
                }
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: ElevatedButton(onPressed: (){ Analysis(); },child: Text("Analysis")),
            ),
            Container(
              child: ans!=null?Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(child: Text("Suggested Medicine: ",style: TextStyle(fontSize: 15),),),
                  Center(child: Text(ans!,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),),
                ],
              ):null,
            )
          ],
        ),
      ),

    );
  }
}