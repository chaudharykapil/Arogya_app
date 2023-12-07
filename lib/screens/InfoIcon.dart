import 'package:flutter/material.dart';

class InfoIcon extends StatelessWidget {
const InfoIcon({ Key? key }) : super(key: key);
  
  @override
  Widget build(BuildContext context){
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, "/about");
      },
      child:Container(
        margin: EdgeInsets.all(10),
      width: 40,
      height: 40,
      decoration: ShapeDecoration(
        color: Color(0xFFFFD69D),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(11),
        ),
        shadows: [
          BoxShadow(
            color: Color(0x3F000000),
            blurRadius: 4,
            offset: Offset(0, 4),
            spreadRadius: 0,
          )
        ],
      ),
      child: Center(child: Text(
        'i',
        style: TextStyle(
          color: Colors.black,
          fontSize: 64,
          fontFamily: 'Hurricane',
          fontWeight: FontWeight.w400,
          height: 0,
        ),
        ))
      )
    );
  }
}