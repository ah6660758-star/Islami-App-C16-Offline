import 'package:flutter/material.dart';
import 'package:islami_app_offline_sun/core/prefs_manager.dart';
import 'package:islami_app_offline_sun/core/resources/assets_manager.dart';
import 'package:islami_app_offline_sun/core/resources/colors_manager.dart';
import 'package:islami_app_offline_sun/core/routes_manager/routes_manager.dart';
import 'package:islami_app_offline_sun/features/main_layout/quran/most_recent_widget.dart';
import 'package:islami_app_offline_sun/models/sura_model.dart';

class SuraItem extends StatelessWidget {
  SuraItem({super.key, required this.sura, required this.mostRecentKey});

  SuraModel sura;
  GlobalKey<MostRecentWidgetState> mostRecentKey;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        PrefsManager.addSuraIndex(sura.suraIndex);
        Navigator.pushNamed(context, RoutesManager.suraDetails, arguments: SuraDetailsArguments(sura: sura, mostRecentKey: mostRecentKey));
      },
      child: Container(
        padding: EdgeInsets.all(8),
        child: Row(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(ImageAssets.suraNumberBgImage),
                Text(
                  sura.suraIndex,
                  style: TextStyle(
                    color: ColorsManager.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            SizedBox(width: 24),
            Column(
              children: [
                Text(
                  sura.suraNameEn,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: ColorsManager.white,
                  ),
                ),
                Text(
                  "${sura.versesNum}-Verses",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: ColorsManager.white,
                  ),
                ),
              ],
            ),
            Spacer(),
            Text(
              sura.suraNameAr,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: ColorsManager.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class SuraDetailsArguments{
  SuraModel sura;
  GlobalKey<MostRecentWidgetState>? mostRecentKey;
  SuraDetailsArguments({required this.sura,  this.mostRecentKey});
}
