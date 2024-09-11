
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../routes/config_router.dart';
import '../../../../utils/constants/app_colors.dart';
import '../../../../utils/constants/app_font_styles.dart';
import '../../home_screen/home_screen.dart';
import 'checkin_form/checkin_form.dart';
import 'list_attendance/list_attendance.dart';

class AttendanceScreen extends StatefulWidget {
  const AttendanceScreen({super.key});

  @override
  State<AttendanceScreen> createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends State<AttendanceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors().bgColorApp,
        appBar: AppBar(
          backgroundColor: Colors.lightBlueAccent,
          // automaticallyImplyLeading: false,
          title: const Center(child: Text("ATTENDANCE", style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)),
          leading: const BackButton(
            color: Colors.white,
          ),
        ),
        body: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              child: Padding(
                padding: EdgeInsets.all(20),
                child: ListView(
                  scrollDirection: Axis.vertical,
                  children: [
                    SizedBox(height: 15.px),
                    InkWell(
                      onTap: () {
                        ConfigRouter.pushPage(context, const CheckInFormScreen());
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
                                  Icons.schedule,
                                  color: AppColors().green,
                                )),
                            Expanded(
                              flex: 8,
                              child: Text(
                                "Check In".tr,
                                style: AppTextStyle().textL(),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 15.px),
                    InkWell(
                      onTap: () {
                        ConfigRouter.pushPage(context, const ListAttendanceScreen());
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
                                  Icons.checklist,
                                  color: AppColors().green,
                                )),
                            Expanded(
                              flex: 8,
                              child: Text(
                                "List Attendance".tr,
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
