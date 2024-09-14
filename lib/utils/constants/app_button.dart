import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../global_use.dart';
import 'app_font_styles.dart';


class AppButton extends StatelessWidget {
  final double width;
  final double height;
  final Function onPressed;
  final Color backgroundColor;
  final double borderRadius;
  final String text;
  final Color textColor;
  final double fontSize;
  final FontWeight fontWeight;
  final IconData? icon;
  final bool isIcon;
  const AppButton({
    Key? key,
    this.width=0,
    this.height=0,
    required this.onPressed,
    this.backgroundColor= const Color(0xff1FA8E0),
    this.borderRadius=5,
    this.textColor=Colors.white,
    required this.text,
    this.fontSize=16,
    this.fontWeight=FontWeight.bold,
    this.icon,
    this.isIcon=false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width == 0 ? double.infinity : width,
      height: height == 0 ? 50.px : height,
      child: ElevatedButton(
          onPressed:(){
            onPressed();
          },
          style: ElevatedButton.styleFrom(
              backgroundColor: backgroundColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(borderRadius)
              )
          ),
          child: Row(
            mainAxisAlignment: isIcon ? MainAxisAlignment.spaceAround : MainAxisAlignment.center,
            children: [
              isIcon ? Icon(icon) : Container() ,
              Text(text.tr,style: TextStyle(
                  fontSize: fontSize,
                  color: textColor,
                  fontWeight: fontWeight
              ),),
            ],
          )
      ),
    );
  }
}




// fot two button
class App2Button extends StatelessWidget {
  final String textTitleLeft;
  final String textTitleRight;
  final Function() onTapBtnLeft;
  final Function() onTapBtnRight;
  final Widget? childLeft;
  final Widget? childRight;
  final double? height;
  final Color? bgLeft ;
  final Color? bgRight;
  final Color? textColorLeft;
  final Color? textColorRight;
  final double? marginBnt;
  final bool showIconBtnLeft;
  final bool showIconBtnRight;
  final double? borderRadius ;

  const App2Button({
    super.key,
    required this.textTitleLeft,
    required this.textTitleRight,
    required this.onTapBtnLeft,
    required this.onTapBtnRight,
    this.height,
    this.childLeft,
    this.childRight,
    this.bgLeft,
    this.bgRight,
    this.textColorLeft,
    this.textColorRight,
    this.marginBnt,
    this.showIconBtnLeft = false,
    this.showIconBtnRight = false,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 50.00,
      width: screenWidth,
      child: Row(
        children: [
          Expanded(
              child: GestureDetector(
                onTap: (){
                  onTapBtnLeft();
                },
                child: Container(
                  alignment: Alignment.center,
                  height: height ?? 50.00,
                  decoration: BoxDecoration(
                      color: bgLeft ?? Colors.white,
                    borderRadius: BorderRadius.circular(borderRadius?? 5.00),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey
                            .withOpacity(
                            0.2),
                        offset:
                        const Offset(
                            0, 0),
                        blurRadius: 5,
                        spreadRadius: 1,
                      ), //BoxShadow
                    ],
                  ),
                  child: showIconBtnLeft?
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: childLeft,
                      ),
                      SizedBox(width: showIconBtnLeft ?10.px:0.px),
                      Text(
                        textTitleLeft,
                        style: AppTextStyle().textButton(
                          color: textColorLeft?? Colors.white,
                        ),
                      ),
                    ],
                  ):
                  Text(
                    textTitleLeft,
                    style: AppTextStyle().textButton(
                      color: textColorLeft?? Colors.white,
                    ),
                  ),
                ),
              )
          ),
          SizedBox(
            width: marginBnt ?? 15.px,
          ),
          Expanded(
              child: GestureDetector(
                onTap: (){
                  onTapBtnRight();
                },
                child: Container(
                  alignment: Alignment.center,
                  height: height ?? 50.00,
                  decoration: BoxDecoration(
                    color: bgRight ?? Colors.white,
                    borderRadius: BorderRadius.circular(borderRadius??5.00),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey
                            .withOpacity(
                            0.2),
                        offset:
                        const Offset(
                            0, 0),
                        blurRadius: 5,
                        spreadRadius: 1,
                      ), //BoxShadow
                    ],
                  ),
                  child: showIconBtnRight ?
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: childRight,
                      ),
                      SizedBox(width: showIconBtnRight ? 10.px:0.px),
                      Text(
                        textTitleRight,
                        style: AppTextStyle().textButton(
                          color: textColorRight?? Colors.white,
                        ),
                      ),
                    ],
                  ):
                  Text(
                      textTitleRight,
                      style: AppTextStyle().textButton(
                        color: textColorRight?? Colors.white,
                      ),
                    ),
                ),
              )
          ),
        ],
      ),
    );
  }
}




