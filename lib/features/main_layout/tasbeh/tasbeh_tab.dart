import 'package:flutter/material.dart';
import 'package:islami_app_offline_sun/core/resources/assets_manager.dart';
import 'package:islami_app_offline_sun/core/resources/colors_manager.dart';
import 'package:islami_app_offline_sun/models/sebha_model.dart';

class TasbehTab extends StatelessWidget {
  TasbehTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(ImageAssets.sebhabg),
          fit: BoxFit.fill,
          opacity: 0.4,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(ImageAssets.islamiLogo),
              Text(
                "سَبِّحِ اسْمَ رَبِّكَ الأعلى ",
                style: TextStyle(
                  fontSize: 36,
                  color: ColorsManager.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Image.asset(ImageAssets.upperSebha),
              Stack(alignment: Alignment.center, children: [SebhaRotation()]),
            ],
          ),
        ),
      ),
    );
  }
}