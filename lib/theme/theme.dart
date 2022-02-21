import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Themes {
  static final light = ThemeData.light().copyWith(
    backgroundColor: Colors.white,
    buttonColor: Color(0xffd08400),
    primaryColor: Color(0xffd08400),
    textTheme: const TextTheme(
      headline1: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold,color: Colors.black),
      headline6: TextStyle(fontSize: 12.0,color: Color(0xffd08400)),
      headline4: TextStyle(fontSize: 14.0,color: Color(0xffadadab),fontWeight: FontWeight.w600),
      headline5: TextStyle(fontSize: 16.0,color: Color(0xffd08400),fontWeight: FontWeight.w600),

    ),

  );
  static final dark = ThemeData.dark().copyWith(
    backgroundColor: Colors.black,
    buttonColor: Colors.black,
    primaryColor: Colors.white,
    textTheme: const TextTheme(
      headline1: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold,color: Colors.white),
      headline6: TextStyle(fontSize: 12.0,color: Colors.white),
      headline4: TextStyle(fontSize: 14.0,color: Colors.white,fontWeight: FontWeight.w600),
      headline5: TextStyle(fontSize: 16.0,color: Colors.white,fontWeight: FontWeight.w600),


    ),
  );
}