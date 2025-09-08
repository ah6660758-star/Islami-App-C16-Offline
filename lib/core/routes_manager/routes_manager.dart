import 'package:flutter/material.dart';
import 'package:islami_app_offline_sun/features/main_layout/main_layout.dart';
import 'package:islami_app_offline_sun/features/splash/spalsh.dart';
import 'package:islami_app_offline_sun/features/sura_details/sura_details_screen.dart';

class RoutesManager{
  static const String splash = "/splash";
  static const String onBoarding = "/onBoarding";
  static const String mainLayout = "/mainLayout";
  static const String suraDetails = "/suraDetails";

  static Map<String, WidgetBuilder> routes ={
    splash : (context)=>Splash(),
    mainLayout : (context)=>MainLayout(),
    suraDetails : (context)=>SuraDetailsScreen(),
  };

}