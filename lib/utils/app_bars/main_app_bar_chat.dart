
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../global_use.dart';
import '../constants/app_font_styles.dart';

Widget mainAppBarChat({
  required String appBarTitle ,
  Function? onClick,
  required Widget? subText ,
  Function()? backClick,
  Color colorIconBack = Colors.white,
  bool isShowIconBack = true,
  required Widget child,
  required Widget? childR,
  required Widget? childImage,
  required String isChangeHeader,
  Widget? childHeader,
}){
  return  Stack(
    children: [
      SizedBox(
        width: screenWidth,
        child: Image.asset(
          "assets/images/image_png/header_app_bar.png"),
      ),
      Positioned(
        top: isChangeHeader == "selected" ? screenHeight * 0.08:  screenHeight * 0.07,
        left: 0,
        right: 0,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 5.px),
          child: Builder(
            builder: (context) {
              if(isChangeHeader == "selected"){
                return Container(
                  child: childHeader,
                );
              }else{
                return  Row(
                  children: [
                    isShowIconBack ?
                    Container(
                      width: 40.px,
                      child: IconButton(
                          padding: EdgeInsets.zero,
                          onPressed: backClick,
                          icon: Icon(Icons.arrow_back_ios_new,
                              color: colorIconBack)),
                    ):
                    const SizedBox.shrink(),
                    Expanded(
                      child: GestureDetector(
                        onTap: ()=> onClick!(),
                        child: Row(
                          children: [
                            Container(
                              padding: EdgeInsets.only(
                                  right: 15.px
                              ),
                              child: childImage,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    padding: EdgeInsets.only(
                                        bottom: 5.px
                                    ),
                                    child: Text(
                                      appBarTitle,
                                      style: AppTextStyle().titleAppBar(color: Colors.white,fontSize: 16),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                    ),
                                  ),
                                  Container(
                                    child: subText,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      // color: Colors.yellow,
                      width: 100.px,
                      // width: 145.px,
                      child: childR,
                    ),
                  ],
                );
              }
            }
          ),
        ),
      ),
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