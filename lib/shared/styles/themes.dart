import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'colors.dart';

// ThemeData darkTheme=ThemeData(
//   scaffoldBackgroundColor: HexColor('333739'),
//   primarySwatch:myColor,
//   appBarTheme:  AppBarTheme(
//     systemOverlayStyle: SystemUiOverlayStyle(
//       statusBarColor: HexColor('333739'),
//       statusBarIconBrightness:Brightness.light,
//     ),
//     titleTextStyle: const TextStyle(
//       color: Colors.white,
//       fontSize: 25,
//       fontWeight: FontWeight.w600,
//     ),
//     backgroundColor: HexColor('333739'),
//     elevation: 0.0,
//     iconTheme: const IconThemeData(color: Colors.white),
//   ),
//   textTheme: const TextTheme(
//       bodyText1: TextStyle(
//         fontFamily: 'Zoz',
//         color: Colors.white,
//         fontSize: 18,
//         fontWeight: FontWeight.w600,
//       ),
//     subtitle1: TextStyle(
//       fontFamily: 'Zoz',
//       color: Colors.white,
//       fontSize: 16,
//       fontWeight: FontWeight.w600,
//     ),
//     caption: TextStyle(
//       fontFamily: 'Zoz',
//       color: Colors.grey,
//       fontSize: 14,
//     ),
//
//
//   ),
//   bottomNavigationBarTheme:  BottomNavigationBarThemeData(
//     type: BottomNavigationBarType.fixed,
//     selectedItemColor:defaultColor,
//     unselectedItemColor: Colors.grey,
//     backgroundColor: HexColor('333739'),
//     elevation: 20,
//   ),
//   floatingActionButtonTheme: const FloatingActionButtonThemeData(
//     backgroundColor: defaultColor,
//   ),
//
// );

ThemeData lightTheme=ThemeData(
  scaffoldBackgroundColor: Colors.white,
 primarySwatch: myColor,
  primaryColor:myColor ,
  appBarTheme: const AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness:Brightness.dark,
      ),
      titleTextStyle: TextStyle(
        color: Colors.black,
        fontSize: 25,
        fontWeight: FontWeight.bold,
        fontFamily: 'Inter'
      ),
      backgroundColor:Colors.white,
      elevation: 0.0,
      iconTheme: IconThemeData(color: Colors.black,)
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    selectedIconTheme: IconThemeData(
      size: 30,
      color: Colors.white
    ),
    type: BottomNavigationBarType.fixed,
    selectedItemColor: defaultColor,
    unselectedItemColor: Colors.grey,
    elevation: 20,
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor:defaultColor,
  ),
  textTheme: const TextTheme(
      bodyText1: TextStyle(
        fontFamily: 'Roboto',
        color: Colors.black,
        fontSize: 14,
         fontWeight: FontWeight.w600,
      ),
    subtitle1: TextStyle(
      fontFamily: 'Inter',
      color:Colors.black,
      fontSize: 20,
      fontWeight: FontWeight.w600,
    ),
    caption: TextStyle(
      fontFamily: 'Roboto',
      color: Color(0xffA5ACB8),
      fontSize: 14,
    ),
  ),
  tabBarTheme: TabBarTheme(
    labelColor: myColor,
    indicatorSize: TabBarIndicatorSize.tab,
    unselectedLabelColor: Colors.grey,
    unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.normal,fontSize: 16),
    labelStyle: const TextStyle(fontWeight: FontWeight.bold,fontSize: 16),

  )
);