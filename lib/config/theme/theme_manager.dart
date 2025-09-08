import 'package:flutter/material.dart';
import 'package:islami_app_offline_sun/core/resources/colors_manager.dart';

class ThemeManager{
  static final ThemeData light = ThemeData(
    primaryColor: Colors.red,
      appBarTheme: AppBarTheme(
          backgroundColor: ColorsManager.black,
          foregroundColor: ColorsManager.gold,
          centerTitle: true,
          titleTextStyle: TextStyle(fontWeight: FontWeight.bold, color: ColorsManager.gold,fontSize: 22)
      ),
    scaffoldBackgroundColor: ColorsManager.black,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: ColorsManager.gold,
      type: BottomNavigationBarType.fixed,
      selectedItemColor:  ColorsManager.white,
      unselectedItemColor: ColorsManager.black
    )
  );
}