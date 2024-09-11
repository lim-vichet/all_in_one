import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import '../../views/widgets/loading/loading.dart';
import '../../views/widgets/text_field.dart';
import '../global_use.dart';
import 'app_colors.dart';
import 'app_dimensions.dart';
import 'app_font_styles.dart';
import 'app_images.dart';

class AppDialog {
  static void alertDateFromSmallerThanDateTo(context,
      {required String text,
        AlignmentGeometry alignment = Alignment.topCenter,
        EdgeInsetsGeometry? margin,
        EdgeInsetsGeometry? padding,
        Color bgColor = Colors.white,
        Color textColor = Colors.black54,
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
                    size: 45,
                    color: AppColors().red,
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
                      ),
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
    Timer(const Duration(seconds: 2), () {
      Get.back();
    });
  }

  //loadingDialog
  static loadingDialog(BuildContext context, {bool isDismissible = false}) {
    showDialog(
        context: context,
        barrierDismissible: isDismissible,
        builder: (context) {
          return const LoadingScreen();
        });
  }

  //success dialog
  static alertDialogSuccess(
      BuildContext context, {
        String? titleButton = "OK",
        String? title = "Success",
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
          color: Colors.white,
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
      title: "$title",
      buttons: hasDuration!
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

  static alertDialogLogout(
      BuildContext context, {
        String? title = "Are you sure ?",
        String? description = "Do you want to logout",
        String? Yes = "Yes",
        String? No = "No",
        required Function() onTapBtnNo,
        required Function() onTapBtnYes,
        double? borderRadiusBtn,
        double? borderRadiusDialog,
        double? padding,
        Widget? headerImage,
      }) {
    var alertStyle = AlertStyle(
      overlayColor: Colors.black45,
      animationType: AnimationType.grow,
      isCloseButton: false,
      isOverlayTapDismiss: false,
      descStyle: const TextStyle(fontSize: 15),
      animationDuration: const Duration(milliseconds: 400),
      alertBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadiusDialog ?? 10.px),
        side: const BorderSide(
          color: Colors.white,
        ),
      ),
      titleStyle: const TextStyle(
          color: Colors.black, fontSize: 17, fontWeight: FontWeight.w500),
    );
    Alert(
        padding: EdgeInsets.all(padding ?? 20.px),
        context: context,
        style: alertStyle,
        image: headerImage ?? SvgPicture.asset(AppImages.success),
        type: AlertType.info,
        title: "$title".tr,
        desc: description,
        buttons: [
          DialogButton(
            onPressed: () => onTapBtnNo(),
            color: AppColors().primaryRed,
            radius: BorderRadius.circular(borderRadiusBtn ?? 5.0),
            child: Text(
              "No".tr!,
              style: AppTextStyle().titleS(color: AppColors().white),
            ),
          ),
          DialogButton(
            onPressed: () => onTapBtnYes(),
            color: AppColors().primaryBlue,
            radius: BorderRadius.circular(borderRadiusBtn ?? 5.0),
            child: Text(
              "Yes".tr!,
              style: AppTextStyle().titleS(color: AppColors().white),
            ),
          ),
        ]).show();
  }

  // warning dialog
  static alertDialogWarning(
      BuildContext context, {
        String? title = "Are you sure ?",
        String? description = "Do you want to",
        String? textBtnYes = "OK",
        String? textBtnNo = "Cancel",
        required Function() onTapBtnNo,
        required Function() onTapBtnYes,
        double? borderRadiusBtn,
        double? borderRadiusDialog,
        double? padding,
        Widget? headerImage,
      }) {
    var alertStyle = AlertStyle(
      overlayColor: Colors.black45,
      animationType: AnimationType.grow,
      isCloseButton: false,
      isOverlayTapDismiss: false,
      descStyle: const TextStyle(fontSize: 15),
      animationDuration: const Duration(milliseconds: 400),
      alertBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadiusDialog ?? 10.px),
        side: const BorderSide(
          color: Colors.white,
        ),
      ),
      titleStyle: const TextStyle(
          color: Colors.black, fontSize: 17, fontWeight: FontWeight.w500),
    );
    Alert(
        padding: EdgeInsets.all(padding ?? 20.px),
        context: context,
        style: alertStyle,
        image: headerImage ?? SvgPicture.asset(AppImages.success),
        type: AlertType.warning,
        title: "$title",
        desc: description,
        buttons: [
          DialogButton(
            onPressed: () => onTapBtnNo(),
            color: AppColors().primaryRed,
            radius: BorderRadius.circular(borderRadiusBtn ?? 5.0),
            child: Text(
              textBtnNo!,
              style: AppTextStyle().titleS(color: AppColors().white),
            ),
          ),
          DialogButton(
            onPressed: () => onTapBtnYes(),
            color: AppColors().primaryBlue,
            radius: BorderRadius.circular(borderRadiusBtn ?? 5.0),
            child: Text(
              textBtnYes!,
              style: AppTextStyle().titleS(color: AppColors().white),
            ),
          ),
        ]).show();
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
          color: Colors.white,
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
      title: "$title",
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

  // for reject request form dialog
  static alertDialogForRejectFormRequest(
      BuildContext context, {
        String? title = "Are you sure ?",
        String? description = "Do you want to reject",
        String? textBtnYes = "Yes",
        String? textBtnNo = "No",
        required Function() onTapBtnNo,
        required Function() onTapBtnYes,
        double? borderRadiusBtn,
        double? borderRadiusDialog,
        double? padding,
        Widget? headerImage,
        TextEditingController? controller,
        String? error = "",
        String? hinText,
      }) {
    var alertStyle = AlertStyle(
      overlayColor: Colors.black45,
      animationType: AnimationType.grow,
      isCloseButton: false,
      isOverlayTapDismiss: false,
      descStyle: const TextStyle(fontSize: 15),
      animationDuration: const Duration(milliseconds: 400),
      buttonAreaPadding: EdgeInsets.only(
        left: 10.px,
        right: 10.px,
        bottom: 20.px,
        top: 5.px,
      ),
      alertBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadiusDialog ?? 10.px),
        side: const BorderSide(
          color: Colors.white,
        ),
      ),
      titleStyle: const TextStyle(
          color: Colors.black, fontSize: 17, fontWeight: FontWeight.w500),
    );
    Alert(
        padding: EdgeInsets.only(
          top: padding ?? 10.px,
          bottom: padding ?? 0.px,
        ),
        context: context,
        style: alertStyle,
        image: headerImage ??
            Image.asset(
              AppImages.info,
              width: 120.px,
              height: 120.px,
            ),
        type: AlertType.warning,
        title: "$title",
        desc: description,
        content: Container(
          padding: EdgeInsets.only(top: 15.px, left: 15.px, right: 15.px),
          child: Column(
            children: [
              AppTextInput(
                hintText: hinText ?? "Reason",
                controller: controller,
                isError: error!,
              ),
            ],
          ),
        ),
        buttons: [
          DialogButton(
            onPressed: () => onTapBtnNo(),
            color: AppColors().primaryRed,
            radius: BorderRadius.circular(borderRadiusBtn ?? 5.0),
            child: Text(
              textBtnNo!,
              style: AppTextStyle().titleS(color: AppColors().white),
            ),
          ),
          DialogButton(
            onPressed: () => onTapBtnYes(),
            color: AppColors().primaryBlue,
            radius: BorderRadius.circular(borderRadiusBtn ?? 5.0),
            child: Text(
              textBtnYes!,
              style: AppTextStyle().titleS(color: AppColors().white),
            ),
          ),
        ]).show();
  }

  // dialog for update detail board
  static alertDialogUpdateBordDetail(
      BuildContext context, {
        String? title = "Are you sure ?",
        String? description = "",
        String? textBtnYes = "OK",
        String? textBtnNo = "Cancel",
        required Function() onTapBtnNo,
        required Function() onTapBtnYes,
        double? borderRadiusBtn,
        double? borderRadiusDialog,
        double? padding,
        Widget? headerImage,
        Widget? child,
      }) {
    var alertStyle = AlertStyle(
      overlayColor: Colors.black45,
      animationType: AnimationType.grow,
      isCloseButton: false,
      isOverlayTapDismiss: false,
      descStyle: const TextStyle(fontSize: 15),
      animationDuration: const Duration(milliseconds: 400),
      buttonAreaPadding: EdgeInsets.only(
        left: 10.px,
        right: 10.px,
        bottom: 20.px,
        top: 5.px,
      ),
      alertBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadiusDialog ?? 10.px),
        side: const BorderSide(
          color: Colors.white,
        ),
      ),
      titleStyle: const TextStyle(
          color: Colors.black, fontSize: 17, fontWeight: FontWeight.w500),
    );
    Alert(
        padding: EdgeInsets.only(
          top: padding ?? 10.px,
          bottom: padding ?? 0.px,
        ),
        context: context,
        style: alertStyle,
        image: headerImage ??
            Image.asset(
              AppImages.info,
              width: 120.px,
              height: 120.px,
            ),
        type: AlertType.warning,
        title: "$title",
        desc: description,
        content: Container(
          padding: EdgeInsets.only(top: 15.px, left: 15.px, right: 15.px),
          child: Column(
            children: [
              child!,
            ],
          ),
        ),
        buttons: [
          DialogButton(
            onPressed: () => onTapBtnNo(),
            color: AppColors().primaryRed,
            radius: BorderRadius.circular(borderRadiusBtn ?? 5.0),
            child: Text(
              textBtnNo!,
              style: AppTextStyle().titleS(color: AppColors().white),
            ),
          ),
          DialogButton(
            onPressed: () => onTapBtnYes(),
            color: AppColors().primaryBlue,
            radius: BorderRadius.circular(borderRadiusBtn ?? 5.0),
            child: Text(
              textBtnYes!,
              style: AppTextStyle().titleS(color: AppColors().white),
            ),
          ),
        ]).show();
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

  /// warning dialog
  static alertWaring(BuildContext context,
      {required String message,
        bool? hasDuration = false,
        bool isIcon = true}) {
    if (hasDuration!) {
      Future.delayed(
        const Duration(seconds: 2),
            () {
          Navigator.of(context).pop(true);
        },
      );
    }

    showDialog(
        barrierDismissible: false,
        barrierColor: AppColors().grey.withOpacity(0.5),
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: AppColors().white,
            surfaceTintColor: AppColors().white,
            insetPadding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.sp)),
            title: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.error_outline,
                      size: 80, color: AppColors().yellow),
                  SizedBox(height: 20.px),
                  Text(message, style: AppTextStyle().textS(fontSize: 15.5)),
                  SizedBox(height: 15.px),
                ],
              ),
            ),
          );
        });
  }
}
