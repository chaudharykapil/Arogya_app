import 'package:ayu_care/screens/HomeScreen.dart';
import 'package:ayu_care/screens/DiseaseSearchScreen.dart';
import 'package:ayu_care/screens/MedicineSearchScreen.dart';
import 'package:ayu_care/screens/PlantSearchScreen.dart';
import 'package:flutter/material.dart';
class MainScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MainScreenState();
  }

}
class MainScreenState extends State<MainScreen>{
  late int curr_page;
  MainScreenState(){
    curr_page = 0;
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(child: Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color.fromARGB(255, 253, 190, 1), // <-- This works for fixed

        items: [
          //NavigationDestination(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon:  Image.asset("assets/icons/search_plant.png",height: 50,width: 50,), label: "Search Plant"),
          BottomNavigationBarItem(icon: Image.asset("assets/icons/search disease.png",height: 50,width: 50,), label: "Search Disease"),
          BottomNavigationBarItem(icon: Image.asset("assets/icons/search medicine.png",height: 50,width: 50,), label: "Search Medicine")
        ],
        currentIndex: curr_page,
        onTap: (c){setState(() {
          curr_page = c;
        });},
      ),
      body: <Widget>[
        //HomeScreen(),
        PlantSearchScreen(),
        DiseaseSearchScreen(),
        MedicineSearchScreen()

      ][curr_page],
    ));
  }
}