import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:meal_mate/screen/home/bodyHomeScreen.dart';
import 'package:meal_mate/widgets/bigText.dart';
import 'package:meal_mate/widgets/smallText.dart';

import '../../util/appTheme.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SafeArea(
        child: Container(
          child: Container(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          BigText(text: 'India', weight: FontWeight.w600,),
                          Row(
                            children: [
                              SmallText(text: 'New Town', color: AppColors.titleTextColor,),
                              Icon(
                                Icons.arrow_drop_down_rounded,
                                )
                            ],
                          ),
                        ],
                      ),
                      Container(
                        width: 45,
                        height: 45,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: AppColors.primaryColorDark,
                        ),
                          child: const Icon(Icons.search),
                      )
                    ],
                  ),
                ),
                BodyHomeScreen(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}