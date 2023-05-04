import 'package:first_app/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';

ThemeData lightTheme = ThemeData(
  primarySwatch: Colors.deepOrange,
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: const AppBarTheme(
    color: Colors.redAccent,
    elevation: 5.0,
    titleTextStyle: TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 20.0,
      color: Colors.white,
    ),
    iconTheme: IconThemeData(
        color: Colors.black
    ),
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
    ),
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: defaultColor,
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    selectedItemColor: defaultColor,
    unselectedItemColor: Colors.grey,
    backgroundColor: Colors.white,
    elevation: 20.0,

  ),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(
      fontSize: 20.0,
      color: Colors.black,
    ),
  ),
  fontFamily: 'Jannah',
);

ThemeData darkTheme = ThemeData(
  scaffoldBackgroundColor: HexColor('343232'),
  primarySwatch: Colors.deepOrange,
  appBarTheme:  AppBarTheme(
    backgroundColor: HexColor('343232'),
    elevation: 0.0,
    titleTextStyle: const TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 30.0,
      color: Colors.white,
    ),
    iconTheme: const IconThemeData(
        color: Colors.white
    ),
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: HexColor('343232'),
      statusBarIconBrightness: Brightness.light,
    ),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    selectedItemColor: defaultColor,
    unselectedItemColor: Colors.grey,
    selectedLabelStyle: const TextStyle(
      fontWeight: FontWeight.bold,
    ),
    backgroundColor: HexColor('343232'),
    elevation: 20.0,
  ),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(
      fontSize: 20.0,
      fontWeight: FontWeight.w900,
      color: Colors.white,
    ),
  ),
  fontFamily: 'Jannah',
);