import 'package:flutter/material.dart';



/// Custom Container Style
class ContainerStyle {
  static BoxDecoration borderContainer(
      {bool isBorder = false, Color color = Colors.white}){
    return BoxDecoration(
      //        border:  Border.all(color: Colors.orange),
        color: color,
        shape: BoxShape.rectangle,


        borderRadius: const BorderRadius.only(
            topRight: Radius.circular(20),
            bottomRight: Radius.circular(10),
            topLeft: Radius.circular(20),
            bottomLeft: Radius.circular(10)
        ),

        boxShadow: [
          BoxShadow(
              color: Color(0xFFB7B7B7).withOpacity(0.4),
              spreadRadius: 0,
              blurRadius: 10,
              offset: Offset(0, 0) // changes position of shadow
          ),
        ]
    );
  }

  static BoxDecoration wholeBorderRoundedContainer(
      {bool isBorder = false, Color color = Colors.white}) {
    return BoxDecoration(
      //        border:  Border.all(color: Colors.orange),
        color: color,
        shape: BoxShape.rectangle,


        borderRadius: const BorderRadius.only(
            topRight: Radius.circular(20),
            bottomRight: Radius.circular(20),
            topLeft: Radius.circular(20),
            bottomLeft: Radius.circular(20)
        ),

        boxShadow: [
          BoxShadow(
              color: Color(0xFFB7B7B7).withOpacity(0.4),
              spreadRadius: 0,
              blurRadius: 30,
              offset: Offset(0, 4) // changes position of shadow
          ),
        ]
    );
  }

 }


