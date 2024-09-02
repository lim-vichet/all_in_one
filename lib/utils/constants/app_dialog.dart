import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:toastification/toastification.dart';
import '../../views/widgets/loading/loading.dart';
import '../global_use.dart';
import 'app_colors.dart';
import 'app_dimensions.dart';
import 'app_font_styles.dart';
import 'app_images.dart';

class AppDialog {
  static void alertTopBar(context,
      {required String text,
      AlignmentGeometry alignment = Alignment.topCenter,
      EdgeInsetsGeometry? margin,
      EdgeInsetsGeometry? padding,
      Color bgColor = Colors.white,
      Color textColor = Colors.black54,
      Color? iconColor,
      double iconSize = 25.0,
      double fontSize = 14.0}) {
    showGeneralDialog(
      barrierLabel: "Label",
      barrierDismissible: true,
      barrierColor: Colors.transparent,
      transitionDuration: const Duration(milliseconds: 0),
      context: context,
      pageBuilder: (context, anim1, anim2) {
        return Align(
          alignment: alignment,
          child: Container(
            padding: padding ??
                EdgeInsets.symmetric(horizontal: 15.sp, vertical: 15.sp),
            margin: margin ??
                EdgeInsets.symmetric(horizontal: 20.sp, vertical: 30.sp),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.sp),
                color: bgColor,
                boxShadow: [
                  BoxShadow(
                      blurRadius: 0.5,
                      spreadRadius: 0.7,
                      color: AppColors().grey.withOpacity(0.5),
                      offset: const Offset(0, 0))
                ]),
            child: SizedBox(
              width: screenWidth,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.highlight_off_outlined,
                    size: iconSize,
                    color: iconColor ?? AppColors().red,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    flex: 4,
                    child: Text(
                      text,
                      style: AppTextStyle().textM(
                          textDecoration: TextDecoration.none,
                          color: textColor),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
      transitionBuilder: (context, anim1, anim2, child) {
        return SlideTransition(
          position:
              Tween(begin: Offset(0, 1), end: Offset(0, 0)).animate(anim1),
          child: child,
        );
      },
    );
    Timer(const Duration(seconds: 1), () {
      Get.back();
    });
  }

  //loadingDialog
  static loadingDialog(BuildContext context, {bool isDismissible = false}) {
    showDialog(
        context: context,
        barrierDismissible: isDismissible,
        builder: (context) {
          return LoadingScreen();
        });
  }

  //success dialog
  static alertDialogSuccess(
    BuildContext context, {
    String? title = "Success",
    String? titleButton = "OK",
    VoidCallback? onButtonTap,
    bool? hasDuration = false,
  }) {
    if (hasDuration!) {
      Future.delayed(
          const Duration(seconds: 1),
          onButtonTap ??
              () {
                Navigator.of(context).pop(true);
              });
    }

    var alertStyle = AlertStyle(
      overlayColor: Colors.black45,
      animationType: AnimationType.grow,
      isCloseButton: false,
      isOverlayTapDismiss: false,
      descStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      animationDuration: const Duration(milliseconds: 400),
      alertBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6.0),
        side: const BorderSide(
          color: Colors.black,
        ),
      ),
      titleStyle: const TextStyle(color: Colors.black, fontSize: 16),
    );

    Alert(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
      context: context,
      style: alertStyle,
      image: SvgPicture.asset(AppImages.logo),
      type: AlertType.success,
      title: "$title", //យល់ព្សូមជ្រើសរើសបរិមាណទំនិញ
      buttons: hasDuration!
          ? []
          : [
              DialogButton(
                onPressed: onButtonTap ??
                    () {
                      Get.back();
                      // Get.back();
                    },
                color: AppColors().primaryRed,
                radius: BorderRadius.circular(5.0),
                child: Text(
                  titleButton!,
                  style: AppTextStyle().titleS(color: AppColors().white),
                ),
              ),
            ],
    ).show();
  }

  //success dialog
  static alertDialogSample(
    BuildContext context, {
    String? title = "Success",
    Widget? content,
    Widget? closeIcon,
  }) {
    var alertStyle = AlertStyle(
      overlayColor: Colors.black45,
      animationType: AnimationType.grow,
      isCloseButton: false,
      isOverlayTapDismiss: false,
      descStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      animationDuration: const Duration(milliseconds: 400),
      alertBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
        side: const BorderSide(
          color: Colors.black,
        ),
      ),
      titleStyle: const TextStyle(color: Colors.black, fontSize: 16),
    );

    Alert(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        context: context,
        style: alertStyle,
        content: content ?? const SizedBox(),
        closeIcon: closeIcon,
        buttons: []).show();
  }

  static alertDialogSubmit(
    BuildContext context, {
    String? title = "Success",
    Widget? content,
    Widget? closeIcon,
    VoidCallback? onButtonTap1,
    VoidCallback? onButtonTap2,
    String? titleButton1 = "Cancel",
    String? titleButton2 = "Continue To Order",
  }) {
    var alertStyle = AlertStyle(
      descPadding: EdgeInsets.zero,
      buttonAreaPadding: EdgeInsets.zero,
      overlayColor: Colors.black45,
      isCloseButton: false,
      isOverlayTapDismiss: false,
      animationType: AnimationType.grow,
      descStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.px),
      animationDuration: const Duration(milliseconds: 400),
      titleStyle: const TextStyle(color: Colors.black, fontSize: 16),
    );

    Alert(
        padding: EdgeInsets.zero,
        context: context,
        style: alertStyle,
        content: content ?? const SizedBox(),
        buttons: [
          DialogButton(
            padding: EdgeInsets.zero,
            margin: EdgeInsets.zero,
            onPressed: onButtonTap2 ??
                () {
                  Get.back();
                  // Get.back();
                },
            color: AppColors().grey.withOpacity(0.3),
            child: Text(
              titleButton2!,
              style: AppTextStyle().textS(color: AppColors().black),
            ),
          ),
          DialogButton(
            padding: EdgeInsets.zero,
            margin: EdgeInsets.zero,
            onPressed: onButtonTap1 ??
                () {
                  Get.back();
                  // Get.back();
                },
            color: AppColors().grey.withOpacity(0.3),
            child: Text(
              titleButton1!,
              style: AppTextStyle().textS(color: AppColors().primaryRed),
            ),
          ),
        ]).show();
  }

  //warning dialog
  static alertDialogWarning(BuildContext context,
      {String? title = "Warning",
      String? titleButton = "OK",
      bool? hasDuration = false,
      VoidCallback? onButtonTap,
      bool isIcon = true}) {
    if (hasDuration!) {
      Future.delayed(
          const Duration(seconds: 1),
          onButtonTap ??
              () {
                Navigator.of(context).pop(true);
              });
    }

    var alertStyle = AlertStyle(
      overlayColor: Colors.black45,
      animationType: AnimationType.grow,
      isCloseButton: false,
      isOverlayTapDismiss: false,
      descStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      animationDuration: const Duration(milliseconds: 400),
      alertBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6.0),
        side: const BorderSide(
          color: Colors.black,
        ),
      ),
      titleStyle: const TextStyle(color: Colors.black, fontSize: 16),
    );
    Alert(
      padding: const EdgeInsets.all(20),
      context: context,
      style: alertStyle,
      image: SvgPicture.asset(AppImages.logo),
      type: AlertType.warning,
      title: "$title", //យល់ព្សូមជ្រើសរើសបរិមាណទំនិញ
      buttons: hasDuration
          ? []
          : [
              DialogButton(
                onPressed: onButtonTap ??
                    () {
                      Get.back();
                    },
                color: AppColors().primaryRed,
                radius: BorderRadius.circular(5.0),
                child: Text(
                  titleButton!,
                  style: AppTextStyle().titleS(color: AppColors().white),
                ),
              ),
            ],
    ).show();
  }

  //logout dialog
  static alertDialogLogOut(
    BuildContext context, {
    String? title = "Are you sure want to Logout ?",
    String? titleButtonCancel = "Cancel",
    String? titleButtonOK = "OK",
    bool? hasDuration = false,
    VoidCallback? onButtonTapOK,
    VoidCallback? onButtonTapCancel,
  }) {
    if (hasDuration!) {
      Future.delayed(
          const Duration(seconds: 1),
          onButtonTapOK ??
              () {
                Navigator.of(context).pop(true);
              });
    }

    var alertStyle = AlertStyle(
      overlayColor: Colors.black45,
      animationType: AnimationType.grow,
      isCloseButton: false,
      isOverlayTapDismiss: false,
      descStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      animationDuration: const Duration(milliseconds: 400),
      alertBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6.0),
        side: const BorderSide(
          color: Colors.white,
        ),
      ),
      titleStyle: const TextStyle(color: Colors.black, fontSize: 16),
    );
    Alert(
      padding: const EdgeInsets.all(20),
      context: context,
      style: alertStyle,
      image: AppImages.assetImage('assets/images/icon_logout.png'),
      // image: SvgPicture.asset(AppImages.logo),
      // type: AlertType.warning,
      title: "$title", //យល់ព្សូមជ្រើសរើសបរិមាណទំនិញ
      buttons: hasDuration
          ? []
          : [
              DialogButton(
                onPressed: onButtonTapCancel ??
                    () {
                      Get.back();
                    },
                color: AppColors().primaryBlue,
                radius: BorderRadius.circular(5.0),
                child: Text(
                  titleButtonCancel!,
                  style: AppTextStyle().titleS(color: AppColors().white),
                ),
              ),
              DialogButton(
                onPressed: onButtonTapOK ??
                    () {
                      Get.back();
                    },
                color: AppColors().primaryRed,
                radius: BorderRadius.circular(5.0),
                child: Text(
                  titleButtonOK!,
                  style: AppTextStyle().titleS(color: AppColors().white),
                ),
              ),
            ],
    ).show();
  }

  //logout dialog
  static alertDialogColumButton(
    BuildContext context, {
    String? title = "Have you received the items?",
    String? titleButtonCancel = "No now",
    String? titleButtonOK = "Confirm",
    bool? hasDuration = false,
    VoidCallback? onButtonTapOK,
    VoidCallback? onButtonTapCancel,
  }) {
    if (hasDuration!) {
      Future.delayed(
          const Duration(seconds: 1),
          onButtonTapOK ??
              () {
                Navigator.of(context).pop(true);
              });
    }

    var alertStyle = AlertStyle(
      overlayColor: Colors.black45,
      animationType: AnimationType.grow,
      isCloseButton: false,
      isOverlayTapDismiss: false,
      descStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      animationDuration: const Duration(milliseconds: 400),
      alertBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6.0),
        side: const BorderSide(
          color: Colors.white,
        ),
      ),
      titleStyle: const TextStyle(color: Colors.black, fontSize: 16),
      buttonsDirection: ButtonsDirection.column,
      alertPadding: EdgeInsets.zero,
      descPadding: EdgeInsets.zero,
    );
    Alert(
      // padding: const EdgeInsets.all(20),
      context: context,
      style: alertStyle,
      padding: EdgeInsets.zero,
      title: "$title", //យល់ព្សូមជ្រើសរើសបរិមាណទំនិញ
      buttons: hasDuration
          ? []
          : [
              DialogButton(
                onPressed: onButtonTapOK ??
                    () {
                      Get.back();
                    },
                color: AppColors().primaryRed,
                radius: BorderRadius.circular(12.0),
                child: Text(
                  titleButtonOK!,
                  style: AppTextStyle().titleS(color: AppColors().white),
                ),
              ),
              DialogButton(
                onPressed: onButtonTapCancel ??
                    () {
                      Get.back();
                    },
                color: AppColors().yellowed,
                radius: BorderRadius.circular(12.0),
                child: Text(
                  titleButtonCancel!,
                  style: AppTextStyle().titleS(color: AppColors().white),
                ),
              ),
            ],
    ).show();
  }

  //logout dialog
  static alertDialogDelete(
    BuildContext context, {
    String? title = "Are you sure want to Delete ?",
    String? titleButtonCancel = "Cancel",
    String? titleButtonOK = "OK",
    bool? hasDuration = false,
    VoidCallback? onButtonTapOK,
    VoidCallback? onButtonTapCancel,
  }) {
    if (hasDuration!) {
      Future.delayed(
          const Duration(seconds: 1),
          onButtonTapOK ??
              () {
                Navigator.of(context).pop(true);
              });
    }

    var alertStyle = AlertStyle(
      overlayColor: Colors.black45,
      animationType: AnimationType.grow,
      isCloseButton: false,
      isOverlayTapDismiss: false,
      descStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      animationDuration: const Duration(milliseconds: 400),
      alertBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6.0),
        side: const BorderSide(
          color: Colors.white,
        ),
      ),
      titleStyle: const TextStyle(color: Colors.black, fontSize: 16),
    );
    Alert(
      padding: const EdgeInsets.all(20),
      context: context,
      style: alertStyle,
      // image: AppImages.assetImage('assets/images/icon_logout.png'),
      // image: SvgPicture.asset(AppImages.logo),
      type: AlertType.warning,
      title: "$title", //យល់ព្សូមជ្រើសរើសបរិមាណទំនិញ
      buttons: hasDuration
          ? []
          : [
              DialogButton(
                onPressed: onButtonTapCancel ??
                    () {
                      Get.back();
                    },
                color: AppColors().primaryBlue,
                radius: BorderRadius.circular(5.0),
                child: Text(
                  titleButtonCancel!,
                  style: AppTextStyle().titleS(color: AppColors().white),
                ),
              ),
              DialogButton(
                onPressed: onButtonTapOK ??
                    () {
                      Get.back();
                    },
                color: AppColors().primaryRed,
                radius: BorderRadius.circular(5.0),
                child: Text(
                  titleButtonOK!,
                  style: AppTextStyle().titleS(color: AppColors().white),
                ),
              ),
            ],
    ).show();
  }

  //warning dialog
  static alertDialogWarningNotUser(
    BuildContext context, {
    String? title = "Warning ! You Are Not User!",
    String? titleButton = "OK",
    VoidCallback? onButtonTap,
  }) {
    var alertStyle = AlertStyle(
      overlayColor: Colors.black45,
      animationType: AnimationType.grow,
      isCloseButton: false,
      isOverlayTapDismiss: false,
      descStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      animationDuration: const Duration(milliseconds: 400),
      alertBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6.0),
        side: const BorderSide(
          color: Colors.black,
        ),
      ),
      titleStyle: const TextStyle(color: Colors.black, fontSize: 16),
    );
    Alert(
      padding: const EdgeInsets.all(20),
      context: context,
      style: alertStyle,
      image: SvgPicture.asset(AppImages.logo),
      type: AlertType.warning,
      title: "$title", //យល់ព្សូមជ្រើសរើសបរិមាណទំនិញ
      buttons: [
        DialogButton(
          onPressed: onButtonTap,
          color: AppColors().primaryRed,
          radius: BorderRadius.circular(5.0),
          child: Text(
            titleButton!,
            style: AppTextStyle().titleS(color: AppColors().white),
          ),
        ),
      ],
    ).show();
  }

  //failed dialog
  static alertDialogFailed(
    BuildContext context, {
    String? title = "Failed",
    String? titleButton = "OK",
    VoidCallback? onButtonTap,
    bool? hasDuration = false,
  }) {
    if (hasDuration!) {
      Future.delayed(
          const Duration(seconds: 1),
          onButtonTap ??
              () {
                Navigator.of(context).pop(true);
              });
    }

    var alertStyle = AlertStyle(
      overlayColor: Colors.black45,
      animationType: AnimationType.grow,
      isCloseButton: false,
      isOverlayTapDismiss: false,
      descStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      animationDuration: const Duration(milliseconds: 400),
      alertBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6.0),
        side: const BorderSide(
          color: Colors.black,
        ),
      ),
      titleStyle: const TextStyle(color: Colors.black, fontSize: 16),
    );

    Alert(
      padding: const EdgeInsets.all(20),
      context: context,
      style: alertStyle,
      image: SvgPicture.asset(AppImages.logo),
      type: AlertType.error,
      title: "$title", //យល់ព្សូមជ្រើសរើសបរិមាណទំនិញ
      buttons: hasDuration
          ? []
          : [
              DialogButton(
                onPressed: onButtonTap ??
                    () {
                      Get.back();
                      // Get.back();
                    },
                color: AppColors().primaryRed,
                radius: BorderRadius.circular(5.0),
                child: Text(
                  titleButton!,
                  style: AppTextStyle().titleS(color: AppColors().white),
                ),
              ),
            ],
    ).show();
  }

  //custom dialog
  static appAlertCustomDialog(
    BuildContext context, {
    String? title = "",
    String? titleFirstButton = "",
    String? titleSecondButton = "",
    String? titleThirdButton = "",
    String? desc = "",
    double dialogHeight = 100.0,
    bool? isFirstButton = false,
    bool? isSecondButton = false,
    bool? isThirdButton = false,
    VoidCallback? onFirstButtonTap,
    VoidCallback? onSecondButtonTap,
    VoidCallback? onThirdButtonTap,
  }) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: EdgeInsets.all(24.px),
          backgroundColor: AppColors().white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
          content: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: dialogHeight,
            // height: MediaQuery.of(context).size.width / 1.6,
            child: Column(
              children: [
                Container(
                  alignment: Alignment.center,
                  child: Text(
                    title!,
                    style: AppTextStyle().titleM(color: AppColors().textColor),
                  ),
                ),
                SizedBox(
                  height: 16.px,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    desc!,
                    style: AppTextStyle()
                        .textS(color: AppColors().textColor, fontSize: 15),
                  ),
                ),
                SizedBox(
                  height: 16.px,
                ),
                const Spacer(),
                isFirstButton!
                    ? InkWell(
                        onTap: onFirstButtonTap,
                        child: Container(
                          margin: EdgeInsets.symmetric(
                              vertical: 6.px, horizontal: 2.px),
                          padding: EdgeInsets.symmetric(vertical: 14.px),
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: AppColors().blue,
                              borderRadius: BorderRadius.circular(10.px)),
                          child: Center(
                            child: Text(
                              titleFirstButton!,
                              style: AppTextStyle()
                                  .titleS(color: AppColors().white),
                            ),
                          ),
                        ),
                      )
                    : const SizedBox.shrink(),
                isSecondButton!
                    ? InkWell(
                        onTap: onSecondButtonTap,
                        child: Container(
                          margin: EdgeInsets.symmetric(
                              vertical: 6.px, horizontal: 2.px),
                          padding: EdgeInsets.symmetric(vertical: 14.px),
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: AppColors().primaryRed,
                              borderRadius: BorderRadius.circular(5.px)),
                          child: Center(
                              child: Text(
                            titleSecondButton!,
                            style:
                                AppTextStyle().titleS(color: AppColors().white),
                          )),
                        ),
                      )
                    : const SizedBox.shrink(),
                isThirdButton!
                    ? InkWell(
                        onTap: onThirdButtonTap,
                        child: Container(
                          margin: EdgeInsets.symmetric(
                              vertical: 6.px, horizontal: 2.px),
                          padding: EdgeInsets.symmetric(vertical: 14.px),
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: AppColors().otherGrey,
                              borderRadius: BorderRadius.circular(10.px)),
                          child: Center(
                            child: Text(
                              titleThirdButton!,
                              style: AppTextStyle()
                                  .titleS(color: AppColors().white),
                            ),
                          ),
                        ),
                      )
                    : const SizedBox.shrink(),
              ],
            ),
          ),
        );
      },
    );
  }

  // feedBack success  dialog
  static alertDiaFeedBackSuccess(
    BuildContext context, {
    String? title = "Thanks for your feedback",
    String? titleButton = "OK",
  }) {
    var alertStyle = AlertStyle(
      overlayColor: Colors.black45,
      animationType: AnimationType.grow,
      isCloseButton: false,
      isOverlayTapDismiss: false,
      descStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      animationDuration: const Duration(milliseconds: 400),
      alertBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6.0),
        side: const BorderSide(
          color: Colors.black,
        ),
      ),
      titleStyle: const TextStyle(color: Colors.black, fontSize: 16),
    );

    Alert(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
      context: context,
      style: alertStyle,
      image: SvgPicture.asset(AppImages.logo),
      type: AlertType.success,
      title: "$title", //យល់ព្សូមជ្រើសរើសបរិមាណទំនិញ
      buttons: [
        DialogButton(
          onPressed: () {
            Get.back();
            // Get.back();
          },
          color: AppColors().primaryRed,
          radius: BorderRadius.circular(5.0),
          child: Text(
            titleButton!,
            style: AppTextStyle().titleS(color: AppColors().white),
          ),
        ),
      ],
    ).show();
  }

  //Logout Acc dialog
  static appAlertDialog(BuildContext context,
      {String? title = "",
      double? tittleSize = 16,
      String? titleFirstButton = "Cancel",
      String? titleThirdButton = "OK",
      String? desc = "",
      double dialogHeight = 220,
      bool? isFirstButton = true,
      bool? isThirdButton = true,
      VoidCallback? onFirstButtonTap,
      VoidCallback? onThirdButtonTap,
      Widget? iconLogo}) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: EdgeInsets.all(24.px),
          backgroundColor: AppColors().white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
          content: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: dialogHeight,
            // height: MediaQuery.of(context).size.width / 1.6,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.all(AppDimension().small),
                  alignment: Alignment.center,
                  child: iconLogo ??
                      AppImages.assetImage('assets/images/icon_logout.png'),
                ),
                Container(
                  margin: EdgeInsets.all(AppDimension().small),
                  alignment: Alignment.center,
                  child: Text(
                    title!,
                    style: AppTextStyle().titleM(
                        color: AppColors().textColor, fontSize: tittleSize!),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: 16.px,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    desc!,
                    style: AppTextStyle()
                        .textS(color: AppColors().textColor, fontSize: 15),
                  ),
                ),
                SizedBox(
                  height: 16.px,
                ),
                Row(
                  children: [
                    isFirstButton!
                        ? Expanded(
                            child: InkWell(
                              onTap: onFirstButtonTap,
                              child: Container(
                                margin: EdgeInsets.symmetric(horizontal: 5.px),
                                padding: EdgeInsets.symmetric(vertical: 14.px),
                                decoration: BoxDecoration(
                                    color: AppColors().primaryRed,
                                    borderRadius: BorderRadius.circular(6.px)),
                                child: Center(
                                  child: Text(
                                    titleFirstButton!.tr,
                                    style: AppTextStyle()
                                        .titleS(color: AppColors().white),
                                  ),
                                ),
                              ),
                            ),
                          )
                        : const SizedBox.shrink(),
                    isThirdButton!
                        ? Expanded(
                            child: InkWell(
                              onTap: onThirdButtonTap,
                              child: Container(
                                margin: EdgeInsets.symmetric(horizontal: 5.px),
                                padding: EdgeInsets.symmetric(
                                  vertical: 14.px,
                                ),
                                decoration: BoxDecoration(
                                    color: AppColors().primaryBlue,
                                    borderRadius: BorderRadius.circular(6.px)),
                                child: Center(
                                  child: Text(
                                    titleThirdButton!.tr,
                                    style: AppTextStyle()
                                        .titleS(color: AppColors().white),
                                  ),
                                ),
                              ),
                            ),
                          )
                        : const SizedBox.shrink(),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  //delete Acc dialog
  static appAlertDeleteAccDialog(
    BuildContext context, {
    String? title = "Are you sure want to Delete Account ?",
    String? titleFirstButton = "Cancel",
    String? titleThirdButton = "OK",
    String? desc = "",
    double dialogHeight = 240,
    bool? isFirstButton = true,
    bool? isThirdButton = true,
    VoidCallback? onFirstButtonTap,
    VoidCallback? onThirdButtonTap,
  }) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: EdgeInsets.all(24.px),
          backgroundColor: AppColors().white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
          content: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: dialogHeight,
            // height: MediaQuery.of(context).size.width / 1.6,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.all(AppDimension().small),
                  alignment: Alignment.center,
                  child: AppImages.assetImage('assets/images/warning-icons.png',
                      width: 80, height: 80),
                ),
                Container(
                  margin: EdgeInsets.all(AppDimension().small),
                  alignment: Alignment.center,
                  child: Text(
                    title!.tr,
                    style: AppTextStyle().titleM(color: AppColors().textColor),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: 16.px,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    desc!,
                    style: AppTextStyle()
                        .textS(color: AppColors().textColor, fontSize: 15),
                  ),
                ),
                SizedBox(
                  height: 10.px,
                ),
                Row(
                  children: [
                    isFirstButton!
                        ? Expanded(
                            child: InkWell(
                              onTap: onFirstButtonTap,
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  vertical: 14.px,
                                ),
                                margin: EdgeInsets.symmetric(horizontal: 5.px),
                                decoration: BoxDecoration(
                                    color: AppColors().primaryBlue,
                                    borderRadius: BorderRadius.circular(5.px)),
                                child: Center(
                                  child: Text(
                                    titleFirstButton!.tr,
                                    style: AppTextStyle()
                                        .titleS(color: AppColors().white),
                                  ),
                                ),
                              ),
                            ),
                          )
                        : const SizedBox.shrink(),
                    isThirdButton!
                        ? Expanded(
                            child: InkWell(
                              onTap: onThirdButtonTap,
                              child: Container(
                                margin: EdgeInsets.symmetric(horizontal: 5.px),
                                padding: EdgeInsets.symmetric(
                                  vertical: 14.px,
                                ),
                                decoration: BoxDecoration(
                                    color: AppColors().primaryRed,
                                    borderRadius: BorderRadius.circular(5.px)),
                                child: Center(
                                  child: Text(
                                    titleThirdButton!.tr,
                                    style: AppTextStyle()
                                        .titleS(color: AppColors().white),
                                  ),
                                ),
                              ),
                            ),
                          )
                        : const SizedBox.shrink(),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  static areYouSureAccDialog(
    BuildContext context, {
    String? title = "Have you received the items?",
    String? titleCancelButton = "No now",
    String? titleOKButton = "Conform",
    String? desc = "",
    double dialogHeight = 200,
    bool? isFirstButton = true,
    bool? isThirdButton = true,
    VoidCallback? onCancelButtonTap,
    VoidCallback? onOKButtonTap,
    bool? isTextField = false,
    TextEditingController? controller,
    String? textControllerError = "",
  }) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: EdgeInsets.zero,
          backgroundColor: AppColors().white,
          insetPadding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          content: SizedBox(
            width: screenWidth,
            height: dialogHeight,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.all(AppDimension().small),
                  alignment: Alignment.center,
                  child: Text(
                    title!.tr,
                    style: AppTextStyle().titleM(color: AppColors().textColor),
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    desc!,
                    style: AppTextStyle()
                        .textS(color: AppColors().textColor, fontSize: 15),
                  ),
                ),
                SizedBox(
                  height: 16.px,
                ),
                Column(
                  children: [
                    isThirdButton!
                        ? InkWell(
                      onTap: onOKButtonTap,
                      child: Container(
                        width: screenWidth/1.7,
                        margin: EdgeInsets.symmetric(horizontal: 5.px),
                        padding: EdgeInsets.symmetric(
                          vertical: 15.px,
                        ),
                        decoration: BoxDecoration(
                            color: AppColors().primaryRed,
                            borderRadius: BorderRadius.circular(20.px)),
                        child: Center(
                          child: Text(
                            titleOKButton!.tr,
                            style: AppTextStyle()
                                .titleS(color: AppColors().white),
                          ),
                        ),
                      ),
                    )
                        : const SizedBox.shrink(),
                    SizedBox(height: 10.px,),
                    isFirstButton!
                        ? InkWell(
                      onTap: onCancelButtonTap??()=>Get.back(),
                      child: Container(
                        width: screenWidth/1.7,
                        padding: EdgeInsets.symmetric(
                          vertical: 15.px,
                        ),
                        margin: EdgeInsets.symmetric(horizontal: 5.px),
                        decoration: BoxDecoration(
                            color: AppColors().yellowed,
                            borderRadius: BorderRadius.circular(20.px)),
                        child: Center(
                          child: Text(
                            titleCancelButton!.tr,
                            style: AppTextStyle()
                                .titleS(color: AppColors().white),
                          ),
                        ),
                      ),
                    )
                        : const SizedBox.shrink(),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  static thankYouDialog(
      BuildContext context,{
        Function()? conform
  }) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: EdgeInsets.zero,
          backgroundColor: AppColors().white,
          insetPadding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          content: SizedBox(
            width: screenWidth,
            height: screenHeight/3.2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AppImages.assetImage(
                    "assets/background/Illustration.png",
                    width: screenWidth/3,
                    height: screenHeight/8
                ),
                Text("Thank for your order!",style: AppTextStyle().titleM(color: AppColors().grey,fontSize: 16),),
                InkWell(
                  onTap: conform??()=>Get.back(),
                    child: Text("Confirmed",style: AppTextStyle().titleM(fontSize: 16),))
              ],
            ),
          ),
        );
      },
    );
  }

  // toast alert success
  static toastAlertSuccess(
    BuildContext context, {
    String? title = "Success",
    String? description,
  }) {
    toastification.show(
      context: context,
      padding: const EdgeInsets.only(top: 5, bottom: 10, left: 10),
      foregroundColor: Colors.white,
      borderRadius: BorderRadius.circular(5),
      pauseOnHover: true,
      showProgressBar: true,
      autoCloseDuration: const Duration(seconds: 5),
    );
  }

  // toast alert warning
  static toastAlertWarning(
    BuildContext context, {
    String? title = "Warning!",
    String? description,
  }) {
    toastification.show(
      context: context,
      padding: const EdgeInsets.only(top: 5, bottom: 10, left: 10),
      foregroundColor: AppColors().white,
      borderRadius: BorderRadius.circular(5),
      pauseOnHover: true,
      showProgressBar: true,
      autoCloseDuration: const Duration(seconds: 5),
    );
  }

  // toast alert error
  static toastAlertError(
    BuildContext context, {
    String? title = "Error!",
    String? description,
  }) {
    toastification.show(
      context: context,
      padding: const EdgeInsets.only(top: 5, bottom: 10, left: 10),
      foregroundColor: Colors.white,
      borderRadius: BorderRadius.circular(5),
      pauseOnHover: true,
      showProgressBar: true,
      autoCloseDuration: const Duration(seconds: 5),
    );
  }

  // toast alert error
  static toastAlertInfo(
    BuildContext context, {
    String? title = "Info",
    String? description,
  }) {
    toastification.show(
      context: context,
      padding: const EdgeInsets.only(top: 5, bottom: 10, left: 10),
      foregroundColor: Colors.white,
      borderRadius: BorderRadius.circular(5),
      pauseOnHover: true,
      showProgressBar: true,
      autoCloseDuration: const Duration(seconds: 5),
    );
  }

  //alert dialog change list or grid
  static dialogListOrGrid(context,
      {required String title, required Widget contain, isShow = true}) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return StatefulBuilder(builder: (context, setState) {
            return AlertDialog(
              elevation: 0.0,
              titlePadding: EdgeInsets.zero,
              insetPadding:
                  EdgeInsets.symmetric(horizontal: AppDimension().bodySpace),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.sp),
              ),
              title: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    alignment: Alignment.center,
                    padding: isShow
                        ? EdgeInsets.only(
                            top: 4.px, bottom: 4.px, left: 20.px, right: 5.px)
                        : EdgeInsets.symmetric(vertical: 18.5.px),
                    decoration: BoxDecoration(
                      color: AppColors().primaryBlue,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10.sp),
                        topLeft: Radius.circular(10.sp),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: isShow
                          ? MainAxisAlignment.spaceBetween
                          : MainAxisAlignment.center,
                      children: [
                        Text(title,
                            style:
                                AppTextStyle().textM(color: AppColors().white)),
                        isShow
                            ? IconButton(
                                color: Colors.white,
                                padding: EdgeInsets.zero,
                                alignment: Alignment.centerRight,
                                onPressed: () => Navigator.of(context).pop(),
                                icon: const Icon(Icons.clear_outlined),
                              )
                            : const SizedBox.shrink(),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10.px,
                  ),
                  contain,
                  SizedBox(
                    height: 10.px,
                  ),
                ],
              ),
            );
          });
        });
  }
}
