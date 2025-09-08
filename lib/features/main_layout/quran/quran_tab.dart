import 'package:flutter/material.dart';
import 'package:islami_app_offline_sun/core/extensions/context_ex.dart';
import 'package:islami_app_offline_sun/core/resources/assets_manager.dart';
import 'package:islami_app_offline_sun/core/resources/colors_manager.dart';
import 'package:islami_app_offline_sun/features/main_layout/quran/most_recent_widget.dart';
import 'package:islami_app_offline_sun/features/main_layout/quran/sura_item.dart';
import 'package:islami_app_offline_sun/models/sura_model.dart';

import 'most_recent_sura_item.dart';

class QuranTab extends StatefulWidget {
  const QuranTab({super.key});

  @override
  State<QuranTab> createState() => _QuranTabState();
}

class _QuranTabState extends State<QuranTab> {
  List<SuraModel> filteredList = SuraModel.suras;
  var mostRecentKey = GlobalKey<MostRecentWidgetState>();
  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
                child: Image.asset(ImageAssets.islamiLogo, alignment: Alignment.center,)),
            SizedBox(height: 21,),
            TextField(
              onChanged: (input){
             filterSurasBySearchKey(input);
              },
              cursorColor: ColorsManager.gold,
              style: TextStyle(fontSize: 18, color: ColorsManager.gold, fontWeight: FontWeight.w400),
              decoration: InputDecoration(

                prefixIcon:ImageIcon(AssetImage(IconAssets.quran,),),
                prefixIconColor: ColorsManager.gold,
                labelText: "Sura name",
                labelStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: ColorsManager.gold),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide(color: ColorsManager.gold, width: 1)
                ),
                focusedBorder:  OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: BorderSide(color: ColorsManager.gold, width: 1)
                ),
              ),
            ),
            SizedBox(height: 20,),

         MostRecentWidget(key: mostRecentKey,),
            SizedBox(height: 10,),
            Text("suras List", textAlign: TextAlign.start,style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: ColorsManager.ofWhite),)
            ,SizedBox(height: 10,),
           ListView.separated(
             padding: EdgeInsets.zero,
             physics: NeverScrollableScrollPhysics(),
             shrinkWrap: true,
             separatorBuilder: (context, index)=> Divider(thickness: 1,color: ColorsManager.white,indent: 20, endIndent: 20,),
             itemBuilder: (context, index){

               return SuraItem(sura: filteredList[index],mostRecentKey: mostRecentKey,);
             },itemCount: filteredList.length,)

          ],
        ),
      ),
    );
  }

  void filterSurasBySearchKey(String searchKey) {
    filteredList = SuraModel.suras.where((sura)=> sura.suraNameEn.toLowerCase().contains(searchKey.toLowerCase())|| sura.suraNameAr.contains(searchKey)).toList();
    setState(() {

    });
  }
}
