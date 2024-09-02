import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../utils/constants/app_colors.dart';
import '../../utils/constants/app_font_styles.dart';

class InternetScreen extends StatefulWidget {
  const InternetScreen({Key? key}) : super(key: key);

  @override
  State<InternetScreen> createState() => _InternetScreenState();
}

class _InternetScreenState extends State<InternetScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Container(
              height: 220,
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(6)),
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
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
                        margin: EdgeInsets.symmetric(horizontal: 12),
                        child: Text(
                          "Please check your internet connection\n and try again".tr,
                          textAlign: TextAlign.center,
                          style: AppTextStyle().textS(),
                        ),
                      ),
                      Expanded(
                        child: SizedBox(
                          height: 1.px,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(
                            vertical: 6.px, horizontal: 25.px),
                        padding: EdgeInsets.symmetric(vertical: 14.px),
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: AppColors().textColor,
                            borderRadius: BorderRadius.circular(10.px)),
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
        ),
      ),
    );
  }
}
