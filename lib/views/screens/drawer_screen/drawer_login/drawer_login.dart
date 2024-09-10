

import 'package:all_in_one/routes/config_router.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../utils/constants/app_colors.dart';
import '../../../../utils/constants/app_images.dart';


class DrawerLoginScreen extends StatefulWidget {
  const DrawerLoginScreen({Key? key}) : super(key: key);

  @override
  State<DrawerLoginScreen> createState() => _DrawerLoginScreenState();
}

class _DrawerLoginScreenState extends State<DrawerLoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors().white,
      child: Column(
        children: [
          SizedBox(height: 80.px,),
          AppImages.logoImage(),
          SizedBox(height: 100.px,),
          InkWell(
            onTap: (){
              // ConfigRouter.pushPage(context, ChoseLoginScreen.page);
            },
            child: Container(
              width: 100,
              height: 70,
              color: AppColors().primaryBlue,
              child: Text("Login"),
            ),
          )
        ],
      ),
    );
  }
}
