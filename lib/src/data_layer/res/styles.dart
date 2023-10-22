import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:green_spark_vendor/src/business_layer/util/helper/device_info_helper.dart';
import 'package:green_spark_vendor/src/data_layer/res/colors.dart';
import 'package:green_spark_vendor/src/data_layer/res/numbers.dart';

class AppStyles {
  ///text Style
  static TextStyle textStyle20Black = TextStyle(
      color: AppColors.blackTextInputColor,
      fontSize: getFontSize(d_20),
      fontWeight: FontWeight.w300);

  /// BorderRadius
  static final BorderRadius br5 = BorderRadius.circular(d_5);
  static final BorderRadius br10 = BorderRadius.circular(d_10);
  static final BorderRadius br14 = BorderRadius.circular(d_14);
  static final BorderRadius br15 = BorderRadius.circular(d_15);
  static final BorderRadius br16 = BorderRadius.circular(d_16);
  static final BorderRadius br18 = BorderRadius.circular(d_18);
  static final BorderRadius br20 = BorderRadius.circular(d_20);
  static final BorderRadius br25 = BorderRadius.circular(d_25);
  static final BorderRadius br27 = BorderRadius.circular(d_27);
  static final BorderRadius br30 = BorderRadius.circular(d_30);
  static final BorderRadius br35 = BorderRadius.circular(d_35);
  static final BorderRadius br40 = BorderRadius.circular(d_40);
  static final BorderRadius br45 = BorderRadius.circular(d_45);
  static final BorderRadius br50 = BorderRadius.circular(d_50);
  static final BorderRadius br100 = BorderRadius.circular(d_100);

  /// Shape
  static RoundedRectangleBorder radius20RectangularShape() {
    return RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(d_20),
    );
  }

  static RoundedRectangleBorder bottomSheetTopCornersShape() {
    return const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(d_20),
        topRight: Radius.circular(d_20),
      ),
    );
  }

  /// BoxDecoration
  static BoxDecoration radiusBoxDecoration(
      {Color color = AppColors.whiteColor,
      double radius = d_100,
      Color? borderColor,
      double borderWidth = 1.0,
      List<BoxShadow>? boxShadow}) {
    return BoxDecoration(
      color: color,
      borderRadius: BorderRadius.all(Radius.circular(radius)),
      border: Border.all(color: borderColor ?? color, width: borderWidth),
      boxShadow: boxShadow,
    );
  }

  static BoxDecoration radiusBoxDecorationOnlyFrom(
      {Color color = AppColors.whiteColor,
      double bottomRight = d_0,
      double topLeft = d_0,
      double topRight = d_0,
      double bottomLeft = d_0}) {
    return BoxDecoration(
      color: color,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(topLeft),
        topRight: Radius.circular(topRight),
        bottomRight: Radius.circular(bottomRight),
        bottomLeft: Radius.circular(bottomLeft),
      ),
    );
  }

  static BoxDecoration circularBoxDecoration({Color color = Colors.white}) {
    return BoxDecoration(
      color: color,
      shape: BoxShape.circle,
    );
  }

  static BoxDecoration appButtonBoxDecoration(Color color,
      {bool active = true, double radius = d_10, Color? borderColor}) {
    return BoxDecoration(
      color: active ? color : Colors.transparent,
      borderRadius: BorderRadius.all(Radius.circular(radius)),
      border: Border.all(
        color: borderColor ?? AppColors.textFieldBorderColor,
        width: d_1,
      ),
    );
  }

  static BoxDecoration boxDecorationWithShadow(Color color, double radius) {
    return BoxDecoration(
      color: color,
      borderRadius: BorderRadius.all(Radius.circular(radius)),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.16),
          offset: const Offset(d_3, d_3),
          blurRadius: d_6,
        ),
      ],
    );
  }

  /// Method used to get font size according to device
  static double getFontSize(double value) {
    return value;
  }

  /// Method used to get height according to device
  static double getHeight(double value) {
    return value;
  }

  /// Method used to get width according to device
  static double getWidth(double value) {
    return value;
  }

  /// divider

  static Widget commonDivider() {
    return Divider(
      color: Colors.black,
      thickness: .8,
    );
  }

  /// Paddings
  static EdgeInsets pd0 = const EdgeInsets.all(d_0);
  static EdgeInsets pd1 = const EdgeInsets.all(d_1);
  static EdgeInsets pd2 = const EdgeInsets.all(d_2);
  static EdgeInsets pd3 = const EdgeInsets.all(d_3);
  static EdgeInsets pd4 = const EdgeInsets.all(d_4);
  static EdgeInsets pd5 = const EdgeInsets.all(d_5);
  static EdgeInsets pd6 = const EdgeInsets.all(d_6);
  static EdgeInsets pd7 = const EdgeInsets.all(d_7);
  static const EdgeInsets pd8 = EdgeInsets.all(d_8);
  static EdgeInsets pd9 = const EdgeInsets.all(d_9);
  static EdgeInsets pd10 = const EdgeInsets.all(d_10);
  static EdgeInsets pd11 = const EdgeInsets.all(d_11);
  static EdgeInsets pd12 = const EdgeInsets.all(d_12);
  static EdgeInsets pd13 = const EdgeInsets.all(d_13);
  static const EdgeInsets pd14 = EdgeInsets.all(d_14);
  static EdgeInsets pd15 = const EdgeInsets.all(d_15);
  static EdgeInsets pd16 = const EdgeInsets.all(d_16);
  static EdgeInsets pd17 = const EdgeInsets.all(d_17);
  static EdgeInsets pd18 = const EdgeInsets.all(d_18);
  static const EdgeInsets pd19 = EdgeInsets.all(d_19);
  static const EdgeInsets pd20 = EdgeInsets.all(d_20);
  // static EdgeInsets pdLRB20 = const EdgeInsets.only(left: d_20,bottom: d_20,right: d_20);
  static EdgeInsets pd23 = const EdgeInsets.all(d_23);
  static EdgeInsets pd24 = const EdgeInsets.all(d_24);
  static EdgeInsets pd25 = const EdgeInsets.all(d_25);
  static EdgeInsets pd30 = const EdgeInsets.all(d_30);
  static EdgeInsets pd35 = const EdgeInsets.all(d_35);
  static EdgeInsets pd40 = const EdgeInsets.all(d_40);
  static EdgeInsets pd45 = const EdgeInsets.all(d_45);
  static EdgeInsets pd50 = const EdgeInsets.all(d_50);
  static EdgeInsets pd100 = const EdgeInsets.all(d_100);
  static EdgeInsets pdR75 = const EdgeInsets.only(right: d_75);
  static EdgeInsets pdT5 = const EdgeInsets.only(top: d_5);
  static EdgeInsets pdL2 = const EdgeInsets.only(left: d_2);
  static EdgeInsets pdL6 = const EdgeInsets.only(left: d_6);
  static EdgeInsets pdL8 = const EdgeInsets.only(left: d_8);
  static EdgeInsets pdR6 = const EdgeInsets.only(right: d_6);
  static EdgeInsets pdT8 = const EdgeInsets.only(top: d_8);
  static EdgeInsets pdT10 = const EdgeInsets.only(top: d_10);
  static EdgeInsets pdT20 = const EdgeInsets.only(top: d_20);
  static EdgeInsets pdT35L4 = const EdgeInsets.only(top: d_35, left: 4);
  static EdgeInsets pdT15 = const EdgeInsets.only(top: d_15);
  static EdgeInsets pdR8 = const EdgeInsets.only(right: d_8);
  static EdgeInsets pdR10 = const EdgeInsets.only(right: d_10);
  static EdgeInsets pdB15 = const EdgeInsets.only(bottom: d_15);
  static EdgeInsets pdL15 = const EdgeInsets.only(left: d_15);
  static EdgeInsets pdLR16 = const EdgeInsets.only(left: d_16, right: d_16);
  static EdgeInsets pdL6R12 = const EdgeInsets.only(left: d_6, right: d_12);
  static EdgeInsets pdLR10 = const EdgeInsets.only(left: d_10, right: d_10);
  static EdgeInsets pdL10 = const EdgeInsets.only(left: d_10);
  static EdgeInsets pdLR20T15 =
      const EdgeInsets.only(top: d_15, left: d_20, right: d_20);
  static EdgeInsets pdLR20T0 =
      const EdgeInsets.only(top: 0, left: d_20, right: d_20);
  static const EdgeInsets pdLRB20T25 =
      EdgeInsets.only(left: d_20, right: d_20, bottom: d_20, top: 25);
  static const EdgeInsets pdLR24 = EdgeInsets.only(left: d_24, right: d_24);
  static const EdgeInsets pdLR24B10 =
      EdgeInsets.only(left: d_24, right: d_24, bottom: 10);

  static const EdgeInsets pdR16T16 = EdgeInsets.only(top: 16.0, right: 16);
  static const EdgeInsets pdLRB20T0 =
      EdgeInsets.only(left: d_20, right: d_20, bottom: d_20, top: d_0);
  static const EdgeInsets pdLR6B14 = EdgeInsets.only(
    left: d_6,
    right: d_6,
    bottom: d_14,
  );
  static const EdgeInsets pdLRB10T20 =
      EdgeInsets.only(left: d_10, right: d_10, bottom: d_10, top: d_20);
  static const EdgeInsets pdL23R46TB9 =
      EdgeInsets.only(left: d_23, right: d_46, bottom: d_9, top: d_9);
  static const EdgeInsets pdLR20T25 =
      EdgeInsets.only(left: d_20, right: d_20, top: 25);
  static const EdgeInsets pdH17V20 =
      EdgeInsets.symmetric(horizontal: d_17, vertical: d_20);
  static const EdgeInsets pdH19V22 =
      EdgeInsets.symmetric(horizontal: d_19, vertical: d_22);
  static const EdgeInsets pdH30V15 =
      EdgeInsets.symmetric(horizontal: d_30, vertical: d_15);
  static const EdgeInsets pdH13V17 =
      EdgeInsets.symmetric(horizontal: d_13, vertical: d_17);
  static const EdgeInsets pdH15V11 =
      EdgeInsets.symmetric(horizontal: d_15, vertical: d_12);
  static const EdgeInsets pdH15V8 =
  EdgeInsets.symmetric(horizontal: d_15, vertical: d_8);
  static const EdgeInsets pdH16V40 =
      EdgeInsets.symmetric(horizontal: d_16, vertical: d_40);
  static const EdgeInsets pdH16V20 =
      EdgeInsets.symmetric(horizontal: d_16, vertical: d_20);
  static const EdgeInsets pdH16V25 =
      EdgeInsets.symmetric(horizontal: d_16, vertical: d_25);
  static const EdgeInsets pdH16V35 =
      EdgeInsets.symmetric(horizontal: d_16, vertical: d_35);
  static const EdgeInsets pdV0H31 =
      EdgeInsets.symmetric(horizontal: d_31, vertical: d_0);
  static const EdgeInsets pdH26V9 =
      EdgeInsets.symmetric(horizontal: d_26, vertical: d_9);
  static const EdgeInsets pdV30H26 =
      EdgeInsets.symmetric(horizontal: d_26, vertical: d_30);
  static const EdgeInsets pdH19V11 =
      EdgeInsets.symmetric(horizontal: d_19, vertical: d_11);
  static const EdgeInsets pdH8V10 =
      EdgeInsets.symmetric(horizontal: d_8, vertical: d_10);
  static const EdgeInsets pdH20V16 =
      EdgeInsets.symmetric(horizontal: d_20, vertical: d_16);
  static const EdgeInsets pdH20V12 =
      EdgeInsets.symmetric(horizontal: d_20, vertical: d_12);
  static const EdgeInsets pdH20V8 =
      EdgeInsets.symmetric(horizontal: d_20, vertical: d_5);
  static const EdgeInsets pdH24V21 =
      EdgeInsets.symmetric(horizontal: d_24, vertical: d_21);
  static const EdgeInsets pdH11V7 =
      EdgeInsets.symmetric(horizontal: d_11, vertical: d_7);
  static const EdgeInsets pdH10V5 =
      EdgeInsets.symmetric(horizontal: d_10, vertical: d_5);
  static const EdgeInsets pdLRB20 =
      EdgeInsets.only(left: d_20, right: d_20, bottom: d_20);
  static const EdgeInsets pdLRB20T13 =
      EdgeInsets.only(left: d_20, right: d_20, bottom: d_20, top: d_13);
  static const EdgeInsets pdLR17T16B15 =
      EdgeInsets.only(left: d_17, right: d_17, bottom: d_15, top: d_16);
  static const EdgeInsets pdLR27T51B31 =
      EdgeInsets.only(left: d_27, right: d_27, bottom: d_31, top: d_51);
  static const EdgeInsets pdLR17B15 =
      EdgeInsets.only(left: d_17, right: d_17, bottom: d_15);
  static const EdgeInsets pdLRB15 =
      EdgeInsets.only(left: d_15, right: d_15, bottom: d_15);
  static const EdgeInsets pdLR20T10 =
      EdgeInsets.only(left: d_20, right: d_20, top: d_10);
  static const EdgeInsets pdTB10 = EdgeInsets.only(bottom: d_10, top: d_10);
  static const EdgeInsets pdV11 = EdgeInsets.symmetric(vertical: d_11);
  static const EdgeInsets pdV6 = EdgeInsets.symmetric(vertical: d_6);
  static const EdgeInsets pdV9 = EdgeInsets.symmetric(vertical: d_9);
  static const EdgeInsets pdV18 = EdgeInsets.symmetric(vertical: d_18);
  static const EdgeInsets pdH22V18 =
      EdgeInsets.symmetric(vertical: d_18, horizontal: d_22);
  static const EdgeInsets pdH22V16 =
      EdgeInsets.symmetric(vertical: d_16, horizontal: d_22);
  static const EdgeInsets pdV15 = EdgeInsets.symmetric(vertical: d_15);
  static const EdgeInsets pdV10 = EdgeInsets.symmetric(vertical: d_10);
  static const EdgeInsets pdV25 = EdgeInsets.symmetric(vertical: d_25);
  static const EdgeInsets pdV20 = EdgeInsets.symmetric(vertical: d_20);
  static const EdgeInsets pdH13 = EdgeInsets.symmetric(horizontal: d_13);
  static const EdgeInsets pdH35 = EdgeInsets.symmetric(horizontal: d_35);
  static const EdgeInsets pdH8 = EdgeInsets.symmetric(horizontal: d_8);
  static const EdgeInsets pdH15V10 = EdgeInsets.symmetric(horizontal: d_15,vertical: 8);
  static const EdgeInsets pdH15 = EdgeInsets.symmetric(horizontal: d_15);
  static const EdgeInsets pdH16 = EdgeInsets.symmetric(horizontal: d_16);
  static const EdgeInsets pdH16V8 =
      EdgeInsets.symmetric(horizontal: d_16, vertical: 8);
  static const EdgeInsets pdH20 = EdgeInsets.symmetric(horizontal: d_20);
  static const EdgeInsets pdH28 = EdgeInsets.symmetric(horizontal: d_28);
  static const EdgeInsets pdH50 = EdgeInsets.symmetric(horizontal: d_50);
  static final EdgeInsets screenHorizontalPadding = EdgeInsets.symmetric(
    horizontal: DeviceInfo.smallDevice ? d_16 : d_20,
  );
  static final EdgeInsets textFieldContentPadding = EdgeInsets.symmetric(
    horizontal: DeviceInfo.smallDevice ? d_18 : d_24,
    vertical: d_18,
  );

  /// Sized Box
  static final SizedBox sbHeight1 = SizedBox(height: getHeight(d_1));
  static final SizedBox sbHeight2 = SizedBox(height: getHeight(d_2));
  static final SizedBox sbHeight3 = SizedBox(height: getHeight(d_3));
  static final SizedBox sbHeight4 = SizedBox(height: getHeight(d_4));
  static final SizedBox sbHeight5 = SizedBox(height: getHeight(d_5));
  static final SizedBox sbHeight6 = SizedBox(height: getHeight(d_6));
  static final SizedBox sbHeight60 = SizedBox(height: getHeight(d_60));
  static final SizedBox sbHeight7 = SizedBox(height: getHeight(d_7));
  static final SizedBox sbHeight8 = SizedBox(height: getHeight(d_8));
  static final SizedBox sbHeight9 = SizedBox(height: getHeight(d_9));
  static final SizedBox sbHeight10 = SizedBox(height: getHeight(d_10));
  static final SizedBox sbHeight100 = SizedBox(height: getHeight(d_100));
  static final SizedBox sbHeight11 = SizedBox(height: getHeight(d_11));
  static final SizedBox sbHeight12 = SizedBox(height: getHeight(d_12));
  static final SizedBox sbHeight13 = SizedBox(height: getHeight(d_13));
  static final SizedBox sbHeight14 = SizedBox(height: getHeight(d_14));
  static final SizedBox sbHeight15 = SizedBox(height: getHeight(d_15));
  static final SizedBox sbHeight16 = SizedBox(height: getHeight(d_16));
  static final SizedBox sbHeight17 = SizedBox(height: getHeight(d_17));
  static final SizedBox sbHeight18 = SizedBox(height: getHeight(d_18));
  static final SizedBox sbHeight19 = SizedBox(height: getHeight(d_19));
  static final SizedBox sbHeight20 = SizedBox(height: getHeight(d_20));
  static final SizedBox sbHeight22 = SizedBox(height: getHeight(d_22));
  static final SizedBox sbHeight24 = SizedBox(height: getHeight(d_24));
  static final SizedBox sbHeight25 = SizedBox(height: getHeight(d_25));
  static final SizedBox sbHeight26 = SizedBox(height: getHeight(d_26));
  static final SizedBox sbHeight28 = SizedBox(height: getHeight(d_28));
  static final SizedBox sbHeight30 = SizedBox(height: getHeight(d_30));
  static final SizedBox sbHeight34 = SizedBox(height: getHeight(d_34));
  static final SizedBox sbHeight35 = SizedBox(height: getHeight(d_35));

  static final SizedBox sbHeight39 = SizedBox(height: getHeight(d_39));
  static final SizedBox sbHeight44 = SizedBox(height: getHeight(d_44));
  static final SizedBox sbHeight40 = SizedBox(height: getHeight(d_40));
  static final SizedBox sbHeight45 = SizedBox(height: getHeight(d_45));
  static final SizedBox sbHeight48 = SizedBox(height: getHeight(d_48));
  static final SizedBox sbHeight51 = SizedBox(height: getHeight(d_51));
  static final SizedBox sbHeight55 = SizedBox(height: getHeight(d_55));

  static final SizedBox sbHeight91 = SizedBox(height: getHeight(d_91));
  static final SizedBox sbHeight90 = SizedBox(height: getHeight(d_90));
  static final SizedBox sbHeight117 = SizedBox(height: getHeight(d_117));

  static final SizedBox sbHeight73 = SizedBox(height: getHeight(d_73));
  static final SizedBox sbWidth1 = SizedBox(width: getWidth(d_1));
  static final SizedBox sbWidth2 = SizedBox(width: getWidth(d_2));
  static final SizedBox sbWidth3 = SizedBox(width: getWidth(d_3));
  static final SizedBox sbWidth4 = SizedBox(width: getWidth(d_4));
  static final SizedBox sbWidth5 = SizedBox(width: getWidth(d_5));
  static final SizedBox sbWidth6 = SizedBox(width: getWidth(d_6));
  static final SizedBox sbWidth7 = SizedBox(width: getWidth(d_7));
  static final SizedBox sbWidth8 = SizedBox(width: getWidth(d_8));
  static final SizedBox sbWidth9 = SizedBox(width: getWidth(d_9));
  static final SizedBox sbWidth10 = SizedBox(width: getWidth(d_10));
  static final SizedBox sbWidth11 = SizedBox(width: getWidth(d_11));
  static final SizedBox sbWidth12 = SizedBox(width: getWidth(d_12));
  static final SizedBox sbWidth13 = SizedBox(width: getWidth(d_13));
  static final SizedBox sbWidth14 = SizedBox(width: getWidth(d_14));
  static final SizedBox sbWidth15 = SizedBox(width: getWidth(d_15));
  static final SizedBox sbWidth16 = SizedBox(width: getWidth(d_16));
  static final SizedBox sbWidth20 = SizedBox(width: getWidth(d_20));
  static final SizedBox sbWidth28 = SizedBox(width: getWidth(d_28));
  static final SizedBox sbWidth30 = SizedBox(width: getWidth(d_30));
  static final SizedBox sbWidth35 = SizedBox(width: getWidth(d_35));
  static final SizedBox sbWidth38 = SizedBox(width: getWidth(d_35));

  static final SizedBox sbWidth40 = SizedBox(width: getWidth(d_40));
  static final SizedBox sbWidth50 = SizedBox(width: getWidth(d_50));
  static final SizedBox sbHeight70 = SizedBox(height: getHeight(d_70));
  static final SizedBox sbHeight85 = SizedBox(height: getHeight(d_85));
  static final SizedBox sbHeight88 = SizedBox(width: getWidth(d_88));
  static final SizedBox bottomSpace = SizedBox(height: getHeight(d_20));
  static final SizedBox bottomSheetSpace = SizedBox(height: getHeight(d_34));

  /// Set the status bar color to the widget
  static void setStatusBarTheme(
      {Color bottomBarColor = Colors.black, Color topBarColor = Colors.black}) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: topBarColor, //top bar color
        statusBarIconBrightness: Brightness.light, //top bar icons
        systemNavigationBarColor: bottomBarColor, //bottom bar color
        systemNavigationBarIconBrightness: Brightness.light, //bottom bar icons
      ),
    );
  }

  /// Method used to set device orientation of the app
  static void setDeviceOrientationOfApp() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  /// Method used get app theme
  static ThemeData getAppTheme() {
    return ThemeData(
      appBarTheme: const AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
      primaryColor: CommonColor.instance.backgroundColor,
      pageTransitionsTheme: const PageTransitionsTheme(
        builders: {
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          TargetPlatform.android: CupertinoPageTransitionsBuilder(),
        },
      ),
      fontFamily: FontFamily.fontFamilyRiposte,
      textSelectionTheme: TextSelectionThemeData(cursorColor: Colors.black),
      colorScheme: ColorScheme.fromSwatch(
        primarySwatch: AppColors.primarySwatch,
      ),
    );
  }

  static TextStyle white16TextStyle =
      TextStyle(color: Colors.white, fontSize: 16);

  static TextStyle black16TextStyle =
      TextStyle(color: Colors.black, fontSize: 16);
}

class FontFamily {
  static const fontFamilyRiposte = 'RiposteFoodstepsSS1';
}
