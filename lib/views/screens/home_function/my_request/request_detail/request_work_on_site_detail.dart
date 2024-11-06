import 'dart:convert';

import 'package:all_in_one/views/screens/home_function/my_request/request_detail/widgets/item_work_on_site_detail.dart';
import 'package:all_in_one/views/widgets/error_screen.dart';
import 'package:all_in_one/views/widgets/loading/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../../data/models/all_form_detail_model/work_on_site_detail_model.dart';
import '../../../../../logic/bloc/all_form_detail_bloc/all_form_detail_bloc.dart';
import '../../../../../routes/config_router.dart';
import '../../../../../utils/constants/app_colors.dart';
import '../../../../../utils/constants/app_dimensions.dart';
import '../../../../../utils/constants/app_font_styles.dart';
import '../../../../../utils/global_use.dart';
import '../../form/work_on_site/work_on_site.dart';

import 'package:dotted_line/dotted_line.dart';

class RequestDetailScreen extends StatefulWidget {
  int id =1;
  RequestDetailScreen({Key? key,
    required  this.id
  }) : super(key: key);

  @override
  State<RequestDetailScreen> createState() => _RequestDetailScreenState();
}

class _RequestDetailScreenState extends State<RequestDetailScreen> {
  int id = 11682;
  List<ResultFormWorkOnSiteDetail> resultFormWorkOnSiteDetail = [];
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AllFormDetailBloc()..add(EventGetFormWorkOnSiteDetail(id: widget.id)),
      child: Scaffold(
          backgroundColor: AppColors().bgColorApp,
          appBar: AppBar(
            backgroundColor: Colors.lightBlueAccent,
            // automaticallyImplyLeading: false,
            title: Container(
                padding: EdgeInsets.only(right: 50),
                child: const Center(
                    child: Text("My Request Detail Detail",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ))),
            leading: const BackButton(
              color: Colors.white,
            ),
          ),
          body: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: BlocConsumer<AllFormDetailBloc, AllFormDetailState>(
              listener: (context, state) {
              },
              builder: (context, state) {

                if(state is AllFormDetailLoading){
                  return LoadingScreen();
                }
                else if(state is AllFormDetailError){
                  return ErrorScreen();
                }
                else if(state is  FormWorkOnSiteDetailSuccess){
                  resultFormWorkOnSiteDetail = state.resultFormWorkOnSiteDetail;
                  // print("resultFormWorkOnSiteDetail==${jsonEncode(resultFormWorkOnSiteDetail)}");
                  return SingleChildScrollView(
                      child: Container(
                          // width: double.infinity,
                          // height: 700,
                          // padding: EdgeInsets.only(
                          //   left: AppDimension().smallSpace,
                          //   right: AppDimension().smallSpace,
                          //   top: AppDimension().smallSpace,
                          // ),
                          child: Column(
                            children: [
                              ListView.builder(
                                  padding: EdgeInsets.zero,
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: resultFormWorkOnSiteDetail.length,
                                  itemBuilder: (context, index) {
                                    // return Text("${resultFormWorkOnSiteDetail}");
                                    return ItemWorkOnSiteDetail(dataWorkOnSiteDetail: resultFormWorkOnSiteDetail[index]);
                                  }
                              )],
                          )
                      )
                  );
                }
                return Container();
            }
                    ),
          )
      )
    );
  }
}
