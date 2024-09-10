import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../constants/app_colors.dart';
import '../constants/app_dimensions.dart';
import '../global_use.dart';

Widget mainAppBarCurvedHasSearch({
  required Function? backClick,
  final Function(String value)? onChange,
  final Function(String value)? onSubmit,
  final Function()? onEditingComplete,
  final Function()? onTap,
  final Widget? prefixIcon,
  final Widget? suffixIcon,
  final String? hinText,
  final EdgeInsetsGeometry? contentPadding,
  final double? radiusSearch,
  final bool? readOnly,
  final Color? colorHinText,
  double paddingLeft = 10,
  double paddingRight = 10,
  double bodyMarginBottom = 25,
  Widget? button,
  bool? autofocus,
  Color iconBackColor = Colors.white,
  required TextEditingController controller,
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
        top: screenHeight * 0.07,
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
                    icon: Icon(Icons.arrow_back_ios_new, color: iconBackColor)),
              ),
              Expanded(
                child: Container(
                  width: screenWidth * 0.75,
                  alignment: Alignment.center,
                  child: Container(
                    margin: EdgeInsets.only(
                        left: AppDimension().smallSpace,
                        right: AppDimension().smallSpace,
                        top: 15.px,
                        bottom: 12.px),
                    child: Container(
                      height: 45.px,
                      width: double.infinity,
                      decoration: BoxDecoration(
                              color: AppColors().white,
                              borderRadius:
                                  BorderRadius.circular(radiusSearch ?? 5.px),
                      ),
                      child: TextField(
                        textAlignVertical: TextAlignVertical.center,
                        controller: controller,
                        onTap: () => onTap!(),
                        onChanged: (value) {
                          onChange!(value);
                        },
                        onEditingComplete: () => onEditingComplete!(),
                        onSubmitted: (value) {
                            onSubmit!(value);
                        },
                        autofocus: autofocus?? false,
                        readOnly: readOnly ?? false,
                        decoration: InputDecoration(
                          hintStyle: TextStyle(
                            fontSize: 14.px,
                            color: colorHinText ?? Colors.grey,
                          ),
                          prefixIcon: prefixIcon ??
                              Container(
                                margin: EdgeInsets.only(
                                  left: 2.px,
                                  top: 13.px,
                                  bottom: 13.px,
                                ),
                                child: SvgPicture.asset(
                                  "assets/icons/icons_svg/ic_search.svg",
                                ),
                              ),
                          suffixIcon: suffixIcon,
                          hintText: hinText ?? 'Search'.tr,
                          contentPadding:
                              contentPadding ?? EdgeInsets.only(bottom: 8.px),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ), // box search,
                ),
              ),
              Container(width: 5.px),
            ],
          ),
        ),
      ),
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
