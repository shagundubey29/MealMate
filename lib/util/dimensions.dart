import 'package:get/get.dart';

class Dimensions{
  static double screenHeight = Get.context!.height;
  static double screenWidth = Get.context!.width;

  //screen height is 772
  static double pageView = screenHeight /2.79;    
  static double pageViewHeight = screenHeight/3.51;
  static double pageViewTextHeight = screenHeight/7.02;

// margin and padding heights
  static double height10 = screenHeight/77.2;
  static double height18 = screenHeight / 42.89;
  static double height8 = screenHeight / 96.5;
  static double height20 = screenHeight / 38.6;
  

//margin and padding width
  static double width8 = screenHeight / 96.5;
  static double width5 = screenHeight / 154.4;
  static double width16 = screenHeight / 48.25;
  static double width20 = screenHeight / 38.6;

  static double fontSize20 = screenHeight/38.6;

  static double borderRadius5 = screenHeight / 154.4;
  static double borderRadius20 = screenHeight / 38.6;
  static double borderRadius15 = screenHeight /51.47;

  static double iconSize24 = screenHeight / 31.17;
  static double iconSize20 = screenHeight / 38.6;
}