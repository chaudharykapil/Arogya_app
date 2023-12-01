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
      bottomNavigationBar: NavigationBar(
        destinations: [
          //NavigationDestination(icon: Icon(Icons.home), label: "Home"),
          NavigationDestination(icon: Icon(Icons.energy_savings_leaf), label: "Search Plant"),
          NavigationDestination(icon: Icon(Icons.coronavirus), label: "Search Disease"),
          NavigationDestination(icon: Icon(Icons.medication), label: "Search Medicine")
        ],
        selectedIndex: curr_page,
        onDestinationSelected: (c){setState(() {
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