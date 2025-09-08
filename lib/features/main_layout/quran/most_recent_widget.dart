import 'package:flutter/material.dart';
import 'package:islami_app_offline_sun/core/extensions/context_ex.dart';
import 'package:islami_app_offline_sun/core/prefs_manager.dart';
import 'package:islami_app_offline_sun/models/sura_model.dart';

import '../../../core/resources/colors_manager.dart';
import 'most_recent_sura_item.dart';

class MostRecentWidget extends StatefulWidget {
  const MostRecentWidget({super.key});

  @override
  State<MostRecentWidget> createState() => MostRecentWidgetState();
}

class MostRecentWidgetState extends State<MostRecentWidget> {
  List<SuraModel> mostRecentSuras = [];

  fetchMostRecent() async {
    mostRecentSuras = await PrefsManager.getMostRecentSuras();
   for(int i = 0 ; i < mostRecentSuras.length ; i++){
     print(mostRecentSuras[i].suraNameEn);
   }
    setState(() {});

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchMostRecent();
  }

  @override
  Widget build(BuildContext context) {

    return Visibility(
      visible: mostRecentSuras.isEmpty ? false : true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text("Most Recently", textAlign: TextAlign.start,style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: ColorsManager.ofWhite),)
          ,SizedBox(height: 10,),
          SizedBox(
            height: context.getHeight * 0.18,
            child: ListView.separated(
              separatorBuilder: (context, index) => SizedBox(width: 5),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) =>
                  MostRecentSuraItem(sura: mostRecentSuras[index], mostRecentKey: widget.key as GlobalKey<MostRecentWidgetState>,),
              itemCount: mostRecentSuras.length,
            ),
          ),
        ],
      ),
    );
  }
}
