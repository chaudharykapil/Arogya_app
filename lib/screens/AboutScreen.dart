import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
const AboutScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text("About Us"),elevation: 10,backgroundColor: Color.fromRGBO(255, 227, 181, 1),),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            Center(child: Text("About Us",style: TextStyle(fontFamily: "Anton",fontSize: 30,letterSpacing: 1.97),),),
            Container(
              width: double.maxFinite,
              height: 6,
              margin: EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(color: Colors.black),
            ),
            Container(
              padding: EdgeInsets.all(20),
              child:Center(
                child: Text(
                  "We're on a mission to empower individuals and communities with accessible, sustainable healthcare solutions. Our app combines plant identification with personalized health suggestions making natural remedies readily available. We value accessibility, sustainability, personalized care and community building. Our goal is to improve health outcomes reduce reliance on expensive medication and promote sustainable healthcare practices.",
                  style: TextStyle(fontFamily: "Iceberg",fontSize: 20),
                ),
              )
            ),
            Center(child:Text("Join us and discover power of Ayurveda.",style: TextStyle(fontFamily: "Iceberg",fontSize: 20),))
          ],
        ),
      ),
    );
  }
}