import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../global_use.dart';
import '../constants/app_font_styles.dart';

Widget mainAppBarCurved({
  required String appBarTitle,
  required Function? backClick,
  double paddingLeft = 12,
  double paddingRight = 12,
  double bodyMarginBottom = 25,
  Widget? iconRight,
  Widget? button,
  Color iconBackColor = Colors.white,
  required Widget child,
}) {
  return Stack(
    children: [
      Container(
        width: 1000,
        height: 300,
        color: Colors.orangeAccent,
        child: Image.network("https://png.pngtree.com/background/20210715/original/pngtree-blue-technology-circuit-style-background-picture-image_1306799.jpg")
      ),
      Positioned(
        top: screenHeight * 0.08,
        left: 0,
        right: 0,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 5.px),
          child: Row(
            children: [
              SizedBox(
                width: 40,
                //color: Colors.yellow,
                child: IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: () => backClick!(),
                    icon: Icon(Icons.arrow_back_ios_new,
                        color: iconBackColor)),
              ),
              Expanded(
                child: Container(
                  width: screenWidth * 0.75,
                  alignment: Alignment.center,
                  child: Text(
                    textAlign: TextAlign.center,
                    appBarTitle,
                    style: AppTextStyle().titleAppBar(color: Colors.white),
                  ),
                ),
              ),
              Container(width: 50),
            ],
          ),
        ),
      ),
      iconRight == null
          ? const SizedBox.shrink()
          : Positioned(
          top: screenHeight * 0.09,
          right: 13,
          child: Container(child: iconRight)),
      Positioned(
        top: screenHeight * 0.16,
        left: paddingLeft.px,
        right: paddingRight.px,
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
