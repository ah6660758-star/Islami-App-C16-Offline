import 'package:islami_app_offline_sun/models/sura_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrefsManager {
  static Future<void> addSuraIndex(String suraIndex) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> mostRecentSurasIndex =
        prefs.getStringList("most_recent_suras_index") ?? [];
    if (mostRecentSurasIndex.contains(suraIndex)) {
      mostRecentSurasIndex.remove(suraIndex);
    }
    if(mostRecentSurasIndex.length > 7){
      mostRecentSurasIndex.remove(mostRecentSurasIndex.first);
    }
    mostRecentSurasIndex.add(suraIndex);
    prefs.setStringList("most_recent_suras_index", mostRecentSurasIndex);
    print(mostRecentSurasIndex.length);
  }

  static Future<List<SuraModel>> getMostRecentSuras() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> mostRecentSurasIndex =
        prefs.getStringList("most_recent_suras_index") ?? [];
    List<SuraModel> mostRecentSuras = [];
    //["1", "2", "3"]
    for (int i = 0; i < mostRecentSurasIndex.length; i++) {
      int index = int.parse(mostRecentSurasIndex[i]);
      SuraModel sura = SuraModel.suras[index - 1];
      mostRecentSuras.add(sura);
    }
    return mostRecentSuras.reversed.toList();
  }
}
