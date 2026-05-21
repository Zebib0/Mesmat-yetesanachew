import 'package:flutter/material.dart';

const bgColor = Color(0xff00A67E);
const textColor = Color(0xffFEFDFC);
const dark = Color(0xFF1E1E2C);



final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primarySwatch: Colors.blue,
  backgroundColor: Colors.white,

);

final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primarySwatch: Colors.blue,
  backgroundColor: Colors.black,
  appBarTheme: const AppBarTheme(
    elevation: 0.0,
    centerTitle: true,
    color: Colors.black,
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.normal,
    ),
  ),
);
