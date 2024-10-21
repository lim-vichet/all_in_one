import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../../routes/config_router.dart';
import '../../../../../utils/constants/app_colors.dart';
import '../../../../../utils/constants/app_font_styles.dart';
import '../../form/work_on_site/work_on_site.dart';

import 'package:dotted_line/dotted_line.dart';

class RequestDetailScreen extends StatefulWidget {
  const RequestDetailScreen({Key? key}) : super(key: key);

  @override
  State<RequestDetailScreen> createState() => _RequestDetailScreenState();
}

class _RequestDetailScreenState extends State<RequestDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors().bgColorApp,
        appBar: AppBar(
          backgroundColor: Colors.lightBlueAccent,
          // automaticallyImplyLeading: false,
          title: Container(
              padding: EdgeInsets.only(right: 50),
              child: const Center(child: Text("My Request Detail Detail", style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),))),
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
                    Container(
                      padding: EdgeInsets.all(15),
                      // height: 70.px,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Color(0xffF7F7F7),
                          boxShadow: [
                            BoxShadow(color: Colors.grey.withOpacity(.2),blurRadius: 5,spreadRadius: 1)
                          ]
                      ),
                      child: Column(
                        children: [
                          Row(
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
                          SizedBox(height: 10,),
                          DottedLine(),
                          SizedBox(height: 10,),
                          Container(
                            child: Row(
                              children: [
                                Expanded(
                                  flex:4,
                                    child: Text("Hello")),
                                Expanded(
                                  flex: 1,
                                    child: Text(":")),
                                Expanded(
                                    flex: 5,
                                    child: Text("Hello")),
                              ],
                            ),
                          ),
                          Container(
                            child: Row(
                              children: [
                                Expanded(
                                    flex:4,
                                    child: Text("Hello")),
                                Expanded(
                                    flex: 1,
                                    child: Text(":")),
                                Expanded(
                                    flex: 5,
                                    child: Text("Hello")),
                              ],
                            ),
                          ),
                          Container(
                            child: Row(
                              children: [
                                Expanded(
                                    flex:4,
                                    child: Text("Hello")),
                                Expanded(
                                    flex: 1,
                                    child: Text(":")),
                                Expanded(
                                    flex: 5,
                                    child: Text("Hello")),
                              ],
                            ),
                          ),
                          Container(
                            child: Row(
                              children: [
                                Expanded(
                                    flex:4,
                                    child: Text("Hello")),
                                Expanded(
                                    flex: 1,
                                    child: Text(":")),
                                Expanded(
                                    flex: 5,
                                    child: Text("Hello")),
                              ],
                            ),
                          ),
                        ],
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
