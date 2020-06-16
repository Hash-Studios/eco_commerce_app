import 'package:flutter/material.dart';
import 'package:eco_commerce_app/ui/theme/config.dart' as config;

var kDefaultTheme = ThemeData(
  primaryColor: Colors.white,
  brightness: Brightness.light,
  accentColor: config.Colors().accentColor(1),
  focusColor: config.Colors().secondColor(1),
  hintColor: config.Colors().accentColor(1),
  accentTextTheme: TextTheme(headline6: TextStyle(fontFamily: "Poppins")),
  textTheme: TextTheme(
    button: TextStyle(
      fontFamily: 'Poppins',
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: Color(0xFFFFFFFF),
    ),
    headline5: TextStyle(
      fontSize: 20.0,
      color: config.Colors().mainColor(1),
      fontFamily: "Poppins",
    ),
    headline4: TextStyle(
      fontFamily: 'Roboto',
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: config.Colors().secondColor(1),
    ),
    headline3: TextStyle(
      fontFamily: 'Poppins',
      fontSize: 22,
      fontWeight: FontWeight.bold,
      color: config.Colors().accentColor(1),
    ),
    headline2: TextStyle(
      fontSize: 25,
      fontFamily: "Poppins",
      fontWeight: FontWeight.w700,
      color: config.Colors().mainColor(1),
    ),
    headline1: TextStyle(
      fontFamily: 'Poppins',
      color: Colors.white,
      fontSize: 50,
      fontWeight: FontWeight.w600,
    ),
    subtitle1: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w900,
      color: config.Colors().secondColor(1),
      fontFamily: "Roboto",
    ),
    headline6: TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.w600,
      color: config.Colors().mainColor(1),
      fontFamily: "Poppins",
    ),
    bodyText2: TextStyle(
        fontFamily: 'Poppins',
        color: config.Colors().mainColor(1),
        fontSize: 14),
    bodyText1: TextStyle(
      fontFamily: 'Poppins',
      fontSize: 36,
      fontWeight: FontWeight.w400,
      color: config.Colors().accentColor(1),
    ),
    caption: TextStyle(
      fontFamily: 'Roboto',
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: config.Colors().accentColor(1),
    ),
  ),
);
