import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';


import 'app_colors.dart';
import 'app_images.dart';

class AppSnackBar {

  // snack bar for success
  static showBottomSnackBarSuccess({
    required BuildContext context,
    required String message,
    Widget? icon,
    Color? backgroundColor,
    double? bottomSize,
    double? borderRadius,
    FlushbarPosition? flushBarPosition,
    bool? showProgressIndicator,
  }) {
    Flushbar(
      title: message,
      titleSize: 14,
      message: "Success",
      duration: const Duration(seconds: 3),
      margin: EdgeInsets.only(
        left: 20.px,
        right: 20.px,
        bottom: bottomSize?? 20.px,
      ),
      borderRadius: BorderRadius.circular(borderRadius?? 5.px),
      messageSize: 0,
      backgroundColor: backgroundColor?? AppColors().colorSnackBarSuccess,
      icon: icon ?? Image.asset(AppImages.success),
      showProgressIndicator: showProgressIndicator ?? true,
      flushbarPosition : flushBarPosition?? FlushbarPosition.BOTTOM,
    ).show(context);
  }

  // snack bar for error
  static showBottomSnackBarError({
    required BuildContext context,
    required String message,
     Widget? icon,
     Color? backgroundColor,
     double? bottomSize,
     double? borderRadius,
     FlushbarPosition? flushBarPosition,
     bool? showProgressIndicator,
  }) {
    Flushbar(
      title: message,
      titleSize: 14,
      message: "Message",
      duration: const Duration(seconds: 4),
      margin: EdgeInsets.only(
          left: 20.px,
          right: 20.px,
          bottom: bottomSize?? 20.px,
      ),
      borderRadius: BorderRadius.circular(borderRadius?? 5.px),
      messageSize: 0,
      backgroundColor: backgroundColor?? AppColors().primaryRed ,
      icon: icon ?? Image.asset(AppImages.error),
      showProgressIndicator: showProgressIndicator ?? true,
      flushbarPosition : flushBarPosition?? FlushbarPosition.BOTTOM,
    ).show(context);
  }
}
