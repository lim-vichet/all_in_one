import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../utils/constants/app_colors.dart';
import '../../utils/constants/app_font_styles.dart';

class InternetFullScreenScreen extends StatefulWidget {
  const InternetFullScreenScreen({Key? key}) : super(key: key);

  @override
  State<InternetFullScreenScreen> createState() =>
      _InternetFullScreenScreenState();
}

class _InternetFullScreenScreenState extends State<InternetFullScreenScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Image.asset(
              "assets/images/background.jpg",
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              fit: BoxFit.cover,
            ),
            Center(
              child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 185),
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(6)),
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(8)),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // SvgPicture.asset(AppImages.iconWifi),
                          Icon(Icons.wifi_off_outlined),
                          SizedBox(
                            height: 16.px,
                          ),
                          Container(
                            alignment: Alignment.center,
                            child: Text(
                              "No Internet Connection".tr,
                              style: AppTextStyle().textS(),
                            ),
                          ),
                          SizedBox(
                            height: 16.px,
                          ),
                          Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.symmetric(horizontal: 12.px),
                            child: Text(
                              "${'Please check your internet connection'.tr}\n ${"and try again".tr} ",
                              textAlign: TextAlign.center,
                              style: AppTextStyle().textS(),
                              ),
                            ),

                          SizedBox(
                            height: 16.px,
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(
                                vertical: 6.px, horizontal: 45.px),
                            padding: EdgeInsets.symmetric(vertical: 14.px),
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: AppColors().textColor,
                                borderRadius: BorderRadius.circular(30.px)),
                            child: Center(
                                child: Text(
                              "Try Again".tr,
                              style: AppTextStyle().textS(),
                            )),
                          ),
                          SizedBox(
                            height: 16.px,
                          ),
                        ],
                      ),
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
