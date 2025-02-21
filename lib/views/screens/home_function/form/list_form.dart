

import 'package:all_in_one/views/screens/home_function/form/work_on_site/work_on_site.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../routes/config_router.dart';
import '../../../../utils/constants/app_colors.dart';
import '../../../../utils/constants/app_font_styles.dart';
import '../../home_screen/home_screen.dart';
import '../attendance/attendance.dart';
import 'form_copy/form_copy.dart';

class ListForm extends StatefulWidget {
  const ListForm({super.key});

  @override
  State<ListForm> createState() => _ListFormState();
}

class _ListFormState extends State<ListForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors().bgColorApp,
        appBar: AppBar(
          backgroundColor: Colors.lightBlueAccent,
          // automaticallyImplyLeading: false,
          title: Container(
            padding: EdgeInsets.only(right: 50),
              child: const Center(child: Text("LIST FORM", style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),))),
          leading: const BackButton(
            color: Colors.white,
          ),
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
                        ConfigRouter.pushPage(context, const WorkOnSiteForm());
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
                                "Work-On-Site".tr,
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
                        ConfigRouter.pushPage(context, const FormCopy());
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
                                "Form Copy".tr,
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
