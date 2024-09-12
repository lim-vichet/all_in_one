import 'dart:convert';

import 'package:all_in_one/views/widgets/error_screen.dart';
import 'package:all_in_one/views/widgets/loading/loading.dart';
import 'package:cross_file/cross_file.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:select_searchable_list/select_searchable_list.dart';
import '../../../../../data/models/form_model/list_user_model.dart';
import '../../../../../logic/bloc/form_bloc/work_on_site_bloc/work_on_site_bloc.dart';
import '../../../../../utils/constants/app_colors.dart';
import '../../../../../utils/constants/app_font_styles.dart';
import '../../../../../utils/constants/app_time_picker_bottomsheet.dart';
import '../../../../../utils/constants/url_path.dart';
import '../../../../widgets/file_attachment_widget.dart';
import '../../../../widgets/text_field.dart';

class WorkOnSiteForm extends StatefulWidget {
  const WorkOnSiteForm({super.key});

  @override
  State<WorkOnSiteForm> createState() => _WorkOnSiteFormState();
}

class _WorkOnSiteFormState extends State<WorkOnSiteForm> {
  ///Controller
  String fieldPurpose = "";
  TextEditingController purposeController = TextEditingController();
  String fieldApprove = "";
  TextEditingController approveController = TextEditingController();
  String fieldFromDate = "";
  TextEditingController fromDateController = TextEditingController();
  String fieldFromTime = "";
  TextEditingController fromTimeController = TextEditingController();
  String fieldToDate = "";
  TextEditingController toDateController = TextEditingController();
  String fieldToTime = "";
  TextEditingController toTimeController = TextEditingController();
  String fieldDesc = "";
  TextEditingController descController = TextEditingController();
  String fieldLocation = "";
  TextEditingController locationController = TextEditingController();
  String fieldTransportation = "";
  TextEditingController transportationController = TextEditingController();
  String fieldTransportationType = "";
  TextEditingController transportationTypeController = TextEditingController();
  String fieldPlateName = "";
  TextEditingController plateNameController = TextEditingController();
  String fieldTicketNumber = "";
  TextEditingController ticketNumberController = TextEditingController();

  /// List
  List<XFile> listImage = [];
  final Map<dynamic, dynamic> listTransportationMap = {
    'ផ្ទាល់ខ្លួន': 'ផ្ទាល់ខ្លួន',
    'ក្រុមហ៊ុន': 'ក្រុមហ៊ុន'
  };
  List<ResultListUser> resultListUser = [];
  late Map<dynamic, dynamic> resultListUserMap = {};

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WorkOnSiteBloc()..add(EventGetListUser()),
      child: Scaffold(
          backgroundColor: AppColors().bgColorApp,
          appBar: AppBar(
            backgroundColor: Colors.lightBlueAccent,
            // automaticallyImplyLeading: false,
            title: Container(
              padding: const EdgeInsets.only(right: 50),
              child: const Center(
                  child: Text(
                "WORK-ON-SITE",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              )),
            ),
            leading: const BackButton(
              color: Colors.white,
            ),
          ),
          body: BlocConsumer<WorkOnSiteBloc, WorkOnSiteState>(
            listener: (context, state) {
              // TODO: implement listener
            },
            builder: (context, state) {
              if(state is WorkOnSiteError){
                return ErrorScreen();
              }
              else if(state is WorkOnSiteLoading){
                return LoadingScreen();
              }
              else if(state is WorkOnSiteGetListUserSuccess){
                resultListUser = state.resultListUser;
                for(var item in resultListUser){
                  final Map<int, String> listUser = {item.id: item.name};
                  resultListUserMap.addAll(listUser);
                  print("resultListUser=================${jsonEncode(item.name)}");
                  print("resultListUser=================${jsonEncode(item.id)}");
                }
              }

              return Stack(
                children: [
                  SizedBox(
                      width: double.infinity,
                      height: double.infinity,
                      child: Container(
                        width: double.infinity,
                        height: double.infinity,
                        decoration: BoxDecoration(
                          color: AppColors().bgColorApp,
                        ),
                      )),
                  Positioned(
                      child: Stack(
                    children: [
                      Container(
                        width: double.infinity,
                        height: 150,
                        decoration: const BoxDecoration(
                          color: Colors.lightBlueAccent,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(70),
                            bottomRight: Radius.circular(70),
                          ),
                        ),
                      ),
                      Positioned(
                          // top: 50,
                          child: Container(
                        margin: const EdgeInsets.only(
                            top: 30, left: 20, right: 20, bottom: 50),
                        width: double.infinity,
                        height: double.infinity,
                        decoration: BoxDecoration(
                            color: AppColors().white,
                            borderRadius: BorderRadius.circular(10.px),
                            boxShadow: [
                              BoxShadow(
                                color: AppColors().grey.withOpacity(0.2),
                                blurRadius: 5,
                                offset: const Offset(0, 0),
                              ),
                            ]),
                        child: SingleChildScrollView(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            children: [
                              /// Purpose
                              AppTextInput(
                                hint: "Purpose".tr,
                                controller: purposeController,
                                isError: fieldPurpose,
                              ),
                              SizedBox(height: 15.px),

                              /// Approved By
                              DropDownTextField(
                                textEditingController: approveController,
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.normal,
                                ),
                                hint: 'Approved By'.tr,
                                title: 'Approved By'.tr,
                                options: resultListUserMap,
                                isError: fieldApprove,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white.withOpacity(0.5),
                                  labelText: "Approved By".tr,
                                  labelStyle: TextStyle(
                                      color: fieldApprove.isEmpty
                                          ? Colors.grey.withOpacity(0.5)
                                          : AppColors().primaryRed),
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.auto,
                                  hintStyle: TextStyle(
                                    color: Colors.grey.withOpacity(0.5),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: fieldApprove.isEmpty
                                              ? Colors.cyan.withOpacity(0.2)
                                              : Colors.cyan.withOpacity(0.2),
                                          width: 1)),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: fieldApprove.isEmpty
                                              ? Colors.cyan.withOpacity(0.2)
                                              : Colors.red,
                                          width: 1)),
                                  suffixIcon: const Padding(
                                    padding: EdgeInsets.only(
                                        top: 8), // add padding to adjust icon
                                    child: Icon(Icons.arrow_drop_down),
                                  ),
                                ),
                                onChanged: (approveBy) {
                                  // approveByName = "${approveBy![0]}";
                                },
                              ),
                              SizedBox(height: 15.px),

                              /// fromDate
                              AppDatePicker(
                                hint: UrlPath().fromDate,
                                isError: fieldFromDate,
                                controller: fromDateController,
                                // suffixIcon: const Icon(Icons.date_range),
                              ),
                              SizedBox(height: 15.px),

                              /// fromTime
                              AppTimePickerBS(
                                hint: UrlPath().fromTime,
                                controller: fromTimeController,
                                isError: fieldFromTime,
                              ),
                              SizedBox(height: 15.px),

                              /// toDate
                              AppDatePicker(
                                hint: UrlPath().toDate,
                                isError: fieldToDate,
                                controller: toDateController,
                                // suffixIcon: const Icon(Icons.access_time),
                              ),
                              SizedBox(height: 15.px),

                              /// toTime
                              AppTimePickerBS(
                                hint: UrlPath().toTime,
                                controller: toTimeController,
                                isError: fieldToTime,
                              ),
                              SizedBox(height: 15.px),

                              /// Description
                              AppTextInput(
                                hint: "Description".tr,
                                controller: descController,
                                isError: fieldDesc,
                                maxLine: 4,
                              ),
                              SizedBox(height: 15.px),

                              /// Location
                              AppTextInput(
                                hint: "Location".tr,
                                controller: locationController,
                                isError: fieldLocation,
                              ),
                              SizedBox(height: 15.px),

                              /// Transportation
                              DropDownTextField(
                                textEditingController: transportationController,
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.normal,
                                ),
                                hint: 'Transportation'.tr,
                                title: 'Transportation'.tr,
                                options: listTransportationMap,
                                isError: fieldTransportation,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white.withOpacity(0.5),
                                  labelText: "Transportation".tr,
                                  labelStyle: TextStyle(
                                      color: fieldTransportation.isEmpty
                                          ? Colors.grey.withOpacity(0.5)
                                          : AppColors().primaryRed),
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.auto,
                                  hintStyle: TextStyle(
                                    color: Colors.grey.withOpacity(0.5),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: fieldTransportation.isEmpty
                                              ? Colors.cyan.withOpacity(0.2)
                                              : Colors.cyan.withOpacity(0.2),
                                          width: 1)),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: fieldTransportation.isEmpty
                                              ? Colors.cyan.withOpacity(0.2)
                                              : Colors.red,
                                          width: 1)),
                                  suffixIcon: const Padding(
                                    padding: EdgeInsets.only(
                                        top: 8), // add padding to adjust icon
                                    child: Icon(Icons.arrow_drop_down),
                                  ),
                                ),
                                onChanged: (transportation) {},
                              ),
                              SizedBox(height: 15.px),

                              /// Transportation_Type
                              DropDownTextField(
                                textEditingController:
                                    transportationTypeController,
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.normal,
                                ),
                                hint: 'Transportation_Type'.tr,
                                title: 'Transportation_Type'.tr,
                                options: listTransportationMap,
                                isError: fieldTransportationType,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white.withOpacity(0.5),
                                  labelText: "Transportation_Type".tr,
                                  labelStyle: TextStyle(
                                      color: fieldTransportation.isEmpty
                                          ? Colors.grey.withOpacity(0.5)
                                          : AppColors().primaryRed),
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.auto,
                                  hintStyle: TextStyle(
                                    color: Colors.grey.withOpacity(0.5),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: fieldTransportation.isEmpty
                                              ? Colors.cyan.withOpacity(0.2)
                                              : Colors.cyan.withOpacity(0.2),
                                          width: 1)),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: fieldTransportation.isEmpty
                                              ? Colors.cyan.withOpacity(0.2)
                                              : Colors.red,
                                          width: 1)),
                                  suffixIcon: const Padding(
                                    padding: EdgeInsets.only(
                                        top: 8), // add padding to adjust icon
                                    child: Icon(Icons.arrow_drop_down),
                                  ),
                                ),
                                onChanged: (transportationType) {},
                              ),
                              SizedBox(height: 15.px),

                              /// plateNameController
                              DropDownTextField(
                                textEditingController: plateNameController,
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.normal,
                                ),
                                hint: 'Plate_Number'.tr,
                                title: 'Plate_Number'.tr,
                                options: listTransportationMap,
                                isError: fieldPlateName,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white.withOpacity(0.5),
                                  labelText: "Plate_Number".tr,
                                  labelStyle: TextStyle(
                                      color: fieldTransportation.isEmpty
                                          ? Colors.grey.withOpacity(0.5)
                                          : AppColors().primaryRed),
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.auto,
                                  hintStyle: TextStyle(
                                    color: Colors.grey.withOpacity(0.5),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: fieldTransportation.isEmpty
                                              ? Colors.cyan.withOpacity(0.2)
                                              : Colors.cyan.withOpacity(0.2),
                                          width: 1)),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: fieldTransportation.isEmpty
                                              ? Colors.cyan.withOpacity(0.2)
                                              : Colors.red,
                                          width: 1)),
                                  suffixIcon: const Padding(
                                    padding: EdgeInsets.only(
                                        top: 8), // add padding to adjust icon
                                    child: Icon(Icons.arrow_drop_down),
                                  ),
                                ),
                                onChanged: (platNumber) {
                                  // platNumberName = "${platNumber![0]}";
                                },
                              ),
                              SizedBox(height: 15.px),

                              /// Ticket Number
                              DropDownTextField(
                                textEditingController: ticketNumberController,
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.normal,
                                ),
                                hint: 'Ticket Number'.tr,
                                title: 'Ticket Number'.tr,
                                options: listTransportationMap,
                                isError: fieldTicketNumber,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white.withOpacity(0.5),
                                  labelText: "Ticket Number".tr,
                                  labelStyle: TextStyle(
                                      color: fieldTicketNumber.isEmpty
                                          ? Colors.grey.withOpacity(0.5)
                                          : AppColors().primaryRed),
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.auto,
                                  hintStyle: TextStyle(
                                    color: Colors.grey.withOpacity(0.5),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: fieldTicketNumber.isEmpty
                                              ? Colors.cyan.withOpacity(0.2)
                                              : Colors.cyan.withOpacity(0.2),
                                          width: 1)),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: fieldTicketNumber.isEmpty
                                              ? Colors.cyan.withOpacity(0.2)
                                              : Colors.red,
                                          width: 1)),
                                  suffixIcon: const Padding(
                                    padding: EdgeInsets.only(
                                        top: 8), // add padding to adjust icon
                                    child: Icon(Icons.arrow_drop_down),
                                  ),
                                ),
                                onChanged: (ticketNumber) {
                                  // ticketName = "${ticketNumber![0]}";
                                },
                              ),

                              Container(
                                padding: EdgeInsets.only(
                                  bottom: 10.px,
                                ),
                                child: Text(
                                  "Reference".tr,
                                  style: AppTextStyle().titleS(),
                                ),
                              ),
                              FileAttachmentWidgets(
                                isText: false,
                                getListImage: (List<XFile> list) {
                                  listImage = list;
                                },
                              ),
                            ],
                          ),
                        ),
                      )),
                    ],
                  )),
                ],
              );
            },
          )),
    );
  }
}