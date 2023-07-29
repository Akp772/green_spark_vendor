import 'package:flutter/material.dart';

class AppColors {
  /// foodSteps Colors
  static const Color onBoardingBgColor = Color.fromRGBO(252, 127, 110, 1);

  static const Color appMainColor = Color.fromRGBO(206, 49, 38, 1);
  static const Color progressDotColor = Color.fromRGBO(206, 49, 38, 0.5);
  static const Color darkOrangeColor = Color.fromRGBO(201, 13, 13, 1);
  static const Color redishColor = Color.fromRGBO(255, 21, 21, 1);

  static const Color recipeBgColor = Color.fromRGBO(249, 208, 108, 1);
  static const Color plannerBgColor = Color.fromRGBO(255, 251, 228, 1);
  static const Color leftOverBgColor = Color.fromRGBO(167, 222, 124, 1);

  static const Color uploadBgColor = Color.fromRGBO(129, 162, 250, 1);
  static const Color lightBlueColor = Color.fromRGBO(233, 241, 255, 1);
  static const Color otpFillColor = Color.fromRGBO(206, 49, 38, 0.2);
  static const Color highlightedBlack = Color.fromRGBO(38, 38, 38, 1);

  static const Color highlightedYellow = Color.fromRGBO(255, 255, 255, 1.0);
  static const Color lightPinkColor = Color.fromRGBO(255, 192, 187, 1);

  static const Color highlightedOrange = Color.fromRGBO(240, 152, 71, 1);
  static const Color blueColor = Color.fromRGBO(22, 76, 215, 1);
  static const Color lightBlueSecondColor = Color.fromRGBO(13, 31, 197, 1);
  static const Color lightBlueThirdColor = Color.fromRGBO(8, 115, 213, 1);
  static const Color outerBorderColor = Color.fromRGBO(255, 207, 35, 1);

  static const Color blackTextInputColor = Colors.black;
  static const Color blackTextColor = Colors.black;
  static const Color buttonColor = Colors.black;
  static const Color whiteColor = Color.fromRGBO(255, 255, 255, 1.0);
  static const Color lightGreyColor = Color.fromRGBO(240, 240, 240, 1);
  static const Color productItemBgColor = Color.fromRGBO(244, 243, 243, 1);
  static const Color textFieldHeadingColor = Color.fromRGBO(105, 92, 92, 1);
  static const Color buttonBgColor = Color.fromRGBO(217, 217, 217, 1);
  static const Color textFieldBorderColor = Colors.black;
  static const Color socialLoginButtonColor =
      Color.fromRGBO(255, 255, 255, 0.4);
  static const Color linkColor = Color.fromRGBO(14, 43, 144, 1.0);
  static const Color greyColor = Color.fromRGBO(0, 0, 0, .3);
  static const Color textColor = Color.fromRGBO(0, 0, 0, 0.7);
  static const Color greenColor = Color.fromRGBO(4, 160, 20, 1);
  static const Color orderGreenColor = Color.fromRGBO(8, 140, 22, 1);
  static const Color borderColor = Color.fromRGBO(0, 0, 0, 0.5);
  static const Color lightGrey = Color.fromRGBO(199, 199, 199, 0.24);
  static const Color redColor = Color.fromRGBO(252, 127, 110, 1);
  static const Color headingBrownColor = Color.fromRGBO(105, 92, 92, 1);
  static const Color buttonBlackShadeColor = Color.fromRGBO(38, 38, 38, 1);
  static const Color textBrownColor = Color.fromRGBO(76, 55, 36, 1);
  static const Color textGreyColor = Color.fromRGBO(36, 32, 33, 0.8);

  static const Color errorRedColor = Color.fromRGBO(228, 52, 28, 1);
  static const Color extraRedColor = Color.fromRGBO(232, 16, 16, 1);

  static const Color unselectedBottomBar = Color.fromRGBO(117, 117, 117, 1);
  static const Color whiteGreyShade = Color.fromRGBO(235, 234, 234, 1);
  static const Color highlightedBlue = Color.fromRGBO(93, 130, 229, 1);

  static const MaterialColor primarySwatch = MaterialColor(
    0xff262626c,
    <int, Color>{
      50: Color(0xff262626),
      100: Color(0xff262626),
      200: Color(0xff262626),
      300: Color(0xff262626),
      400: Color(0xff262626),
      500: Color(0xff262626),
      600: Color(0xff262626),
      700: Color(0xff262626),
      800: Color(0xff262626),
      900: Color(0xff262626),
    },
  );
}

class CommonColor {
  CommonColor._internal();
  static final CommonColor _instance = CommonColor._internal();

  static CommonColor get instance => _instance;

  Color backgroundColor = Color.fromRGBO(252, 127, 110, 1);
  String? userProfileUrl;
  String? userInitial;
  int? userId;
}
