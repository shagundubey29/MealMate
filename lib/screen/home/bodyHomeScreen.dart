import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:meal_mate/util/appTheme.dart';
import 'package:meal_mate/util/dimensions.dart';
import 'package:meal_mate/widgets/bigText.dart';
import 'package:meal_mate/widgets/icon_text.dart';
import 'package:meal_mate/widgets/smallText.dart';
import 'package:dots_indicator/dots_indicator.dart';
class BodyHomeScreen extends StatefulWidget {
  const BodyHomeScreen({super.key});

  @override
  State<BodyHomeScreen> createState() => _BodyHomeScreenState();
}

class _BodyHomeScreenState extends State<BodyHomeScreen> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var _curPageVal = 0.0;
  double _scaleFactor = 0.8;
  double _height = Dimensions.pageViewHeight;
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
    return Column(
      children: [
        //img slider
        Container(
          height: Dimensions.pageView,
          child: PageView.builder(
            controller: pageController,
            itemCount: 5,
            itemBuilder: (context, position){
              return _buildPageItem(position);
            },
          ),
        ),
        //dot area
        SizedBox(
          height: Dimensions.height10,
        ),

        new DotsIndicator(
          dotsCount: 5,
          position: _curPageVal,
          decorator: DotsDecorator(
            activeColor: AppColors.primaryColorDark,
            size: const Size.square(9.0),
            activeSize: const Size(18.0, 9.0),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(Dimensions.borderRadius5)),
          ),
        ),
        SizedBox(height: Dimensions.height20,),
        //popular heading
        Padding(
          padding: EdgeInsets.only(
              left: Dimensions.width20,right: Dimensions.width20, bottom: Dimensions.width16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              BigText(text: 'Popular', weight: FontWeight.w600,),
              SizedBox(width: Dimensions.width5,),
              Container(
                margin: EdgeInsets.only(bottom: 2),
                child: SmallText(text: '.', size: 24,),
              ),
              SizedBox(
                width: Dimensions.width5,
              ),
              Container(
                child: SmallText(text: 'Food pairing'),
              )
            ],
          ),
        ),
        //list section
          ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 10,
            itemBuilder:(context, index) {
              return Container(
                margin: EdgeInsets.only(left: Dimensions.width20,right: Dimensions.width20, bottom: Dimensions.height8),
                child: Row(
                  children: [
                    //img part
                    Container(
                      height: 115,
                      width: 115,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(Dimensions.borderRadius20),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/image/food0.png'),
                          ),
                      ),
                    ),
                    //text part
                    Expanded(
                      child: Container(
                        height: 95,
                        decoration: BoxDecoration(
                          color: AppColors.primaryColorLight,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(Dimensions.borderRadius20),
                            bottomRight: Radius.circular(Dimensions.height20)
                          ),
                        ),
                        child: Padding(
                          padding:  EdgeInsets.only(left: Dimensions.width8, right: Dimensions.width8),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              BigText(text: 'Nutrious fruit meal icecream pudding'),
                              SizedBox(height: 8),
                              SmallText(text: 'With chinese characteristics'),
                              SizedBox(height: 8),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                    text: '32min',
                                    iconColor: Colors.redAccent,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
      ],
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
                height: Dimensions.pageViewHeight,
                margin: EdgeInsets.only(left: Dimensions.width5, right: Dimensions.width5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.borderRadius20),
                  color: index.isEven ? Colors.brown : Colors.brown[800],
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/image/food.jpg'),
                  ),
              ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: Dimensions.pageViewTextHeight,
              margin: EdgeInsets.only(left: 25, right: 25, bottom: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.borderRadius20),
                color: AppColors.primaryColorLight,
                boxShadow:  [
                  BoxShadow(
                    color: AppColors.primaryColorLight,
                    blurRadius: 9.0,
                    offset: const Offset(0, 5),
                  ),
                  BoxShadow(
                    color: AppColors.primaryColorLight,
                    offset: Offset(-5, 0),
                  ),
                  BoxShadow(
                    color: AppColors.primaryColorLight,
                    offset:  Offset(5, 0),
                  ),
                ]
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: Dimensions.height10, horizontal: Dimensions.width16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BigText(text: 'Bitter Orange Marinade', color: AppColors.textColor),
                    SizedBox(height: Dimensions.height10),
                    Row(
                      children: [
                        Wrap(
                          children: List.generate(5, (index) => Icon(Icons.star_rate_rounded, size: 16,color: AppColors.titleTextColor,))
                        ),
                        SizedBox(width: Dimensions.width8,),
                        SmallText(text: '4.5'),
                        SizedBox(width: Dimensions.width8),
                        SmallText(text: '1287'),
                        SizedBox(width: Dimensions.width8),
                        SmallText(text: 'comments'),
                      ],
                    ),
                    SizedBox(height: Dimensions.height18),
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