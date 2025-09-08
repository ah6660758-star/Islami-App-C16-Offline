import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app_offline_sun/core/resources/assets_manager.dart';
import 'package:islami_app_offline_sun/core/resources/colors_manager.dart';
import 'package:islami_app_offline_sun/features/main_layout/quran/sura_item.dart';
import 'package:islami_app_offline_sun/features/sura_details/verse_item.dart';
import 'package:islami_app_offline_sun/models/sura_model.dart';

class SuraDetailsScreen extends StatefulWidget {
  const SuraDetailsScreen({super.key});

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  late SuraDetailsArguments suraArgument;
  String suraContent = '';
  List<String> suraVerses = [];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    suraArgument = ModalRoute.of(context)?.settings.arguments as SuraDetailsArguments;
    loadSuraContent(suraArgument.sura.suraIndex);
  }
  @override
  void dispose() {
    // TODO: implement dispose
    suraArgument.mostRecentKey?.currentState?.fetchMostRecent();
    super.dispose();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(suraArgument.sura.suraNameEn)),

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(ImageAssets.suraDetailsPatternLeft),
                Text(
                  suraArgument.sura.suraNameAr,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: ColorsManager.gold,
                  ),
                ),
                Image.asset(ImageAssets.suraDetailsPatternRight),
              ],
            ),
            Expanded(
              child: suraVerses.isEmpty
                  ? Center(
                      child: CircularProgressIndicator(
                        color: ColorsManager.gold,
                      ),
                    )

                  : ListView.builder(
                      itemBuilder: (context, index) =>VerseItem(verse: suraVerses[index]),
                itemCount: suraVerses.length,
                    ),
            ),
          ],
        ),
      ),
    );
  }

  String getName() {
    return "Muhammed ssad";
  }

  void loadSuraContent(String suraIndex) async {
    String filePath = "assets/files/suras/$suraIndex.txt";
    String fileContent = await rootBundle.loadString(filePath);
    List<String> suraLines = fileContent.trim().split("\n");
    for (int i = 0; i < suraLines.length; i++) {
      suraLines[i] += "[${i + 1}]";
    }
    suraVerses = suraLines;
    await Future.delayed(Duration(seconds: 1));
    setState(() {});
  }
}
