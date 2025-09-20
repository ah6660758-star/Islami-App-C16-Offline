import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:islami_app_offline_sun/core/resources/assets_manager.dart';
import 'package:islami_app_offline_sun/core/resources/colors_manager.dart';

class SebhaRotation extends StatefulWidget {
  SebhaRotation({super.key});

  @override
  State<SebhaRotation> createState() => _SebhaRotationState();
}

class _SebhaRotationState extends State<SebhaRotation> {
  int nn = 0;
  double angle = 0.0;
  int counter = 1;
  int index = 0;
  List<String> tsbih = ["سبحان الله", "الحمد لله", "الله اكبر"];

  void rotationAngel() {
    angle += math.pi / 33;
    counter++;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Transform.rotate(
          angle: angle,
          child: GestureDetector(
            onTap: () {
              rotationAngel();
              if (counter == 33) {
                counter = 1;
                if (index == 2) {
                  index = 0;
                  setState(() {});
                  return;
                }
                index++;
                setState(() {});
              }
            },
            child: Image.asset(ImageAssets.sebha),
          ),
        ),
        Column(
          children: [
            Text(
              tsbih[index],
              style: TextStyle(
                fontSize: 36,
                color: ColorsManager.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "$counter",
              style: TextStyle(
                fontSize: 36,
                color: ColorsManager.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    );
  }
}