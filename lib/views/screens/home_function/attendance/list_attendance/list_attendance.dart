import 'dart:convert';
import 'dart:io';

import 'package:all_in_one/views/widgets/loading/loading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../../data/models/attendance_model/list_attendance_model/list_attendance_model.dart';
import '../../../../../logic/bloc/attendance_bloc/list_attendance_bloc/list_attendance_bloc.dart';
import '../../../../../routes/config_router.dart';
import '../../../../../utils/app_bars/main_app_bar.dart';
import '../../../../../utils/constants/app_colors.dart';
import '../../../../../utils/constants/app_date_picker.dart';
import '../../../../../utils/constants/app_dialog.dart';
import '../../../../../utils/constants/app_dimensions.dart';
import '../../../../../utils/constants/app_font_styles.dart';
import '../../../../../utils/global_use.dart';
import '../../../../../utils/shared_preferences_service.dart';
import '../../../../widgets/error_screen.dart';

class ListAttendanceScreen extends StatefulWidget {
  const ListAttendanceScreen({super.key});

  @override
  State<ListAttendanceScreen> createState() => _ListAttendanceScreenState();
}

class _ListAttendanceScreenState extends State<ListAttendanceScreen> {
  final RefreshController _paginationController = RefreshController();
  DateTime? startDate;
  DateTime? endDate;
  DateTime? dateTime;
  //bool checkTime = true;
  bool isCheckBtn = true;
  // AttendanceUserResult? dataAttendanceUser;
  List<ResultListAttendance> resultListAttendance = [];
  String idUser = "";
  var date = "";
  var fromDate = '';
  var toDate = '';
  String dateSuccess = "";
  String getIdChatByMe(String res) {
    return res.substring(0, res.indexOf(" "));
  }

  String DateUpdated = '';
  String DateFromUpdated = '';
  String DateToUpdated = '';
  int page = 1;
  int totalPage = 1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dateTime = DateTime.now();
    date = DateFormat("dd-MM-yyyy").format(dateTime!);
    idUser = SharedPreferencesService.instance!.getUserId!;
    dateSuccess = date;
  }

  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ListAttendanceBloc()..add(GetListAttendanceUserEvent(userID: int.parse(idUser), fromDate: date, toDate: date, page: page)),
      child: Scaffold(
        backgroundColor: AppColors().bgColorApp,
        appBar: AppBar(
          backgroundColor: Colors.lightBlueAccent,
          // automaticallyImplyLeading: false,
          title: Container(
            padding: const EdgeInsets.only(right: 50),
            child: const Center(
                child: Text(
              "ATTENDANCE",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            )),
          ),
          leading: const BackButton(
            color: Colors.white,
          ),
        ),
        body: BlocConsumer<ListAttendanceBloc, ListAttendanceState>(
          listener: (context, state) {
          },
          builder: (context, state) {
            if (state is ListAttendanceLoading) {
              return const LoadingScreen();
            }
            else if (state is ListAttendanceError) {
              return const ErrorScreen();
            }
            else if (state is ListAttendanceSuccess) {
              resultListAttendance = state.resultListAttendance;
              dateSuccess = state.toDate;
              totalPage = state.totalPage;
              print("resultListAttendance=========${jsonEncode(resultListAttendance)}");
            }
            return Stack(
              children: [
                SizedBox(
                    width: double.infinity,
                    height: double.infinity,
                    child: Container(
                      width: screenWidth,
                      height: screenHeight,
                      decoration: BoxDecoration(
                        color: AppColors().bgColorApp,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                      ),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 90,
                          ),
                          Expanded(
                            child: SmartRefresher(
                              controller: _paginationController,
                              onRefresh: () {
                                print("tests=============${resultListAttendance.length}");
                                page = 1;
                                context.read<ListAttendanceBloc>().add(GetListAttendanceUserEvent(userID: int.parse(idUser), fromDate: date, toDate: date, page: page));
                                _paginationController.loadComplete();
                              },
                            
                              onLoading: () {
                                print("test=============${resultListAttendance.length}");
                                if (resultListAttendance.length == totalPage) {
                                  _paginationController.loadNoData();
                                } else {
                                  page++;
                                  context.read<ListAttendanceBloc>().add(GetLastDataAttendanceUserEvent(userID: int.parse(idUser), fromDate: fromDate, toDate: toDate, page: page, oldData: resultListAttendance));
                                  _paginationController.loadComplete();
                                }
                              },
                              physics: const BouncingScrollPhysics(),
                              enablePullDown: true,
                              enablePullUp: true,
                              header: MaterialClassicHeader(
                                color: AppColors().primaryRed,
                              ),
                              child: ListView.builder(
                                  shrinkWrap: true,
                                  padding: EdgeInsets.zero,
                                  physics: const BouncingScrollPhysics(),
                                  itemCount: resultListAttendance.length,
                                  // itemCount: 4,
                                  itemBuilder: (context, index) {
                                    return Container(
                                      width: double.infinity,
                                      height: 170,
                                      margin: EdgeInsets.only(
                                        left: AppDimension().bodySpace,
                                        right: AppDimension().bodySpace,
                                        bottom: 15.px,
                                      ),
                                      decoration: BoxDecoration(
                                          color: AppColors().white,
                                          borderRadius:
                                          BorderRadius.circular(6.px),
                                          boxShadow: [
                                            BoxShadow(
                                              color: AppColors()
                                                  .grey
                                                  .withOpacity(0.2),
                                              blurRadius: 5,
                                              offset: const Offset(0, 0),
                                            ),
                                          ]),
                                      child: Column(
                                        children: [
                                          Expanded(
                                            flex: 2,
                                            child: Container(
                                              width: double.infinity,
                                              height: 50,
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 10.px),
                                              decoration: BoxDecoration(
                                                  color: Color(0xff92DDFB),
                                                  borderRadius:
                                                  BorderRadius.only(
                                                    topRight:
                                                    Radius.circular(6.px),
                                                    topLeft:
                                                    Radius.circular(6.px),
                                                  )),
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    Icons.access_alarm,
                                                    color: AppColors().white,
                                                  ),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  resultListAttendance[index]
                                                      .date ==
                                                      null ||
                                                      resultListAttendance[
                                                      index]
                                                          .date ==
                                                          ""
                                                      ? Text(
                                                    "N/A",
                                                    style: TextStyle(
                                                      color: AppColors()
                                                          .white,
                                                    ),
                                                  )
                                                      : Text(
                                                    "${resultListAttendance[index].date}",
                                                    style: TextStyle(
                                                      color: AppColors()
                                                          .white,
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 5,
                                            child: Container(
                                              padding:
                                              EdgeInsets.only(top: 10),
                                              width: double.infinity,
                                              decoration: BoxDecoration(
                                                // color: Colors.orange,
                                                  borderRadius:
                                                  BorderRadius.only(
                                                    bottomRight:
                                                    Radius.circular(6.px),
                                                    bottomLeft:
                                                    Radius.circular(6.px),
                                                  )),
                                              child: Row(
                                                children: [
                                                  Expanded(
                                                    flex: 5,
                                                    child: Column(
                                                      children: [
                                                        Container(
                                                          width: 120.px,
                                                          padding:
                                                          EdgeInsets.only(
                                                              bottom:
                                                              5.px,
                                                              top: 5.px),
                                                          decoration: BoxDecoration(
                                                              color: AppColors()
                                                                  .primaryBlue,
                                                              borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                  5.px)),
                                                          child: Row(
                                                            children: [
                                                              Container(
                                                                padding: EdgeInsets
                                                                    .symmetric(
                                                                    horizontal:
                                                                    10.px),
                                                                child: Icon(
                                                                    Icons
                                                                        .access_alarm,
                                                                    color: AppColors()
                                                                        .white),
                                                              ),
                                                              Text(
                                                                "Morning".tr,
                                                                style: AppTextStyle()
                                                                    .titleS(
                                                                    color:
                                                                    AppColors().white),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        SizedBox(
                                                            height: 10.px),
                                                        Container(
                                                          padding:
                                                          EdgeInsets.only(
                                                            left: 10.px,
                                                          ),
                                                          width:
                                                          double.infinity,
                                                          child: Column(
                                                            crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                            children: [
                                                              Container(
                                                                padding: EdgeInsets
                                                                    .only(
                                                                    bottom:
                                                                    5.px),
                                                                child: Row(
                                                                  children: [
                                                                    Expanded(
                                                                      flex: 2,
                                                                      child:
                                                                      SizedBox(
                                                                        width:
                                                                        90.px,
                                                                        child:
                                                                        Text(
                                                                          'Check In'.tr,
                                                                          style:
                                                                          AppTextStyle().textLabelDetail(),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Container(
                                                                      padding:
                                                                      EdgeInsets.symmetric(horizontal: 5.px),
                                                                      child:
                                                                      Text(
                                                                        ':',
                                                                        style:
                                                                        AppTextStyle().textLabelDetail(),
                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                      flex: 2,
                                                                      child: resultListAttendance[index].morningCheckInTime == null ||
                                                                          resultListAttendance[index].morningCheckInTime == ''
                                                                          ? Text("Absent".tr, style: AppTextStyle().textS(color: AppColors().primaryRed))
                                                                          : Text(resultListAttendance[index].morningCheckInTime, style: AppTextStyle().textS()),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              Container(
                                                                padding: EdgeInsets
                                                                    .only(
                                                                    bottom:
                                                                    5.px),
                                                                child: Row(
                                                                  children: [
                                                                    Expanded(
                                                                      flex: 2,
                                                                      child:
                                                                      SizedBox(
                                                                        width:
                                                                        90.px,
                                                                        child:
                                                                        Text(
                                                                          'Break Out'.tr,
                                                                          style:
                                                                          AppTextStyle().textLabelDetail(),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Container(
                                                                      padding:
                                                                      EdgeInsets.symmetric(horizontal: 5.px),
                                                                      child:
                                                                      Text(
                                                                        ':',
                                                                        style:
                                                                        AppTextStyle().textLabelDetail(),
                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                      flex: 2,
                                                                      child: resultListAttendance[index].morningCheckOutTime.isNotEmpty
                                                                          ? Text(resultListAttendance[index].morningCheckOutTime,
                                                                          style: AppTextStyle().textS())
                                                                          : Text("N/A".tr, style: AppTextStyle().textS(color: AppColors().primaryRed)),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  Container(
                                                    // margin: EdgeInsets.symmetric(horizontal: 5.px),
                                                    color: AppColors()
                                                        .grey
                                                        .withOpacity(0.5),
                                                    width: 2,
                                                    height: 100,
                                                  ),
                                                  Expanded(
                                                    flex: 5,
                                                    child: Column(
                                                      children: [
                                                        Container(
                                                          width: 120.px,
                                                          padding:
                                                          EdgeInsets.only(
                                                              bottom:
                                                              5.px,
                                                              top: 5.px),
                                                          decoration: BoxDecoration(
                                                              color: AppColors()
                                                                  .primaryBlue,
                                                              borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                  5.px)),
                                                          child: Row(
                                                            children: [
                                                              Container(
                                                                padding: EdgeInsets
                                                                    .symmetric(
                                                                    horizontal:
                                                                    10.px),
                                                                child: Icon(
                                                                    Icons
                                                                        .access_alarm,
                                                                    color: AppColors()
                                                                        .white),
                                                              ),
                                                              Text(
                                                                "Evening".tr,
                                                                style: AppTextStyle()
                                                                    .titleS(
                                                                    color:
                                                                    AppColors().white),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        SizedBox(
                                                            height: 10.px),
                                                        Container(
                                                          padding:
                                                          EdgeInsets.only(
                                                            left: 10.px,
                                                          ),
                                                          width:
                                                          double.infinity,
                                                          child: Column(
                                                            crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                            children: [
                                                              Container(
                                                                padding: EdgeInsets
                                                                    .only(
                                                                    bottom:
                                                                    5.px),
                                                                child: Row(
                                                                  children: [
                                                                    Expanded(
                                                                      flex: 2,
                                                                      child:
                                                                      SizedBox(
                                                                        width:
                                                                        90.px,
                                                                        child:
                                                                        Text(
                                                                          'Break In'.tr,
                                                                          style:
                                                                          AppTextStyle().textLabelDetail(),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Container(
                                                                      padding:
                                                                      EdgeInsets.symmetric(horizontal: 5.px),
                                                                      child:
                                                                      Text(
                                                                        ':',
                                                                        style:
                                                                        AppTextStyle().textLabelDetail(),
                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                        flex:
                                                                        2,
                                                                        child: resultListAttendance[index].afternoonCheckInTime == null || resultListAttendance[index].afternoonCheckInTime.isEmpty
                                                                            ? Text("Absent".tr, style: AppTextStyle().textS(color: AppColors().primaryRed))
                                                                            : Text(resultListAttendance[index].afternoonCheckInTime, style: AppTextStyle().textS())),
                                                                  ],
                                                                ),
                                                              ),
                                                              Container(
                                                                padding: EdgeInsets
                                                                    .only(
                                                                    bottom:
                                                                    5.px),
                                                                child: Row(
                                                                  children: [
                                                                    Expanded(
                                                                      flex: 2,
                                                                      child:
                                                                      SizedBox(
                                                                        width:
                                                                        90.px,
                                                                        child:
                                                                        Text(
                                                                          'Check Out'.tr,
                                                                          style:
                                                                          AppTextStyle().textLabelDetail(),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Container(
                                                                      padding:
                                                                      EdgeInsets.symmetric(horizontal: 5.px),
                                                                      child:
                                                                      Text(
                                                                        ':',
                                                                        style:
                                                                        AppTextStyle().textLabelDetail(),
                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                        flex:
                                                                        2,
                                                                        child: resultListAttendance[index].afternoonCheckOutTime == null || resultListAttendance[index].afternoonCheckOutTime == '' || resultListAttendance[index].afternoonCheckOutTime.isEmpty
                                                                            ? Text("N/A".tr, style: AppTextStyle().textS(color: AppColors().primaryRed))
                                                                            : Text("${resultListAttendance[index].afternoonCheckOutTime}", style: AppTextStyle().textS())),
                                                                  ],
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    );
                                  }),
                            ),
                          ),
                          // ListView.builder(
                          //     shrinkWrap: true,
                          //     padding: EdgeInsets.zero,
                          //     physics: const BouncingScrollPhysics(),
                          //     itemCount: resultListAttendance.length,
                          //     // itemCount: 4,
                          //     itemBuilder: (context, index) {
                          //       return Container(
                          //         width: double.infinity,
                          //         height: 170,
                          //         margin: EdgeInsets.only(
                          //           left: AppDimension().bodySpace,
                          //           right: AppDimension().bodySpace,
                          //           bottom: 15.px,
                          //         ),
                          //         decoration: BoxDecoration(
                          //             color: AppColors().white,
                          //             borderRadius:
                          //             BorderRadius.circular(6.px),
                          //             boxShadow: [
                          //               BoxShadow(
                          //                 color: AppColors()
                          //                     .grey
                          //                     .withOpacity(0.2),
                          //                 blurRadius: 5,
                          //                 offset: const Offset(0, 0),
                          //               ),
                          //             ]),
                          //         child: Column(
                          //           children: [
                          //             Expanded(
                          //               flex: 2,
                          //               child: Container(
                          //                 width: double.infinity,
                          //                 height: 50,
                          //                 padding: EdgeInsets.symmetric(
                          //                     horizontal: 10.px),
                          //                 decoration: BoxDecoration(
                          //                     color: Color(0xff92DDFB),
                          //                     borderRadius:
                          //                     BorderRadius.only(
                          //                       topRight:
                          //                       Radius.circular(6.px),
                          //                       topLeft:
                          //                       Radius.circular(6.px),
                          //                     )),
                          //                 child: Row(
                          //                   children: [
                          //                     Icon(
                          //                       Icons.access_alarm,
                          //                       color: AppColors().white,
                          //                     ),
                          //                     SizedBox(
                          //                       width: 10,
                          //                     ),
                          //                     resultListAttendance[index]
                          //                         .date ==
                          //                         null ||
                          //                         resultListAttendance[
                          //                         index]
                          //                             .date ==
                          //                             ""
                          //                         ? Text(
                          //                       "N/A",
                          //                       style: TextStyle(
                          //                         color: AppColors()
                          //                             .white,
                          //                       ),
                          //                     )
                          //                         : Text(
                          //                       "${resultListAttendance[index].date}",
                          //                       style: TextStyle(
                          //                         color: AppColors()
                          //                             .white,
                          //                       ),
                          //                     )
                          //                   ],
                          //                 ),
                          //               ),
                          //             ),
                          //             Expanded(
                          //               flex: 5,
                          //               child: Container(
                          //                 padding:
                          //                 EdgeInsets.only(top: 10),
                          //                 width: double.infinity,
                          //                 decoration: BoxDecoration(
                          //                   // color: Colors.orange,
                          //                     borderRadius:
                          //                     BorderRadius.only(
                          //                       bottomRight:
                          //                       Radius.circular(6.px),
                          //                       bottomLeft:
                          //                       Radius.circular(6.px),
                          //                     )),
                          //                 child: Row(
                          //                   children: [
                          //                     Expanded(
                          //                       flex: 5,
                          //                       child: Column(
                          //                         children: [
                          //                           Container(
                          //                             width: 120.px,
                          //                             padding:
                          //                             EdgeInsets.only(
                          //                                 bottom:
                          //                                 5.px,
                          //                                 top: 5.px),
                          //                             decoration: BoxDecoration(
                          //                                 color: AppColors()
                          //                                     .primaryBlue,
                          //                                 borderRadius:
                          //                                 BorderRadius
                          //                                     .circular(
                          //                                     5.px)),
                          //                             child: Row(
                          //                               children: [
                          //                                 Container(
                          //                                   padding: EdgeInsets
                          //                                       .symmetric(
                          //                                       horizontal:
                          //                                       10.px),
                          //                                   child: Icon(
                          //                                       Icons
                          //                                           .access_alarm,
                          //                                       color: AppColors()
                          //                                           .white),
                          //                                 ),
                          //                                 Text(
                          //                                   "Morning".tr,
                          //                                   style: AppTextStyle()
                          //                                       .titleS(
                          //                                       color:
                          //                                       AppColors().white),
                          //                                 ),
                          //                               ],
                          //                             ),
                          //                           ),
                          //                           SizedBox(
                          //                               height: 10.px),
                          //                           Container(
                          //                             padding:
                          //                             EdgeInsets.only(
                          //                               left: 10.px,
                          //                             ),
                          //                             width:
                          //                             double.infinity,
                          //                             child: Column(
                          //                               crossAxisAlignment:
                          //                               CrossAxisAlignment
                          //                                   .start,
                          //                               children: [
                          //                                 Container(
                          //                                   padding: EdgeInsets
                          //                                       .only(
                          //                                       bottom:
                          //                                       5.px),
                          //                                   child: Row(
                          //                                     children: [
                          //                                       Expanded(
                          //                                         flex: 2,
                          //                                         child:
                          //                                         SizedBox(
                          //                                           width:
                          //                                           90.px,
                          //                                           child:
                          //                                           Text(
                          //                                             'Check In'.tr,
                          //                                             style:
                          //                                             AppTextStyle().textLabelDetail(),
                          //                                           ),
                          //                                         ),
                          //                                       ),
                          //                                       Container(
                          //                                         padding:
                          //                                         EdgeInsets.symmetric(horizontal: 5.px),
                          //                                         child:
                          //                                         Text(
                          //                                           ':',
                          //                                           style:
                          //                                           AppTextStyle().textLabelDetail(),
                          //                                         ),
                          //                                       ),
                          //                                       Expanded(
                          //                                         flex: 2,
                          //                                         child: resultListAttendance[index].morningCheckInTime == null ||
                          //                                             resultListAttendance[index].morningCheckInTime == ''
                          //                                             ? Text("Absent".tr, style: AppTextStyle().textS(color: AppColors().primaryRed))
                          //                                             : Text(resultListAttendance[index].morningCheckInTime, style: AppTextStyle().textS()),
                          //                                       ),
                          //                                     ],
                          //                                   ),
                          //                                 ),
                          //                                 Container(
                          //                                   padding: EdgeInsets
                          //                                       .only(
                          //                                       bottom:
                          //                                       5.px),
                          //                                   child: Row(
                          //                                     children: [
                          //                                       Expanded(
                          //                                         flex: 2,
                          //                                         child:
                          //                                         SizedBox(
                          //                                           width:
                          //                                           90.px,
                          //                                           child:
                          //                                           Text(
                          //                                             'Break Out'.tr,
                          //                                             style:
                          //                                             AppTextStyle().textLabelDetail(),
                          //                                           ),
                          //                                         ),
                          //                                       ),
                          //                                       Container(
                          //                                         padding:
                          //                                         EdgeInsets.symmetric(horizontal: 5.px),
                          //                                         child:
                          //                                         Text(
                          //                                           ':',
                          //                                           style:
                          //                                           AppTextStyle().textLabelDetail(),
                          //                                         ),
                          //                                       ),
                          //                                       Expanded(
                          //                                         flex: 2,
                          //                                         child: resultListAttendance[index].morningCheckOutTime.isNotEmpty
                          //                                             ? Text(resultListAttendance[index].morningCheckOutTime,
                          //                                             style: AppTextStyle().textS())
                          //                                             : Text("N/A".tr, style: AppTextStyle().textS(color: AppColors().primaryRed)),
                          //                                       ),
                          //                                     ],
                          //                                   ),
                          //                                 ),
                          //                               ],
                          //                             ),
                          //                           )
                          //                         ],
                          //                       ),
                          //                     ),
                          //                     Container(
                          //                       // margin: EdgeInsets.symmetric(horizontal: 5.px),
                          //                       color: AppColors()
                          //                           .grey
                          //                           .withOpacity(0.5),
                          //                       width: 2,
                          //                       height: 100,
                          //                     ),
                          //                     Expanded(
                          //                       flex: 5,
                          //                       child: Column(
                          //                         children: [
                          //                           Container(
                          //                             width: 120.px,
                          //                             padding:
                          //                             EdgeInsets.only(
                          //                                 bottom:
                          //                                 5.px,
                          //                                 top: 5.px),
                          //                             decoration: BoxDecoration(
                          //                                 color: AppColors()
                          //                                     .primaryBlue,
                          //                                 borderRadius:
                          //                                 BorderRadius
                          //                                     .circular(
                          //                                     5.px)),
                          //                             child: Row(
                          //                               children: [
                          //                                 Container(
                          //                                   padding: EdgeInsets
                          //                                       .symmetric(
                          //                                       horizontal:
                          //                                       10.px),
                          //                                   child: Icon(
                          //                                       Icons
                          //                                           .access_alarm,
                          //                                       color: AppColors()
                          //                                           .white),
                          //                                 ),
                          //                                 Text(
                          //                                   "Evening".tr,
                          //                                   style: AppTextStyle()
                          //                                       .titleS(
                          //                                       color:
                          //                                       AppColors().white),
                          //                                 ),
                          //                               ],
                          //                             ),
                          //                           ),
                          //                           SizedBox(
                          //                               height: 10.px),
                          //                           Container(
                          //                             padding:
                          //                             EdgeInsets.only(
                          //                               left: 10.px,
                          //                             ),
                          //                             width:
                          //                             double.infinity,
                          //                             child: Column(
                          //                               crossAxisAlignment:
                          //                               CrossAxisAlignment
                          //                                   .start,
                          //                               children: [
                          //                                 Container(
                          //                                   padding: EdgeInsets
                          //                                       .only(
                          //                                       bottom:
                          //                                       5.px),
                          //                                   child: Row(
                          //                                     children: [
                          //                                       Expanded(
                          //                                         flex: 2,
                          //                                         child:
                          //                                         SizedBox(
                          //                                           width:
                          //                                           90.px,
                          //                                           child:
                          //                                           Text(
                          //                                             'Break In'.tr,
                          //                                             style:
                          //                                             AppTextStyle().textLabelDetail(),
                          //                                           ),
                          //                                         ),
                          //                                       ),
                          //                                       Container(
                          //                                         padding:
                          //                                         EdgeInsets.symmetric(horizontal: 5.px),
                          //                                         child:
                          //                                         Text(
                          //                                           ':',
                          //                                           style:
                          //                                           AppTextStyle().textLabelDetail(),
                          //                                         ),
                          //                                       ),
                          //                                       Expanded(
                          //                                           flex:
                          //                                           2,
                          //                                           child: resultListAttendance[index].afternoonCheckInTime == null || resultListAttendance[index].afternoonCheckInTime.isEmpty
                          //                                               ? Text("Absent".tr, style: AppTextStyle().textS(color: AppColors().primaryRed))
                          //                                               : Text(resultListAttendance[index].afternoonCheckInTime, style: AppTextStyle().textS())),
                          //                                     ],
                          //                                   ),
                          //                                 ),
                          //                                 Container(
                          //                                   padding: EdgeInsets
                          //                                       .only(
                          //                                       bottom:
                          //                                       5.px),
                          //                                   child: Row(
                          //                                     children: [
                          //                                       Expanded(
                          //                                         flex: 2,
                          //                                         child:
                          //                                         SizedBox(
                          //                                           width:
                          //                                           90.px,
                          //                                           child:
                          //                                           Text(
                          //                                             'Check Out'.tr,
                          //                                             style:
                          //                                             AppTextStyle().textLabelDetail(),
                          //                                           ),
                          //                                         ),
                          //                                       ),
                          //                                       Container(
                          //                                         padding:
                          //                                         EdgeInsets.symmetric(horizontal: 5.px),
                          //                                         child:
                          //                                         Text(
                          //                                           ':',
                          //                                           style:
                          //                                           AppTextStyle().textLabelDetail(),
                          //                                         ),
                          //                                       ),
                          //                                       Expanded(
                          //                                           flex:
                          //                                           2,
                          //                                           child: resultListAttendance[index].afternoonCheckOutTime == null || resultListAttendance[index].afternoonCheckOutTime == '' || resultListAttendance[index].afternoonCheckOutTime.isEmpty
                          //                                               ? Text("N/A".tr, style: AppTextStyle().textS(color: AppColors().primaryRed))
                          //                                               : Text("${resultListAttendance[index].afternoonCheckOutTime}", style: AppTextStyle().textS())),
                          //                                     ],
                          //                                   ),
                          //                                 ),
                          //                               ],
                          //                             ),
                          //                           )
                          //                         ],
                          //                       ),
                          //                     ),
                          //                   ],
                          //                 ),
                          //               ),
                          //             )
                          //           ],
                          //         ),
                          //       );
                          //     })
                        ],
                      ),
                    )),

                Builder(
                    builder: (context) {
                      if(state is ListAttendanceLoadingMore) {
                        return Container(
                            child: CircularProgressIndicator(
                                color: Colors.blue));
                      }
                      return const SizedBox.shrink();
                    }
                ),

                Positioned(
                    child: Container(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  width: double.infinity,
                  height: 70,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(20),
                          topLeft: Radius.circular(20)),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors().grey.withOpacity(0.1),
                          spreadRadius: 3,
                          blurRadius: 3,
                        )
                      ]),
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                                child: Row(
                              children: [
                                Text(
                                  "From Date".tr,
                                  style: AppTextStyle()
                                      .textS(fontWeight: FontWeight.bold),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                                Text(
                                  " *".tr,
                                  style: AppTextStyle().textS(
                                      fontWeight: FontWeight.bold,
                                      color: AppColors().primaryRed),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                              ],
                            )),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                InkWell(
                                  onTap: () async {
                                    fromDate = await AppDatePickers()
                                        .datePickers(context);
                                    setState(() {
                                      DateFromUpdated = fromDate;
                                      toDate = date;
                                    });
                                  },
                                  child: Container(
                                      margin: EdgeInsets.only(right: 5.px),
                                      child: Icon(
                                        Icons.calendar_today,
                                        color: Colors.lightBlueAccent,
                                      )),
                                ),
                                Container(
                                  child: DateFromUpdated == ""
                                      ?
                                      // dataAttendanceUser!.attendance[0].date == ''?
                                      Text(
                                          "${DateFormat("dd-MM-yyyy").format(dateTime!)}",
                                          style: AppTextStyle().textS(),
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                        )
                                      : Text(
                                          DateFromUpdated,
                                          style: AppTextStyle().textS(
                                            color: AppColors().primaryBlue,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                        ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                                padding: EdgeInsets.only(
                                  right: 15.px,
                                ),
                                child: Row(
                                  children: [
                                    Text(
                                      "To Date".tr,
                                      style: AppTextStyle()
                                          .textS(fontWeight: FontWeight.bold),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                    ),
                                    Text(
                                      " *".tr,
                                      style: AppTextStyle().textS(
                                          fontWeight: FontWeight.bold,
                                          color: AppColors().primaryRed),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                    ),
                                  ],
                                )),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                InkWell(
                                  onTap: () async {
                                    toDate = await AppDatePickers()
                                        .datePickers(context);
                                    if (fromDate.compareTo(toDate) == 0) {
                                    } else if (fromDate.compareTo(toDate) < 0) {
                                    } else if (fromDate.compareTo(toDate) > 0) {
                                      AppDialog.alertDateFromSmallerThanDateTo(
                                          context,
                                          text:
                                              "From Date must be smaller than or equal! To Date"
                                                  .tr);
                                    }
                                    setState(() {
                                      DateToUpdated = toDate;
                                    });
                                  },
                                  child: Container(
                                      margin: EdgeInsets.only(right: 5.px),
                                      child: Icon(
                                        Icons.calendar_today,
                                        color: Colors.lightBlueAccent,
                                      )),
                                ),
                                Container(
                                  padding: EdgeInsets.only(
                                    right: 15.px,
                                  ),
                                  child: DateToUpdated == ""
                                      ?
                                      // dataAttendanceUser!.attendance[0].date == ''?
                                      Text(
                                          "${DateFormat("dd-MM-yyyy").format(dateTime!)}",
                                          style: AppTextStyle().textS(),
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                        )
                                      : Text(
                                          DateToUpdated,
                                          style: AppTextStyle().textS(
                                            color: AppColors().primaryBlue,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                        ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      fromDate.compareTo(toDate) > 0
                          ? Expanded(
                              flex: 1,
                              child: InkWell(
                                onTap: () {},
                                child: Container(
                                  height: 30,
                                  decoration: BoxDecoration(
                                      color: AppColors()
                                          .primaryBlue
                                          .withOpacity(0.2),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Center(
                                      child: Text(
                                    "Apply".tr,
                                    style: TextStyle(color: Colors.white),
                                  )),
                                ),
                              ),
                            )
                          : Expanded(
                              flex: 1,
                              child: InkWell(
                                onTap: () {
                                  if (toDate != null && fromDate != null) {
                                    context.read<ListAttendanceBloc>().add(
                                        GetListAttendanceUserEvent(
                                            page: page,
                                            userID: int.parse(idUser),
                                            fromDate: fromDate,
                                            toDate: toDate));
                                  }
                                  print(
                                      "test===============${int.parse(idUser)}");
                                  print("test===============${fromDate}");
                                  print("test===============${toDate}");
                                },
                                child: Container(
                                  height: 30,
                                  decoration: BoxDecoration(
                                      color: AppColors().primaryBlue,
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Center(
                                      child: Text(
                                    "Apply".tr,
                                    style: TextStyle(color: Colors.white),
                                  )),
                                ),
                              ),
                            )
                    ],
                  ),
                )),
              ],
            );
          },
        ),
      ),
    );
  }
}
