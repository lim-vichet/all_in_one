

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../../routes/config_router.dart';
import '../../../../../utils/constants/app_colors.dart';
import '../../../../../utils/constants/app_font_styles.dart';
import '../../attendance/attendance.dart';

class ListRequestScreen extends StatefulWidget {
  const ListRequestScreen({Key? key}) : super(key: key);

  @override
  State<ListRequestScreen> createState() => _ListRequestScreenState();
}

class _ListRequestScreenState extends State<ListRequestScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors().bgColorApp,
        appBar: AppBar(
          backgroundColor: Colors.lightBlueAccent,
          automaticallyImplyLeading: false,
          title: const Center(child: Text("List Request", style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)),
        ),
        body: Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: ListView(
                  scrollDirection: Axis.vertical,
                  children: [
                    SizedBox(height: 15.px),
                    InkWell(
                      onTap: () {
                        ConfigRouter.pushPage(context, const AttendanceScreen());
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
                                  Icons.playlist_add_check_circle,
                                  color: AppColors().green,
                                )),
                            Expanded(
                              flex: 8,
                              child: Text(
                                "Attendance".tr,
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
