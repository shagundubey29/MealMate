import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:meal_mate/util/appTheme.dart';
import 'package:meal_mate/widgets/bigText.dart';
import 'package:meal_mate/widgets/icon_text.dart';
import 'package:meal_mate/widgets/smallText.dart';

class BodyHomeScreen extends StatefulWidget {
  const BodyHomeScreen({super.key});

  @override
  State<BodyHomeScreen> createState() => _BodyHomeScreenState();
}

class _BodyHomeScreenState extends State<BodyHomeScreen> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var _curPageVal = 0.0;
  double _scaleFactor = 0.8;
  double _height = 200;
  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _curPageVal = pageController.page!;       
      });
    });
  }

  @override
  void dispose(){
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
    Matrix4 matrix = new Matrix4.identity();
    if(index == _curPageVal.floor()){
      var _scale = 1-(_curPageVal - index) * (1-_scaleFactor);
      var _trans = _height * (1-_scale)/2;
      matrix = Matrix4.diagonal3Values(1, _scale, 1)..setTranslationRaw(0, _trans, 0);
    }else if(index == _curPageVal.floor()+1){
      var _scale = _scaleFactor+(_curPageVal - index +1)*(1- _scaleFactor);
      var _trans = _height * (1 - _scale) / 2;
      matrix = Matrix4.diagonal3Values(1, _scale, 1);
      matrix = Matrix4.diagonal3Values(1, _scale, 1)
        ..setTranslationRaw(0, _trans, 0);
    }else if(index == _curPageVal.floor()-1){
      var _scale =
          1 - (_curPageVal - index) * (1 - _scaleFactor);
      var _trans = _height * (1 - _scale) / 2;
      matrix = Matrix4.diagonal3Values(1, _scale, 1);
      matrix = Matrix4.diagonal3Values(1, _scale, 1)
        ..setTranslationRaw(0, _trans, 0);
    }else{
      var _scale = 0.8;
      matrix = Matrix4.diagonal3Values(1, _scale, 1)
        ..setTranslationRaw(0, _height * (1 - _scaleFactor) / 2, 0);
    }

    return Transform(
      transform: matrix,
      child: Stack(
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
              height: 120,
              margin: EdgeInsets.only(left: 25, right: 25, bottom: 45),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: AppColors.primaryColorDark,
                boxShadow:  [
                  BoxShadow(
                    color: AppColors.primaryColorDark,
                    blurRadius: 9.0,
                    offset: const Offset(0, 5),
                  ),
                  BoxShadow(
                    color: AppColors.primaryColorDark,
                    offset: Offset(-5, 0),
                  ),
                  BoxShadow(
                    color: AppColors.primaryColorDark,
                    offset:  Offset(5, 0),
                  ),
                ]
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
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
                        icon: Icons.access_time_rounded,
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
      ),
    );
  }
}