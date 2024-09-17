
import 'package:all_in_one/views/screens/drawer_screen/drawer_item/drawer_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../routes/config_router.dart';
import '../../../utils/constants/app_colors.dart';
import '../../../utils/constants/app_dimensions.dart';
import '../../../utils/constants/app_font_styles.dart';
import 'package:dotted_line/dotted_line.dart';

import '../home_screen/home_screen.dart';
import 'live_location_map/live_location_map.dart';

class HomePackage extends StatefulWidget {
  const HomePackage({super.key});

  @override
  State<HomePackage> createState() => _HomePackageState();
}

class _HomePackageState extends State<HomePackage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors().bgColorApp,
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        automaticallyImplyLeading: false,
        title: const Center(child: Text("PACKAGE", style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)),
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            child: Padding(
              padding: EdgeInsets.all(AppDimension().bodySpace),
              child: ListView(
                scrollDirection: Axis.vertical,
                children: [
                  SizedBox(height: 15.px),
                  InkWell(
                    onTap: () {
                      ConfigRouter.pushPage(context,  LiveLocationMap());
                    },
                    child: Container(
                      height: 70.px,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Color(0xffF7F7F7),
                          boxShadow: [
                            BoxShadow(color: Colors.grey.withOpacity(.2),blurRadius: 5,spreadRadius: 1)
                          ]
                      ),
                      child: Row(
                        children: [
                          Expanded(
                              flex: 2,
                              child: Icon(
                                Icons.image_search,
                                color: AppColors().primaryRed,
                              )),
                          Expanded(
                            flex: 8,
                            child: Text(
                              "Live Location Map".tr,
                              style: AppTextStyle().textL(),
                            ),
                          ),

                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      )
    );
  }
}

