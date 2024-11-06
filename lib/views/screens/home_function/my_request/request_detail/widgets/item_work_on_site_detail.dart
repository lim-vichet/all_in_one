

import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../../../data/models/all_form_detail_model/work_on_site_detail_model.dart';
import '../../../../../../utils/constants/app_colors.dart';
import '../../../../../../utils/constants/app_date_format.dart';
import '../../../../../../utils/constants/app_font_styles.dart';
import '../../../../../../utils/global_use.dart';

class ItemWorkOnSiteDetail extends StatefulWidget {
   final ResultFormWorkOnSiteDetail dataWorkOnSiteDetail;
  const ItemWorkOnSiteDetail({Key? key, required this.dataWorkOnSiteDetail}) : super(key: key);

  @override
  State<ItemWorkOnSiteDetail> createState() => _ItemWorkOnSiteDetailState();
}

class _ItemWorkOnSiteDetailState extends State<ItemWorkOnSiteDetail> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 700,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            SizedBox(height: 15.px),
            Container(
              padding: const EdgeInsets.all(15),
              // height: 70.px,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: const Color(0xffF7F7F7),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(.2),
                        blurRadius: 5,
                        spreadRadius: 1)
                  ]),
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
                  const SizedBox(
                    height: 10,
                  ),
                  const DottedLine(),
                  const SizedBox(
                    height: 10,
                  ),

                  Row(
                    children: [
                      Expanded(flex: 4, child: Text("Employee ID", style: TextStyle(fontSize: 13))),
                      Expanded(flex: 1, child: Text(":")),
                      Expanded(flex: 5, child: Text("${widget!.dataWorkOnSiteDetail.idNumber}", style: TextStyle(fontSize: 13))),
                    ],
                  ),

                   Row(
                    children: [
                      const Expanded(flex: 4, child: Text("Request Name", style: TextStyle(fontSize: 13))),
                      const Expanded(flex: 1, child: Text(":")),
                      Expanded(flex: 5, child: Text(lan=='en'? widget.dataWorkOnSiteDetail.requestByNameEn:widget.dataWorkOnSiteDetail!.requestByNameKh, style: TextStyle(fontSize: 13))),
                    ],
                  ),
                  const Row(
                    children: [
                      Expanded(flex: 4, child: Text("Hello")),
                      Expanded(flex: 1, child: Text(":")),
                      Expanded(flex: 5, child: Text("Hello")),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(flex: 4, child: Text("Gender", style: TextStyle(fontSize: 13))),
                      Expanded(flex: 1, child: Text(":")),
                      Expanded(flex: 5, child: Text(widget.dataWorkOnSiteDetail.gender, style: TextStyle(fontSize: 13))),
                    ],
                  ),
                   Row(
                    children: [
                      Expanded(flex: 4, child: Text("Position", style: TextStyle(fontSize: 13))),
                      Expanded(flex: 1, child: Text(":")),
                      Expanded(flex: 5, child: Text(lan == 'en'? widget.dataWorkOnSiteDetail.positionEn:widget.dataWorkOnSiteDetail.positionKh, style: TextStyle(fontSize: 13))),
                    ],
                  ),
                   Row(
                    children: [
                      Expanded(flex: 4, child: Text("Department", style: TextStyle(fontSize: 13))),
                      Expanded(flex: 1, child: Text(":")),
                      Expanded(flex: 5, child: Text(lan == 'en'? widget.dataWorkOnSiteDetail.deptNameEn:widget.dataWorkOnSiteDetail.deptNameKh, style: TextStyle(fontSize: 13))),
                    ],
                  ),
                   Row(
                    children: [
                      Expanded(flex: 4, child: Text("Request Date", style: TextStyle(fontSize: 13))),
                      Expanded(flex: 1, child: Text(":")),
                      Expanded(flex: 5, child: Text(widget.dataWorkOnSiteDetail?.requestDate, style: TextStyle(fontSize: 13))),
                      // Expanded(flex: 5, child: Text(DateFormat("E.d MMM yyyy HH:mm a").format(widget.dataWorkOnSiteDetail!.requestDate),)),
                      // Expanded(flex: 5, child: AppDateFormat().convertToDDMMMYYYYHHMM(originalDate: widget.dataWorkOnSiteDetail?.requestDate),),
                    ],
                  ),


                  const SizedBox(
                    height: 10,
                  ),
                  const DottedLine(),
                  const SizedBox(
                    height: 10,
                  ),

                  Row(
                    children: [
                      Expanded(flex: 4, child: Text("Date From", style: TextStyle(fontSize: 13))),
                      Expanded(flex: 1, child: Text(":")),
                      // Expanded(flex: 5, child: Text(widget.dataWorkOnSiteDetail?.tabledetail.arraytable1[0].fromDate)),
                      Expanded(flex: 5, child: Text(DateFormat("E.d MMM yyyy HH:mm a").format(widget.dataWorkOnSiteDetail?.tabledetail.arraytable1[0].fromDate), style: TextStyle(fontSize: 13),)),
                      // Expanded(flex: 5, child: AppDateFormat().convertToDDMMMYYYYHHMM(originalDate: widget.dataWorkOnSiteDetail?.tabledetail.arraytable1[0].fromDate),),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(flex: 4, child: Text("Date To", style: TextStyle(fontSize: 13))),
                      Expanded(flex: 1, child: Text(":")),
                      Expanded(flex: 5, child: Text(DateFormat("E.d MMM yyyy HH:mm a").format(widget.dataWorkOnSiteDetail?.tabledetail.arraytable1[0].toDate), style: TextStyle(fontSize: 13),)),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(flex: 4, child: Text("Duration", style: TextStyle(fontSize: 13))),
                      Expanded(flex: 1, child: Text(":")),
                      Expanded(flex: 5, child: Text(widget.dataWorkOnSiteDetail.tabledetail.arraytable1[0].durationPerformed, style: TextStyle(fontSize: 13))),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(flex: 4, child: Text("Description", style: TextStyle(fontSize: 13))),
                      Expanded(flex: 1, child: Text(":")),
                      Expanded(flex: 5, child: Text(widget.dataWorkOnSiteDetail.tabledetail.arraytable1[0].taskDescription, style: TextStyle(fontSize: 13))),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
