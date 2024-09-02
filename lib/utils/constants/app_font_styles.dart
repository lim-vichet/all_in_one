import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'app_colors.dart';

class AppTextStyle {
  static final AppTextStyle _singleton = AppTextStyle._internal();

  factory AppTextStyle() {
    return _singleton;
  }

  AppTextStyle._internal();

  TextStyle primaryTitle(
      {double fontSize = 16,
        Color color = Colors.black,
        Color stokeColor = Colors.white,
        bool hasStroke=false,
        double lineHeight = 0,
        FontWeight fontWeight = FontWeight.bold,
        String fontFamily = "",
        TextDecoration? textDecoration,
      }) {
    return TextStyle(
        fontSize: fontSize.sp,
        fontWeight: fontWeight,
        color: color,
        fontFamily: fontFamily,
        decoration: textDecoration,
        height: lineHeight.px,
        shadows: !hasStroke?null: [
          Shadow( // bottomLeft
              offset: const Offset(-1.5, -1.5),
              color: stokeColor
          ),
          Shadow( // bottomRight
              offset: const Offset(1.5, -1.5),
              color: stokeColor
          ),
          Shadow( // topRight
              offset: const Offset(1.5, 1.5),
              color: stokeColor
          ),
          Shadow( // topLeft
              offset: const Offset(-1.5, 1.5),
              color: stokeColor
          ),
        ]
    );
  }
  TextStyle titleL(
      {double fontSize = 20,
        Color color = Colors.black,
        double lineHeight = 0,
        FontWeight fontWeight = FontWeight.bold,
        String fontFamily = "",
        Color stokeColor = Colors.white,
        bool hasStroke=false,
        TextDecoration? textDecoration}) {
    return TextStyle(
        fontSize: fontSize.sp,
        fontWeight: fontWeight,
        color: color,
        fontFamily: fontFamily,
        decoration: textDecoration,
        height: lineHeight.px,
        shadows: !hasStroke?null: [
          Shadow( // bottomLeft
              offset: const Offset(-1.5, -1.5),
              color: stokeColor
          ),
          Shadow( // bottomRight
              offset: const Offset(1.5, -1.5),
              color: stokeColor
          ),
          Shadow( // topRight
              offset: const Offset(1.5, 1.5),
              color: stokeColor
          ),
          Shadow( // topLeft
              offset: const Offset(-1.5, 1.5),
              color: stokeColor
          ),
        ]
    );
  }

  TextStyle titleM(
      {double fontSize = 17,
        Color color = Colors.black,
        double lineHeight = 0,
        FontWeight fontWeight = FontWeight.bold,
        String fontFamily = "",
        Color stokeColor = Colors.white,
        bool hasStroke=false,
        TextDecoration? textDecoration}) {
    return TextStyle(
        fontSize: fontSize.sp,
        fontWeight: fontWeight,
        color: color,
        fontFamily: fontFamily,
        decoration: textDecoration,
        height: lineHeight.sp,
        shadows: !hasStroke?null: [
          Shadow( // bottomLeft
              offset: const Offset(-1.5, -1.5),
              color: stokeColor
          ),
          Shadow( // bottomRight
              offset: const Offset(1.5, -1.5),
              color: stokeColor
          ),
          Shadow( // topRight
              offset: const Offset(1.5, 1.5),
              color: stokeColor
          ),
          Shadow( // topLeft
              offset: const Offset(-1.5, 1.5),
              color: stokeColor
          ),
        ]
    );
  }

  TextStyle titleS(
      {double fontSize = 15,
        Color color = Colors.black,
        double lineHeight = 0,
        FontWeight fontWeight = FontWeight.w500,
        String fontFamily = "",
        Color stokeColor = Colors.white,
        bool hasStroke=false,
        TextDecoration? textDecoration}) {
    return TextStyle(
        fontSize: fontSize.sp,
        fontWeight: fontWeight,
        color: color,
        fontFamily: fontFamily,
        decoration: textDecoration,
        height: lineHeight.sp,
        shadows: !hasStroke?null: [
          Shadow( // bottomLeft
              offset: const Offset(-1.5, -1.5),
              color: stokeColor
          ),
          Shadow( // bottomRight
              offset: const Offset(1.5, -1.5),
              color: stokeColor
          ),
          Shadow( // topRight
              offset: const Offset(1.5, 1.5),
              color: stokeColor
          ),
          Shadow( // topLeft
              offset: const Offset(-1.5, 1.5),
              color: stokeColor
          ),
        ]
    );
  }
  TextStyle primaryText(
      {double fontSize = 15,
        Color color = Colors.black,
        double lineHeight = 0,
        Color stokeColor = Colors.white,
        bool hasStroke=false,
        FontWeight fontWeight = FontWeight.normal,
        String fontFamily = "",
        TextDecoration? textDecoration}) {
    return TextStyle(
        fontSize: fontSize.sp,
        fontWeight: fontWeight,
        color: color,
        fontFamily: fontFamily,
        decoration: textDecoration,
        height: lineHeight.sp,
        shadows: !hasStroke?null: [
          Shadow( // bottomLeft
              offset: const Offset(-1.5, -1.5),
              color: stokeColor
          ),
          Shadow( // bottomRight
              offset: const Offset(1.5, -1.5),
              color: stokeColor
          ),
          Shadow( // topRight
              offset: const Offset(1.5, 1.5),
              color: stokeColor
          ),
          Shadow( // topLeft
              offset: const Offset(-1.5, 1.5),
              color: stokeColor
          ),
        ]
    );
  }
  TextStyle textL(
      {double fontSize = 18,
        Color color = Colors.black,
        double lineHeight = 0,
        Color stokeColor = Colors.white,
        bool hasStroke=false,
        FontWeight fontWeight = FontWeight.normal,
        String fontFamily = "",
        TextDecoration? textDecoration}) {
    return TextStyle(
        fontSize: fontSize.sp,
        fontWeight: fontWeight,
        color: color,
        fontFamily: fontFamily,
        decoration: textDecoration,
        height: lineHeight.sp,
        shadows: !hasStroke?null: [
          Shadow( // bottomLeft
              offset: const Offset(-1.5, -1.5),
              color: stokeColor
          ),
          Shadow( // bottomRight
              offset: const Offset(1.5, -1.5),
              color: stokeColor
          ),
          Shadow( // topRight
              offset: const Offset(1.5, 1.5),
              color: stokeColor
          ),
          Shadow( // topLeft
              offset: const Offset(-1.5, 1.5),
              color: stokeColor
          ),
        ]
    );
  }

  TextStyle textM(
      {double fontSize = 15.5,
        Color color = Colors.black,
        double lineHeight = 0,

        FontWeight fontWeight = FontWeight.normal,
        String fontFamily = "",
        Color stokeColor = Colors.white,
        bool hasStroke=false,
        TextDecoration? textDecoration}) {
    return TextStyle(
      fontSize: fontSize.sp,
      fontWeight: fontWeight,
      color: color,
      fontFamily: fontFamily,
      decoration: textDecoration,
      height: lineHeight.sp,
    );
  }


  TextStyle textTitleDialog(
      {double fontSize = 15.5,
        Color color = Colors.black,
        double lineHeight = 0,

        FontWeight fontWeight = FontWeight.normal,
        String fontFamily = "",
        Color stokeColor = Colors.white,
        bool hasStroke=false,
        TextDecoration? textDecoration}) {
    return TextStyle(
      fontSize: fontSize.sp,
      fontWeight: fontWeight,
      color: color,
      fontFamily: fontFamily,
      decoration: textDecoration,
      height: lineHeight.sp,
    );
  }

  TextStyle textS(
      {double fontSize = 15,
        Color color = Colors.black,
        double lineHeight = 0,
        FontWeight fontWeight = FontWeight.normal,
        String fontFamily = "",
        Color stokeColor = Colors.white,
        bool hasStroke=false,
        TextDecoration? textDecoration,}) {
    return TextStyle(
        fontSize: fontSize.sp,
        fontWeight: fontWeight,
        color: color,
        fontFamily: fontFamily,
        decoration: textDecoration,
        height: lineHeight.sp,
        shadows: !hasStroke?null: [
          Shadow( // bottomLeft
              offset: const Offset(-1.5, -1.5),
              color: stokeColor
          ),
          Shadow( // bottomRight
              offset: const Offset(1.5, -1.5),
              color: stokeColor
          ),
          Shadow( // topRight
              offset: const Offset(1.5, 1.5),
              color: stokeColor
          ),
          Shadow( // topLeft
              offset: const Offset(-1.5, 1.5),
              color: stokeColor
          ),
        ]
    );
  }

  TextStyle textValidate(
      {double fontSize = 14,
        String isError="",
        Color color = Colors.black,
        double lineHeight = 0,
        FontWeight fontWeight = FontWeight.normal,
        String fontFamily = "",
        Color stokeColor = Colors.white,
        bool hasStroke=false,
        TextDecoration? textDecoration,
      }) {
    return TextStyle(
        fontSize: fontSize.sp,
        fontWeight: fontWeight,
        color: isError.isEmpty ? color.withOpacity(0.7) : AppColors().primaryRed,
        fontFamily: fontFamily,
        decoration: textDecoration,
        height: lineHeight.sp,
        shadows: !hasStroke?null: [
          Shadow( // bottomLeft
              offset: const Offset(-1.5, -1.5),
              color: stokeColor
          ),
          Shadow( // bottomRight
              offset: const Offset(1.5, -1.5),
              color: stokeColor
          ),
          Shadow( // topRight
              offset: const Offset(1.5, 1.5),
              color: stokeColor
          ),
          Shadow( // topLeft
              offset: const Offset(-1.5, 1.5),
              color: stokeColor
          ),
        ]
    );
  }


}
