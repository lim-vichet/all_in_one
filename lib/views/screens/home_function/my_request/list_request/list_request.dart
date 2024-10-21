
import 'package:all_in_one/views/screens/home_function/my_request/list_request/widgets/list_request_approve.dart';
import 'package:all_in_one/views/screens/home_function/my_request/list_request/widgets/list_request_new.dart';
import 'package:all_in_one/views/screens/home_function/my_request/list_request/widgets/list_request_reject.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../data/models/my_request_model/list_request_model/list_request_model.dart';
import '../../../../../utils/constants/app_colors.dart';
import '../../../../../utils/global_use.dart';


class ListRequestScreen extends StatefulWidget {
  const ListRequestScreen({Key? key}) : super(key: key);

  @override
  State<ListRequestScreen> createState() => _ListRequestScreenState();
}

class _ListRequestScreenState extends State<ListRequestScreen> with SingleTickerProviderStateMixin{


  TextEditingController searchController = TextEditingController();
  late TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  int page = 1;
  String status = '';
  List<ResultListRequest> resultListRequest = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors().bgColorApp,
        appBar: AppBar(
          backgroundColor: Colors.lightBlueAccent,
          automaticallyImplyLeading: false,
          title: const Center(child: Text("List Request", style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold),)),
          leading: const BackButton(
            color: Colors.white,
          ),
        ),
        body: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: heightTabBar,
                  alignment: Alignment.centerLeft,
                  // color: Colors.red,
                  margin: EdgeInsets.zero,
                  child: TabBar(
                    controller: _tabController,
                    labelColor: Colors.black,
                    padding: EdgeInsets.zero,
                    isScrollable: true,
                    indicatorColor: Colors.red,
                    unselectedLabelColor: AppColors().black,
                    unselectedLabelStyle: const TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                    labelStyle: const TextStyle(
                      fontSize: 16,
                    ),
                    indicator: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                color: AppColors().primaryRed, width: 2))),
                    labelPadding: EdgeInsets.zero,
                    tabAlignment: TabAlignment.start,
                    tabs: [
                      SizedBox(
                        width: 130,
                        child: Tab(
                          text: "${"Pending".tr} "
                          // "(${dataCountEApproval!.resultNew})"
                          ,
                          height: 50,
                        ),
                      ),
                      SizedBox(
                        width: 130,
                        child: Tab(
                            text:"${"Approved".tr} "
                          // "(${dataCountEApproval!.approve})"
                        )
                        ,
                      ),

                      SizedBox(
                        width: 130,
                        child: Tab(
                            text:"${"Rejected".tr} "
                          // "(${dataCountEApproval!.reject})"
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Expanded(
              child: Container(
                color: AppColors().bgColorApp,
                child: TabBarView(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: _tabController,
                  children:  const [
                    ListRequestNew(),
                    ListRequestApprove(),
                    ListRequestReject(),
                  ],
                ),
              ),
            ),
          ],
        )
    );
  }
}
