
import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../data/models/login_email_model/login_email_model.dart';
import '../../../../data/services/main_services/base_service.dart';
import '../../../../utils/constants/app_colors.dart';
import '../../../../utils/constants/app_font_styles.dart';
import '../../../../utils/constants/app_images.dart';
import '../../../../utils/global_use.dart';
import '../../../../utils/shared_preferences_service.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {

// ***** SharedPreferences ***** //
  StaffEmailLogin? userInformationData;
  // CustomerLoginResult? userInformationData;

  @override
  void initState() {
    super.initState();
    String? userInformation = SharedPreferencesService.instance?.getUserProfile;
    if (userInformation != null) {
      userInformationData = StaffEmailLogin.fromJson(jsonDecode(userInformation!));
    }
  }
  // ***** SharedPreferences ***** //

  @override
  Widget build(BuildContext context) {
    log("userInformationData!.profile========${userInformationData!.profile}");
    return Scaffold(
        backgroundColor: AppColors().bgColorApp,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: const BackButton(
            color: Colors.white,
          ),
        ),
        extendBodyBehindAppBar: true,
        body: Stack(
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
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(70),
                          bottomRight: Radius.circular(70),
                        ),
                        child: Container(
                        width: double.infinity,
                        height: 250,
                        child: Image.network("https://m.media-amazon.com/images/I/71NQ8HuXTmL._AC_UF1000,1000_QL80_.jpg", fit: BoxFit.cover,),
                      ),
                    ),
                    Positioned(
                      // top: 50,
                        child: Stack(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(
                              top: 120, left: 20, right: 20, bottom: 250),
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
                              child:  SingleChildScrollView(
                                // padding: EdgeInsets.all(10),
                                child: Column(
                                  children: [
                                    Container(
                                      width: double.infinity,
                                      height: 120,
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
                                      child:  Column(
                                        children: [
                                          SizedBox(height: 30,),
                                          Row(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                width: 70,
                                                height: 70,
                                                // color: Colors.pink,
                                                child: CircleAvatar(
                                                  backgroundColor: Colors.blue.withOpacity(0.5),
                                                  backgroundImage: NetworkImage("${BaseService().baseUrlHost}${userInformationData!.profile}"),
                                                ),
                                              ),
                                              SizedBox(width: 20,),
                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "${"Name".tr}"
                                                        ":"
                                                        ' ${lan == "en" ? userInformationData!.nameEn : userInformationData!.nameKh}',
                                                    style: AppTextStyle().textM(
                                                      color: AppColors().black,
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                    overflow: TextOverflow.ellipsis,
                                                    maxLines: 1,
                                                  ),
                                                  SizedBox(height: 3,),
                                                  Text('${lan == "en" ? userInformationData!.position : userInformationData!.positionKh}',
                                                    style: AppTextStyle().textM(
                                                      color: AppColors().black,
                                                    ),
                                                    overflow: TextOverflow.ellipsis,
                                                    maxLines: 1,
                                                  ),
                                                ],
                                              ),

                                            ],
                                          ),

                                        ],
                                      ),
                                    ),

                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(left: 20, top: 5, right: 10),
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            flex:2,
                                            child: Text(
                                              "Gender".tr,
                                              style:
                                              AppTextStyle().textLabelDetail(),
                                            ),
                                          ),
                                          Text(
                                            ":  ",
                                            style: AppTextStyle()
                                                .textLabelDetail(),
                                          ),
                                          Expanded(
                                            flex:5,
                                            child: Text(
                                              ' ${lan == "en" ? userInformationData!.gender : "ប្រុស"}',
                                              style: AppTextStyle().textS(),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(left: 20, top: 5, right: 10),
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            flex:2,
                                            child: Text(
                                              "ID".tr,
                                              style:
                                              AppTextStyle().textLabelDetail(),
                                            ),
                                          ),
                                          Text(
                                            ":  ",
                                            style: AppTextStyle()
                                                .textLabelDetail(),
                                          ),
                                          Expanded(
                                            flex:5,
                                            child: Text(
                                              ' ${lan == "en" ? userInformationData!.id : userInformationData!.id}',
                                              style: AppTextStyle().textS(),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(left: 20, top: 5, right: 10),
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            flex:2,
                                            child: Text(
                                              "CID".tr,
                                              style:
                                              AppTextStyle().textLabelDetail(),
                                            ),
                                          ),
                                          Text(
                                            ":  ",
                                            style: AppTextStyle()
                                                .textLabelDetail(),
                                          ),
                                          Expanded(
                                            flex:5,
                                            child: Text(
                                              ' ${lan == "en" ? userInformationData!.cid : userInformationData!.cid}',
                                              style: AppTextStyle().textS(),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(left: 20, top: 5, right: 10),
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            flex:2,
                                            child: Text(
                                              "Contact".tr,
                                              style:
                                              AppTextStyle().textLabelDetail(),
                                            ),
                                          ),
                                          Text(
                                            ":  ",
                                            style: AppTextStyle()
                                                .textLabelDetail(),
                                          ),
                                          Expanded(
                                            flex:5,
                                            child: Text(
                                              ' ${lan == "en" ? userInformationData!.contact : userInformationData!.contact}',
                                              style: AppTextStyle().textS(),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(left: 20, top: 5, right: 10),
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            flex:2,
                                            child: Text(
                                              "DOB".tr,
                                              style:
                                              AppTextStyle().textLabelDetail(),
                                            ),
                                          ),
                                          Text(
                                            ":  ",
                                            style: AppTextStyle()
                                                .textLabelDetail(),
                                          ),
                                          Expanded(
                                            flex:5,
                                            child: Text(
                                              ' ${lan == "en" ? DateFormat("dd-mm-yyyy").format(userInformationData!.dob) : DateFormat("dd-mm-yyyy").format(userInformationData!.dob)}',
                                              style: AppTextStyle().textS(),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(left: 20, top: 5, right: 10),
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            flex:2,
                                            child: Text(
                                              "Join Date".tr,
                                              style:
                                              AppTextStyle().textLabelDetail(),
                                            ),
                                          ),
                                          Text(
                                            ":  ",
                                            style: AppTextStyle()
                                                .textLabelDetail(),
                                          ),
                                          Expanded(
                                            flex:5,
                                            child: Text(

                                              // DateFormat("dd-mm-yyyy").format(
                                              ' ${lan == "en" ? DateFormat("dd-mm-yyyy").format(userInformationData!.joinDate) : DateFormat("dd-mm-yyyy").format(userInformationData!.joinDate)}',
                                              style: AppTextStyle().textS(),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(left: 20, top: 5, right: 10),
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            flex:2,
                                            child: Text(
                                              "E-Mail".tr,
                                              style:
                                              AppTextStyle().textLabelDetail(),
                                            ),
                                          ),
                                          Text(
                                            ":  ",
                                            style: AppTextStyle()
                                                .textLabelDetail(),
                                          ),
                                          Expanded(
                                            flex:5,
                                            child: Text(
                                              ' ${lan == "en" ? userInformationData!.email : userInformationData!.email}',
                                              style: AppTextStyle().textS(),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(left: 20, top: 5, right: 10),
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            flex:2,
                                            child: Text(
                                              "Address".tr,
                                              style:
                                              AppTextStyle().textLabelDetail(),
                                            ),
                                          ),
                                          Text(
                                            ":  ",
                                            style: AppTextStyle()
                                                .textLabelDetail(),
                                          ),
                                          Expanded(
                                            flex:5,
                                            child: Text(
                                              ' ${lan == "en" ? userInformationData!.fulladdressEn : userInformationData!.fulladdressKh}',
                                              style: AppTextStyle().textS(),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        )),

                    Positioned(
                      top: 70,
                        child: Container(
                          width: double.infinity,
                          height: 100,
                          color: Colors.green,
                          child: Center(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(150),
                              child: Container(
                                width: 100,
                                height: 100,
                                color: Colors.yellow,
                                child:
                                // AppImages.networkImage("${BaseService().baseUrlHost}${userInformationData!.profile}",fit: BoxFit.cover),
                                Image.network("https://funmauj.b-cdn.net/test/367611.jpg", fit: BoxFit.cover,),
                              ),
                            ),
                          ),
                      )
                    )
                  ],
                )),
          ],
        )
    );
  }
}
