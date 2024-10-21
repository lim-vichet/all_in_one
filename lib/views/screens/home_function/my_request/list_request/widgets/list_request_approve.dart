

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

import '../../../../../../data/models/my_request_model/list_request_model/list_request_model.dart';
import '../../../../../../logic/bloc/my_request_bloc/list_request_bloc/list_request_bloc.dart';
import '../../../../../../utils/constants/app_colors.dart';
import '../../../../../../utils/global_use.dart';
import '../../../../../widgets/error_screen.dart';
import '../../../../../widgets/loading/loading.dart';
import '../../../../../widgets/no_data_screen.dart';

class ListRequestApprove extends StatefulWidget {
  const ListRequestApprove({Key? key}) : super(key: key);

  @override
  State<ListRequestApprove> createState() => _ListRequestApproveState();
}

class _ListRequestApproveState extends State<ListRequestApprove> {

  final RefreshController _paginationController = RefreshController();
  int totalPage = 1;
  int page = 1;
  String status = '';
  List<ResultListRequest> resultListRequest = [];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
      ListRequestBloc()..add(EventGetListRequest(page: page, status: 'approve', search: '')),
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
                    context.read<ListRequestBloc>().add(EventGetListRequest( page: page, status: 'approve', search: ''));
                    _paginationController.loadComplete();
                  },

                  onLoading: () {
                    // print("test=============${resultListAttendance.length}");
                    if (resultListRequest.length == totalPage) {
                      _paginationController.loadNoData();
                    } else {
                      page++;
                      context.read<ListRequestBloc>().add(GetLastDataListRequest( page: page, oldData: resultListRequest, status: 'approve', search: ''));
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
                        return Container(
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
