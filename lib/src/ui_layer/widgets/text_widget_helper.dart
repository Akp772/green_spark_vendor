import 'package:flutter/material.dart';
import 'package:green_spark_vendor/src/data_layer/res/colors.dart';
import 'package:green_spark_vendor/src/data_layer/res/numbers.dart';
import 'package:green_spark_vendor/src/data_layer/res/styles.dart';

/// foodSteps Common title Text Used
class CommonText extends StatelessWidget {
  const CommonText(
      {Key? key,
      required this.text,
      this.textAlign = TextAlign.start,
      this.height = 0,
      this.color = AppColors.blackTextColor,
      this.overflow,
      this.textDecoration = TextDecoration.none,
      this.fontSize = d_45,
      this.maxLines,
      this.minFontSize})
      : super(key: key);
  final String text;
  final double fontSize;
  final TextAlign textAlign;
  final double height;
  final Color color;
  final TextOverflow? overflow;
  final TextDecoration textDecoration;
  final int? maxLines;
  final double? minFontSize;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
      style: TextStyle(
          color: color,
          fontSize: (fontSize),
          height: height,
          decoration: textDecoration,
          fontWeight: FontWeight.w300),
    );
  }
}

class SubTitleText extends StatelessWidget {
  const SubTitleText(
      {Key? key,
      required this.text,
      this.textAlign = TextAlign.start,
      this.height = onePointFive,
      this.color = Colors.white,
      this.overflow,
      this.textDecoration = TextDecoration.none,
      this.fontSize = d_14,
      this.maxLines,
      this.minFontSize})
      : super(key: key);
  final String text;
  final double fontSize;
  final TextAlign textAlign;
  final double height;
  final Color color;
  final TextOverflow? overflow;
  final TextDecoration textDecoration;
  final int? maxLines;
  final double? minFontSize;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
      style: TextStyle(
        color: color,
        fontSize: AppStyles.getFontSize(fontSize),

        ///fontFamily: FontFamily.fontFamilyPoppins,
        fontWeight: FontWeight.w400,
        height: height,
        decoration: textDecoration,
      ),
    );
  }
}

class PoppinsMediumText extends StatelessWidget {
  const PoppinsMediumText({
    Key? key,
    required this.text,
    this.textAlign = TextAlign.start,
    this.height = d_1,
    this.color = Colors.white,
    this.overflow,
    this.textDecoration = TextDecoration.none,
    required this.fontSize,
    this.maxLines,
  }) : super(key: key);
  final int? maxLines;
  final String text;
  final double fontSize;
  final TextAlign textAlign;
  final double height;
  final Color color;
  final TextOverflow? overflow;
  final TextDecoration textDecoration;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
      style: TextStyle(
        color: color,
        fontSize: AppStyles.getFontSize(fontSize),
        fontWeight: FontWeight.w500,
        height: height,
        decoration: textDecoration,
      ),
    );
  }
}

///fontWeight = 600
class PoppinsSemiBoldText extends StatelessWidget {
  const PoppinsSemiBoldText(
      {Key? key,
      required this.text,
      this.textAlign = TextAlign.start,
      this.height = d_1,
      this.color = Colors.white,
      this.overflow,
      this.textDecoration = TextDecoration.none,
      required this.fontSize,
      this.maxLines,
      this.minFontSize})
      : super(key: key);
  final int? maxLines;
  final String text;
  final double fontSize;
  final TextAlign textAlign;
  final double height;
  final Color color;
  final TextOverflow? overflow;
  final TextDecoration textDecoration;
  final double? minFontSize;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
      style: TextStyle(
        color: color,
        fontSize: AppStyles.getFontSize(fontSize),

        ///fontFamily: FontFamily.fontFamilyPoppins,
        fontWeight: FontWeight.w600,
        height: height,
        decoration: textDecoration,
      ),
    );
  }
}

class PoppinsSemiBoldSecondText extends StatelessWidget {
  const PoppinsSemiBoldSecondText({
    Key? key,
    required this.text,
    this.textAlign = TextAlign.start,
    this.height = d_1,
    this.color = Colors.white,
    this.overflow,
    this.textDecoration = TextDecoration.none,
    required this.fontSize,
    this.maxLines,
  }) : super(key: key);
  final String text;
  final double fontSize;
  final TextAlign textAlign;
  final double height;
  final Color color;
  final TextOverflow? overflow;
  final TextDecoration textDecoration;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
      style: TextStyle(
        color: color,
        fontSize: AppStyles.getFontSize(fontSize),
        fontWeight: FontWeight.w700,
        height: height,
        decoration: textDecoration,
      ),
    );
  }
}

class PoppinsBoldText extends StatelessWidget {
  const PoppinsBoldText({
    Key? key,
    required this.text,
    required this.fontSize,
    this.textAlign = TextAlign.start,
    this.height = d_1,
    this.color = Colors.white,
    this.overflow,
    this.textDecoration = TextDecoration.none,
    this.maxLines,
  }) : super(key: key);
  final int? maxLines;
  final String text;
  final double fontSize;
  final TextAlign textAlign;
  final double height;
  final Color color;
  final TextOverflow? overflow;
  final TextDecoration textDecoration;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
      style: TextStyle(
        color: color,
        fontSize: AppStyles.getFontSize(fontSize),
        fontWeight: FontWeight.w800,
        height: height,
        decoration: textDecoration,
      ),
    );
  }
}

class PoppinsExtraBoldText extends StatelessWidget {
  const PoppinsExtraBoldText({
    Key? key,
    required this.text,
    this.textAlign = TextAlign.start,
    this.height = d_1,
    this.color = Colors.white,
    this.overflow,
    this.textDecoration = TextDecoration.none,
    required this.fontSize,
    this.maxLines,
  }) : super(key: key);
  final int? maxLines;
  final String text;
  final double fontSize;
  final TextAlign textAlign;
  final double height;
  final Color color;
  final TextOverflow? overflow;
  final TextDecoration textDecoration;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      overflow: overflow,
      style: TextStyle(
        color: color,
        fontSize: AppStyles.getFontSize(fontSize),
        fontWeight: FontWeight.w900,
        height: height,
        decoration: textDecoration,
      ),
    );
  }
}

class HeadlineText extends StatelessWidget {
  const HeadlineText({
    Key? key,
    required this.text,
    this.textAlign = TextAlign.start,
    this.height = d_1,
    this.color = AppColors.whiteColor,
    this.overflow,
    this.textDecoration = TextDecoration.none,
    this.fontSize = d_24,
    this.maxLines,
  }) : super(key: key);
  final String text;
  final double fontSize;
  final TextAlign textAlign;
  final double height;
  final Color color;
  final TextOverflow? overflow;
  final TextDecoration textDecoration;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
      style: TextStyle(
        color: color,
        fontSize: AppStyles.getFontSize(fontSize),
        fontWeight: FontWeight.w700,
        height: height,
        decoration: textDecoration,
      ),
    );
  }
}
