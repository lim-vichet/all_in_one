import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../constants/app_colors.dart';
import '../global_use.dart';
import '../constants/app_font_styles.dart';

Widget mainAppBarNewMessageChat({
  required String appBarTitle,
  Function()? backClick,
  final Function(String value)? onChange,
  final Function(String value)? onSubmit,
  final Function()? onEditingComplete,
  final Function()? onTap,
  final Widget? prefixIcon,
  final Widget? suffixIcon,
  final String? hinText,
  final bool? readOnly,
  Color colorIconBack = Colors.white,
  bool isShowIconBack = true,
  required Widget child,
  required TextEditingController controller,
  bool? autofocus,
  final EdgeInsetsGeometry? contentPadding,
}) {
  return Stack(
    children: [
      SizedBox(
        width: screenWidth,
        child: Image.asset("assets/images/image_png/header_app_bar.png"),
      ),
      Positioned(
        top: screenHeight * 0.044,
        left: 0,
        right: 0,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 5.px),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  isShowIconBack
                      ? Container(
                          width: 40.px,
                          child: IconButton(
                              padding: EdgeInsets.zero,
                              onPressed: backClick,
                              icon:
                                  Icon(Icons.arrow_back, color: colorIconBack)),
                        )
                      : const SizedBox.shrink(),
                  Expanded(
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.only(right: 15.px),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: EdgeInsets.only(bottom: 5.px),
                              child: Text(
                                appBarTitle,
                                style: AppTextStyle().titleAppBar(
                                    color: Colors.white, fontSize: 17),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                width: screenWidth,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.only(
                        left: 15.px,
                        right: 10.px,
                        top: 5.px
                      ),
                      child: Text(
                        "To :",
                        style: AppTextStyle().textS(color: AppColors().white,fontSize: 16),
                      ),
                    ),
                    Expanded(
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
                        autofocus: autofocus ?? false,
                        readOnly: readOnly ?? false,
                        decoration: InputDecoration(
                          hintStyle: TextStyle(
                            fontSize: 14.px,
                            color: Colors.white,
                          ),
                          contentPadding: EdgeInsets.only(
                            bottom: 80.px,
                            left: 0.px,
                            right: 0.px
                          ),
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          focusedErrorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          hintText: 'Type a name or group',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      Positioned(
          top: screenHeight * 0.15, left: 0, right: 0, bottom: 0, child: child),
    ],
  );
}
