import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../global_use.dart';

Widget homeAppBarCurved({
  required Widget appBarTitle,
  required Function? backClick,
  double paddingLeft = 12,
  double paddingRight = 12,
  double bodyMarginBottom = 25,
  Widget? iconRightR,
  double? paddingIconRandL,
  Widget? iconRightL,
  Widget? button,
  Color iconBackColor = Colors.white,
  required Widget child,
}) {
  return Stack(
    children: [
      SizedBox(
        width: screenWidth,
        child: Image.asset(
          "assets/images/image_png/header_app_bar_ellipse.png",
          fit: BoxFit.cover,
        ),
      ),
      Positioned(
        top: screenHeight * 0.06,
        left: 0,
        right: 0,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 5.px),
          child: Row(
            children: [
              SizedBox(
                width: 40.px,
                //color: Colors.yellow,
                child: IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: () => backClick!(),
                    icon: Icon(Icons.menu_rounded,
                        color: iconBackColor)),
              ),
              Expanded(
                child: Container(
                  width: screenWidth * 0.7,
                  alignment: Alignment.center,
                  child: appBarTitle,
                ),
              ),
              Container(width: 50),
            ],
          ),
        ),
      ),
      iconRightR == null
          ? const SizedBox.shrink()
          : Positioned(
          top: screenHeight * 0.09,
          right: 13,
          child: Row(
            children: [
              Container(
                  child: iconRightL
              ),
              SizedBox(width: paddingIconRandL ?? 5.px),
              Container(
                  child: iconRightR
              ),
            ],
          )
      ),
      Positioned(
        top: screenHeight * 0.16,
        left: paddingLeft,
        right: paddingRight,
        bottom: 0,
        child: Container(
          color: Colors.transparent,
            margin: EdgeInsets.only(bottom: bodyMarginBottom),
            width: screenWidth,
            height: screenHeight,
            child: child),
      ),
    ],
  );
}
