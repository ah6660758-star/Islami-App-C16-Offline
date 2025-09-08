import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:islami_app_offline_sun/core/resources/assets_manager.dart';
import 'package:islami_app_offline_sun/features/main_layout/hadith/hadith_item.dart';

class HadithTab extends StatelessWidget {
  const HadithTab({super.key});

  @override
  Widget build(BuildContext context) {

    return Container(

      decoration: BoxDecoration(
        image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage(ImageAssets.hadithTabBgImage))
      ),
      child: Column(
        children: [
          Image.asset(ImageAssets.islamiLogo),

          Expanded(
            child: CarouselSlider(
              options: CarouselOptions(
                  height: 600.0,
              enlargeCenterPage: true,
                enlargeFactor: 0.2,
                viewportFraction: 0.8
              ),
              items: List.generate(50, (index)=>index+1).map((item) {
                return HadithItem(index: item,);
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
