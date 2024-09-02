import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:responsive_sizer/responsive_sizer.dart' as responsive;
import '../../utils/constants/app_colors.dart';
import '../../utils/constants/app_font_styles.dart';
import '../../utils/constants/app_images.dart';

class ComponentAlert {
  //success dialog
  static alertDialogSuccess({
    required BuildContext context,
    String? title = "",
    String? titleButton = "",
  }) {
    var alertStyle = AlertStyle(
      overlayColor: Colors.black45,
      animationType: AnimationType.fromTop,
      isCloseButton: false,
      isOverlayTapDismiss: false,
      descStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      animationDuration: const Duration(milliseconds: 400),
      alertBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
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
      type: AlertType.success,
      title: "$title", //យល់ព្សូមជ្រើសរើសបរិមាណទំនិញ
      buttons: [
        DialogButton(
          onPressed: () {
            Get.back();
          },
          color: AppColors().red,
          radius: BorderRadius.circular(10.0),
          child: Text(
            titleButton!,
            style: AppTextStyle().textS(color: AppColors().red),
          ),
        ),
      ],
    ).show();
  }

  //warning dialog
  static alertDialogWarning({
    required BuildContext context,
    String? title = "",
    String? titleButton = "",
  }) {
    var alertStyle = AlertStyle(
      overlayColor: Colors.black45,
      animationType: AnimationType.fromTop,
      isCloseButton: false,
      isOverlayTapDismiss: false,
      descStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      animationDuration: const Duration(milliseconds: 400),
      alertBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
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
          onPressed: () {
            Get.back();
          },
          color: AppColors().red,
          radius: BorderRadius.circular(10.0),
          child: Text(
            titleButton!,
            style: AppTextStyle().textS(),
          ),
        ),
      ],
    ).show();
  }

  //failed dialog
  static alertDialogFailed({
    required BuildContext context,
    String? title = "",
    String? titleButton = "",
  }) {
    var alertStyle = AlertStyle(
      overlayColor: Colors.black45,
      animationType: AnimationType.fromTop,
      isCloseButton: false,
      isOverlayTapDismiss: false,
      descStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      animationDuration: const Duration(milliseconds: 400),
      alertBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
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
      buttons: [
        DialogButton(
          onPressed: () {
            Get.back();
          },
          color: AppColors().red,
          radius: BorderRadius.circular(10.0),
          child: Text(
            titleButton!,
            style: AppTextStyle().textS(),
          ),
        ),
      ],
    ).show();
  }

  //custom dialog
  static appAlertCustomDialog({
    required BuildContext context,
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
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
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
                    style: AppTextStyle().textS(),
                  ),
                ),
                SizedBox(
                  height: 16.px,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    desc!,
                    style: AppTextStyle().textS(),
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
                              style: AppTextStyle().textS(),
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
                              color: AppColors().red,
                              borderRadius: BorderRadius.circular(10.px)),
                          child: Center(
                              child: Text(
                            titleSecondButton!,
                            style: AppTextStyle().textS(),
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
                              style: AppTextStyle().textS(),
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
}
