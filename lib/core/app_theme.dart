import 'package:flutter/material.dart';

class AppTheme {
  const AppTheme._();

  static ThemeData lightAppTheme = ThemeData(
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(12),
        primary: Color.fromARGB(255, 0,128,128),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12), // <-- Radius
        ),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(primary: Color.fromARGB(255, 0,128,128))),
    iconTheme: const IconThemeData(color: Color(0xFFA6A3A0)),
    textTheme: const TextTheme(
      headline1: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Colors.black),
      headline2: TextStyle(fontSize: 19, fontWeight: FontWeight.w500,color: Colors.black),
      headline3: TextStyle(fontSize: 18, fontWeight: FontWeight.w500,color: Colors.black),
      headline4: TextStyle(fontSize: 16, fontWeight: FontWeight.w500,color: Colors.black),
      headline5: TextStyle(fontSize: 15, color: Colors.grey),
      headline6: TextStyle(fontSize: 12)
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true
    )
  );
}
class SizeConfig {
  static late MediaQueryData _mediaQueryData;
  static late double screenWidth;
  static late double screenHeight;
  static double? defaultSize;
  static Orientation? orientation;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    orientation = _mediaQueryData.orientation;
  }
}

// Get the proportionate height as per screen size
double getProportionateScreenHeight(double inputHeight) {
  double screenHeight = SizeConfig.screenHeight;
  // 812 is the layout height that designer use
  return (inputHeight / 812.0) * screenHeight;
}

// Get the proportionate height as per screen size
double getProportionateScreenWidth(double inputWidth) {
  double screenWidth = SizeConfig.screenWidth;
  // 375 is the layout width that designer use
  return (inputWidth / 375.0) * screenWidth;
}
