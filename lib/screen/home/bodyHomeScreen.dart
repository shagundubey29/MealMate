import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:meal_mate/util/appTheme.dart';
import 'package:meal_mate/widgets/bigText.dart';
import 'package:meal_mate/widgets/icon_text.dart';
import 'package:meal_mate/widgets/smallText.dart';

class BodyHomeScreen extends StatelessWidget {
  const BodyHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    PageController pageController = PageController(viewportFraction: 0.85);

    return Container(
      height: 320,
      child: PageView.builder(
        controller: pageController,
        itemCount: 5,
        itemBuilder: (context, position){
          return _buildPageItem(position);
        },
        ),
    );
  }

  Widget _buildPageItem(int index){
    return Stack(
      children:[
            Container(
              height: 200,
              margin: const EdgeInsets.only(left: 5, right: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: index.isEven ? Colors.purpleAccent[700] : Colors.blueAccent[700],
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/image/food.jpg'),
                ),
            ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 110,
            margin: EdgeInsets.only(left: 25, right: 25, bottom: 30),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: AppColors.primaryColorDark,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BigText(text: 'Bitter Orange Marinade', color: AppColors.textColor),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Wrap(
                        children: List.generate(5, (index) => Icon(Icons.star_rate_rounded, size: 16,color: AppColors.titleTextColor,))
                      ),
                      const SizedBox(width: 8,),
                      SmallText(text: '4.5'),
                      const SizedBox(width: 8),
                      SmallText(text: '1287'),
                      const SizedBox(width: 8),
                      SmallText(text: 'comments'),
                    ],
                  ),
                  const SizedBox(height: 18),
                  Row(
                  mainAxisAlignment:MainAxisAlignment.spaceBetween,
                  children: [
                    IconAndText(
                      icon: Icons.circle_rounded,
                      text: 'Normal',
                      iconColor: AppColors.orangeColor,
                    ),
                    IconAndText(
                      icon: Icons.location_on_rounded,
                      text: '1.7km',
                      iconColor: AppColors.blueColor,
                    ),
                    IconAndText(
                      icon: Icons.timer_outlined,
                      text: '32 mins',
                      iconColor: Colors.redAccent,
                    ),
                  ],
                ),
                ],
              ),
            ),
          ),
        ),
      ]
    );
  }
}