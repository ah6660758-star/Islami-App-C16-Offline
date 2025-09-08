import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app_offline_sun/core/resources/assets_manager.dart';
import 'package:islami_app_offline_sun/core/resources/colors_manager.dart';
import 'package:islami_app_offline_sun/models/hadith_model.dart';

class HadithItem extends StatefulWidget {
  const HadithItem({super.key, required this.index});

  final int index;

  @override
  State<HadithItem> createState() => _HadithItemState();
}

class _HadithItemState extends State<HadithItem> {
  HadithModel? hadith;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadHadith(widget.index);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 12, left: 12, right: 12),
      decoration: BoxDecoration(
        image: DecorationImage(
          alignment: Alignment.center,
          image: AssetImage(ImageAssets.hadithCardBgImage),
        ),
        color: ColorsManager.gold,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    ImageAssets.suraDetailsPatternLeft,
                    color: Colors.black,
                  ),
                  Image.asset(
                    ImageAssets.suraDetailsPatternRight,
                    color: Colors.black,
                  ),
                ],
              ),
              Text(
                hadith?.title ?? "",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: ColorsManager.black,
                ),
              ),
            ],
          ),
          Expanded(
            child: hadith == null
                ? Center(child: CircularProgressIndicator())
                : SingleChildScrollView(
                    child: Text(
                      hadith?.content ?? '',
                      textDirection: TextDirection.rtl,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        color: ColorsManager.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
          ),
          Image.asset(ImageAssets.hadithCardBottomImage)
        ],
      ),
    );
  }

  void loadHadith(index) async {
    String filPath = "assets/files/hadith/h$index.txt";
    String fileContent = await rootBundle.loadString(filPath);
    List<String> hadithLines = fileContent.split("\n");
    String title = hadithLines[0];
    hadithLines.removeAt(0);
    String content = hadithLines.join();
    hadith = HadithModel(title: title, content: content);
    setState(() {});
  }
}
