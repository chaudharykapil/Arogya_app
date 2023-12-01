import 'package:ayu_care/screens/CameraScreen.dart';
import 'package:ayu_care/screens/MainScreen.dart';
import 'package:ayu_care/utils/CameraHandler.dart';
import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:page_transition/page_transition.dart';
void main(){
  CameraHandler().init();
  runApp(
      MyApp()
  );
}

class MyApp extends StatelessWidget {
  MyApp({super.key}){
  }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme:ThemeData(useMaterial3: true),
      // home: AnimatedSplashScreen(
      //   duration: 3000,
      //   splash: MySplash(),
      //   splashTransition: SplashTransition.slideTransition,
      //   pageTransitionType: PageTransitionType.fade,
      //   backgroundColor: Colors.black, nextScreen: MainScreen(),),
      initialRoute: "/main",
      routes: {
        "/main":(context)=>MainScreen(),
        "/camera":(context)=>CameraScreen(CameraHandler().getBackCamera())
      },
    );
  }
}
class MySplash extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(

      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/image/bg_splash.jpg"),
          fit: BoxFit.fitHeight
        )
      ),
      child: null,
    );
  }
}