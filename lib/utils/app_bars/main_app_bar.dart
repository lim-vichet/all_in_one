
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../global_use.dart';
import '../constants/app_font_styles.dart';

Widget mainAppBar({
  required String appBarTitle ,
  Function()? backClick,
  Color colorIconBack = Colors.white,
  Widget? iconRight,
  Widget? noYes,

  bool isShowIconBack = true,
  required Widget child,
}){
  return  Stack(
    children: [
      SizedBox(
        width: screenWidth,
        child: Image.asset(
          "assets/images/image_png/header_app_bar.png"),
      ),
      Positioned(
        top: screenHeight * 0.077,
        left: 0,
        right: 0,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 5.px),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              noYes == null?
              SizedBox.shrink():

              Container(
                width: 40,
                color: Colors.yellow,
              ),
              isShowIconBack ?
              SizedBox(
                width: 40,
                // color: Colors.yellow,
                child: IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: backClick,
                    icon: Icon(Icons.arrow_back_ios_new,
                        color: colorIconBack)),
              ):
              const SizedBox.shrink(),
              Expanded(
                child: Center(
                  child: Container(
                    width: screenWidth * 0.75,
                    alignment: Alignment.center,
                    child: Center(
                      child: Text(
                        textAlign: TextAlign.center,
                        appBarTitle,
                        style: AppTextStyle().titleAppBar(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                width: 50,
              ),
            ],
          ),
        ),
      ),
      iconRight == null
          ? const SizedBox.shrink()
          : Positioned(
          top: screenHeight *0.09,
          right: 15,
          child: Container(child: iconRight)),
      Positioned(
          top: screenHeight * 0.15,
          left: 0,
          right: 0,
          bottom: 0,
          child: child
      ),
    ],
  );
}