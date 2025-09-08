import 'package:flutter/material.dart';
import 'package:islami_app_offline_sun/core/resources/assets_manager.dart';
import 'package:islami_app_offline_sun/core/resources/colors_manager.dart';
import 'package:islami_app_offline_sun/features/main_layout/hadith/hadith_tab.dart';
import 'package:islami_app_offline_sun/features/main_layout/quran/quran_tab.dart';
import 'package:islami_app_offline_sun/features/main_layout/radio/radio_tab.dart';
import 'package:islami_app_offline_sun/features/main_layout/tasbeh/tasbeh_tab.dart';
import 'package:islami_app_offline_sun/features/main_layout/time/time_tab.dart';

class MainLayout extends StatefulWidget {
  MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  List<Widget> tabs = [
    QuranTab(),
    HadithTab(),
    TasbehTab(),
    RadioTab(),
    TimeTab(),
  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.black,
      body: tabs[selectedIndex],
      bottomNavigationBar: _buildBottomNavBar()
    );
  }

  BottomNavigationBar _buildBottomNavBar(){
    return BottomNavigationBar(
      currentIndex: selectedIndex,
      onTap: _onTap,

      items: [
        BottomNavigationBarItem(
          icon: _buildIcon(icon: IconAssets.quran, isSelected: selectedIndex == 0),
          label: "Quran",
        ),
        BottomNavigationBarItem(
          icon: _buildIcon(icon: IconAssets.hadith, isSelected: selectedIndex == 1),
          label: "hadith",
        ),
        BottomNavigationBarItem(
          icon: _buildIcon(icon: IconAssets.sebha, isSelected: selectedIndex == 2),
          label: "Tasbeh",
        ),
        BottomNavigationBarItem(
          icon: _buildIcon(icon: IconAssets.radio, isSelected: selectedIndex == 3),
          label: "Radio",
        ),
        BottomNavigationBarItem(
          icon: _buildIcon(icon: IconAssets.time, isSelected: selectedIndex == 4),
          label: "Time",
        ),
      ],
    );
  }

  Widget _buildIcon({required String icon, required bool isSelected}) {
    return isSelected ? Container(
      padding: EdgeInsets.symmetric(vertical: 6, horizontal: 18),
        decoration: BoxDecoration(
            color: ColorsManager.black.withOpacity(0.6),
          borderRadius: BorderRadius.circular(16)
        ),
        child: ImageIcon(AssetImage(IconAssets.time))) : ImageIcon(
        AssetImage(icon));

  }


  void _onTap(int newIndex){
    setState(() {
      selectedIndex = newIndex;
    });
  }
}
