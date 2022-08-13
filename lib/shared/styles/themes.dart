import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_shopping/shared/styles/colors.dart';
import 'package:hexcolor/hexcolor.dart';

ThemeData darkTheme = ThemeData(
  scaffoldBackgroundColor: HexColor('333739'),
  primarySwatch: defaultColor,

  ///floatingActionButtonTheme
  // floatingActionButtonTheme: const FloatingActionButtonThemeData(
  //   backgroundColor: Colors.deepOrange,
  // ),

  ///AppBarTheme
  appBarTheme: AppBarTheme(
    titleSpacing: 20.0,
    backgroundColor: HexColor('333739'),
    elevation: 0.0,
    titleTextStyle: const TextStyle(
        color: Colors.white, fontSize: 20.0, ),
    backwardsCompatibility: false,
    iconTheme: const IconThemeData(color: Colors.white),
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: HexColor('333739'),
      statusBarBrightness: Brightness.light,
    ),
  ),

  ///bottomNavigationBarTheme
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    selectedItemColor: defaultColor,
    unselectedItemColor: Colors.grey,
    elevation: 20,
    type: BottomNavigationBarType.fixed,
    backgroundColor: HexColor('333739'),
  ),

  ///TextTheme
  textTheme: const TextTheme(
    bodyText1: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
  ),

  ///fontFamily
  fontFamily: 'AtkinsonHyperlegible-Regular',
);

ThemeData lightTheme = ThemeData(
  primarySwatch:  defaultColor,
  scaffoldBackgroundColor: Colors.white,

  ///FloatingActionButtonThemeData
  // floatingActionButtonTheme: const FloatingActionButtonThemeData(
  //   backgroundColor: Colors.blue,
  // ),

  ///AppBarTheme
  appBarTheme: const AppBarTheme(
    titleSpacing: 20.0,
    backgroundColor: Colors.white,
    elevation: 0.0,
    titleTextStyle: TextStyle(
        color: Colors.black, fontSize: 20.0, ),
    backwardsCompatibility: false,
    iconTheme: IconThemeData(color: Colors.black),

    ///دي بعملها عشان يتيح ليا التحكم ف ال statusBar
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarBrightness: Brightness.dark,
    ),
  ),

  ///BottomNavigationBarThemeData
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    selectedItemColor: defaultColor,
    elevation: 20,
    type: BottomNavigationBarType.fixed,
  ),

  ///TextTheme
  textTheme: const TextTheme(
    bodyText1: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
  ),

  ///fontFamily
  fontFamily: 'AtkinsonHyperlegible-Regular',
);
