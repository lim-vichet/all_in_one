import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../routes/config_router.dart';
import '../../../../utils/constants/app_colors.dart';
import '../../../../utils/constants/app_font_styles.dart';
import '../../../../utils/constants/app_images.dart';
import '../../../../utils/shared_preferences_service.dart';
import '../../auth/login_screen/login_screen.dart';
import '../language/language.dart';


class DrawerItem extends StatefulWidget {
  const DrawerItem({Key? key}) : super(key: key);

  @override
  State<DrawerItem> createState() => _DrawerItemState();
}

class _DrawerItemState extends State<DrawerItem> {




  // function show sound chat


  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors().white,

      child: ListView(
        children: [
          /// logo
          Container(
              padding: const EdgeInsets.symmetric(horizontal: 70),
              // color: Colors.red,
              child: AppImages.logoImage()
          ),
          SizedBox(
            height: 10.px,
          ),
          Container(
            decoration: BoxDecoration(
              color: AppColors().white,
              border: Border(
                  bottom: BorderSide(
                    color: AppColors().grey.withOpacity(0.2),
                  )),
            ),
          ),

          /// User Profile
          InkWell(
            onTap: () {
              // ConfigRouter.pushPage(context, CompanyProfileScreen());
              // Navigator.pushNamed(context, CompanyProfileScreen.routeName);
            },
            child: Container(
              decoration: BoxDecoration(
                color: AppColors().white,
                border: Border(
                    bottom: BorderSide(
                        color: AppColors().grey.withOpacity(.2), width: 1.0)),
              ),
              child: ListTile(
                title: Text(
                  "User Profile".tr,
                  style: AppTextStyle().primaryText(
                    fontSize: 17,
                    color: AppColors().black,
                  ),
                ),
                leading: Icon(
                    Icons.account_circle, color: Colors.lightBlueAccent,
                ),
              ),
            ),
          ),

          /// Term & Conditional
          InkWell(
            onTap: () {
              // ConfigRouter.pushPage(context, ContactUsScreen());
            },
            child: Container(
              decoration: BoxDecoration(
                color: AppColors().white,
                border: Border(
                    bottom: BorderSide(
                        color: AppColors().grey.withOpacity(.2), width: 1.0)),
              ),
              child: ListTile(
                title: Text(
                  "Term & Conditional".tr,
                  style: AppTextStyle().primaryText(
                    fontSize: 17,
                    color: AppColors().black,
                  ),
                ),
                leading: Icon(
                    Icons.grade, color: Colors.lightBlueAccent,
                ),
              ),
            ),
          ),

          /// Contact Us
          InkWell(
            onTap: () {
              // ConfigRouter.pushPage(context, ContactUsScreen());
            },
            child: Container(
              decoration: BoxDecoration(
                color: AppColors().white,
                border: Border(
                    bottom: BorderSide(
                        color: AppColors().grey.withOpacity(.2), width: 1.0)),
              ),
              child: ListTile(
                title: Text(
                  "Contact Us".tr,
                  style: AppTextStyle().primaryText(
                    fontSize: 17,
                    color: AppColors().black,
                  ),
                ),
                leading: Icon(
                    Icons.contact_phone, color: Colors.lightBlueAccent,
                ),
              ),
            ),
          ),

          /// Language
          InkWell(
            onTap: () {
              ConfigRouter.pushPage(context, LanguageScreen());
            },
            child: Container(
              decoration: BoxDecoration(
                color: AppColors().white,
                border: Border(
                    bottom: BorderSide(
                        color: AppColors().grey.withOpacity(.2), width: 1.0)),
              ),
              child: ListTile(
                title: Text(
                  "Language".tr,
                  style: AppTextStyle().primaryText(
                    fontSize: 17,
                    color: AppColors().black,
                  ),
                ),
                leading: Icon(
                    Icons.language, color: Colors.lightBlueAccent,
                ),
              ),
            ),
          ),

          /// Setting
          InkWell(
            onTap: () {
              // ConfigRouter.pushPage(context, ContactUsScreen());
            },
            child: Container(
              decoration: BoxDecoration(
                color: AppColors().white,
                border: Border(
                    bottom: BorderSide(
                        color: AppColors().grey.withOpacity(.2), width: 1.0)),
              ),
              child: ListTile(
                title: Text(
                  "Setting".tr,
                  style: AppTextStyle().primaryText(
                    fontSize: 17,
                    color: AppColors().black,
                  ),
                ),
                leading: Icon(
                    Icons.settings_suggest, color: Colors.lightBlueAccent,
                ),
              ),
            ),
          ),

          /// Support
          InkWell(
            onTap: () {
              // ConfigRouter.pushPage(context, ContactUsScreen());
            },
            child: Container(
              decoration: BoxDecoration(
                color: AppColors().white,
                border: Border(
                    bottom: BorderSide(
                        color: AppColors().grey.withOpacity(.2), width: 1.0)),
              ),
              child: ListTile(
                title: Text(
                  "Support".tr,
                  style: AppTextStyle().primaryText(
                    fontSize: 17,
                    color: AppColors().black,
                  ),
                ),
                leading: Icon(
                    Icons.support_agent, color: Colors.lightBlueAccent,
                ),
              ),
            ),
          ),
          SharedPreferencesService.instance!.getUserRole != ""?
          /// Logout
          InkWell(
            onTap: () {
              ConfigRouter.pushPage(context, const LoginScreen());
            },
            child: Container(
              decoration: BoxDecoration(
                color: AppColors().white,
                border: Border(
                    bottom: BorderSide(
                        color: AppColors().grey.withOpacity(.2), width: 1.0)),
              ),
              child: ListTile(
                title: Text(
                  "Logout".tr,
                  style: AppTextStyle().primaryText(
                    fontSize: 17,
                    color: AppColors().black,
                  ),
                ),
                leading: Icon(
                  Icons.login, color: Colors.lightBlueAccent,
                ),
              ),
            ),
          ):
          /// Login
          InkWell(
            onTap: () {
              ConfigRouter.pushPage(context, const LoginScreen());
            },
            child: Container(
              decoration: BoxDecoration(
                color: AppColors().white,
                border: Border(
                    bottom: BorderSide(
                        color: AppColors().grey.withOpacity(.2), width: 1.0)),
              ),
              child: ListTile(
                title: Text(
                  "Login".tr,
                  style: AppTextStyle().primaryText(
                    fontSize: 17,
                    color: AppColors().black,
                  ),
                ),
                leading: const Icon(
                  Icons.login, color: Colors.lightBlueAccent,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
