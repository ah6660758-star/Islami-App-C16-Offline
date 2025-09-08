import 'package:flutter/material.dart';
import 'package:islami_app_offline_sun/core/resources/assets_manager.dart';
import 'package:islami_app_offline_sun/core/resources/colors_manager.dart';
import 'package:islami_app_offline_sun/core/routes_manager/routes_manager.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    navigateToHome();
  }

  void navigateToHome(){
    Future.delayed(Duration(seconds: 2), (){
      Navigator.pushReplacementNamed(context, RoutesManager.mainLayout);

    });

  }


  @override
  Widget build(BuildContext context) {
    print("ana da5alt el build");

    return Scaffold(
      backgroundColor: ColorsManager.black,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 32.0),
          child: Column(
            children: [
              Spacer(
                flex: 6,
              ),
              Image.asset(ImageAssets.splashLogo),
              Spacer(flex: 4,),
              Image.asset(ImageAssets.brandingImage),
            ],
          ),
        ),
      ),
    );
  }
}
