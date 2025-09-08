import 'package:flutter/material.dart';
import 'package:islami_app_offline_sun/core/prefs_manager.dart';
import 'package:islami_app_offline_sun/core/resources/assets_manager.dart';
import 'package:islami_app_offline_sun/core/resources/colors_manager.dart';
import 'package:islami_app_offline_sun/core/routes_manager/routes_manager.dart';
import 'package:islami_app_offline_sun/features/main_layout/quran/most_recent_widget.dart';
import 'package:islami_app_offline_sun/features/main_layout/quran/sura_item.dart';
import 'package:islami_app_offline_sun/models/sura_model.dart';

class MostRecentSuraItem extends StatelessWidget {
  const MostRecentSuraItem({super.key, required this.sura, required this.mostRecentKey});
  final SuraModel sura;
  final GlobalKey<MostRecentWidgetState> mostRecentKey;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        PrefsManager.addSuraIndex(sura.suraIndex);
        Navigator.pushNamed(context, RoutesManager.suraDetails,arguments: SuraDetailsArguments(sura: sura, mostRecentKey: mostRecentKey));
      },
      child: Container(
      padding: EdgeInsets.symmetric(horizontal: 17, vertical: 12),
        decoration: BoxDecoration(
          color: ColorsManager.gold,
          borderRadius: BorderRadius.circular(14)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(sura.suraNameEn, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: ColorsManager.black),),
                Text(sura.suraNameAr, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: ColorsManager.black),),
                Text("${sura.versesNum} verses", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: ColorsManager.black),),
              ],
            ),
            Image.asset(ImageAssets.mostRecentCardImage)
          ],
        )
      ),
    );
  }
}
