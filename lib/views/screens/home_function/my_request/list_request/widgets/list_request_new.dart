import 'dart:convert';

import 'package:all_in_one/routes/config_router.dart';
import 'package:all_in_one/views/widgets/error_screen.dart';
import 'package:all_in_one/views/widgets/loading/loading.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

import '../../../../../../data/models/my_request_model/list_request_model/list_request_model.dart';
import '../../../../../../logic/bloc/my_request_bloc/list_request_bloc/list_request_bloc.dart';
import '../../../../../../utils/constants/app_colors.dart';
import '../../../../../../utils/global_use.dart';
import 'package:intl/intl.dart';

import '../../../../../widgets/no_data_screen.dart';
import '../../request_detail/request_work_on_site_detail.dart';

class ListRequestNew extends StatefulWidget {
  const ListRequestNew({Key? key}) : super(key: key);

  @override
  State<ListRequestNew> createState() => _ListRequestNewState();
}

class _ListRequestNewState extends State<ListRequestNew> {


  final RefreshController _paginationController = RefreshController();
  int totalPage = 1;
  int page = 1;
  String status = '';
  List<ResultListRequest> resultListRequest = [];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
      ListRequestBloc()..add(EventGetListRequest(page: page, status: 'new', search: '')),
      child: Scaffold(
        backgroundColor: AppColors().bgColorApp,
        body: BlocConsumer<ListRequestBloc, ListRequestState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            if(state is ListRequestError){
              return ErrorScreen();
            }
            else if(state is ListRequestLoading){
              return LoadingScreen();
            }
            else if(state is ListRequestSuccess){
              resultListRequest = state.resultListRequest;
              totalPage = state.totalPage;
              if(resultListRequest.isEmpty){
                return NoDataScreen();
              }
            }
            return Container(
              width: double.infinity,
              height: double.infinity,
              child: Expanded(
                child: SmartRefresher(
                  controller: _paginationController,
                  onRefresh: () {
                    // print("tests=============${resultListAttendance.length}");
                    page = 1;
                    context.read<ListRequestBloc>().add(EventGetListRequest( page: page, status: 'new', search: ''));
                    _paginationController.loadComplete();
                  },

                  onLoading: () {
                    // print("test=============${resultListAttendance.length}");
                    if (resultListRequest.length == totalPage) {
                      _paginationController.loadNoData();
                    } else {
                      page++;
                      context.read<ListRequestBloc>().add(GetLastDataListRequest( page: page, oldData: resultListRequest, status: 'new', search: ''));
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
                    padding: EdgeInsets.all(15),
                    itemCount: resultListRequest.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: (){

                          print("test============${resultListRequest[index].eRequestFormId}");
                          print("test============${resultListRequest[index].id}");
                          ConfigRouter.pushPage(context, RequestDetailScreen(
                            id: resultListRequest[index].id
                          ));

                          // if(resultListRequest[index].eRequestFormId == 29){
                          //
                          //   ConfigRouter.pushPage(context, RequestDetailScreen());
                          // }
                        },
                        child: Container(
                          margin: EdgeInsets.only(bottom: 10),
                          padding: EdgeInsets.only(left: 10),
                          width: double.infinity,
                          height: 60,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: const Color(0xffF7F7F7),
                              boxShadow: [
                                BoxShadow(color: Colors.grey.withOpacity(.2),blurRadius: 5,spreadRadius: 1)
                              ]
                          ),

                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(lan == 'en' ? resultListRequest[0].formNameEn : resultListRequest[0].formName),
                              Text("${resultListRequest[0].createDate}"),

                            ],
                          ),
                        ),
                      );
                    }),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
