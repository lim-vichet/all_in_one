
import 'package:flutter/material.dart';

import '../../../utils/constants/app_colors.dart';
import '../../../utils/constants/app_images.dart';
import '../accesstoken/accesstoken.dart';
import '../auth/login_screen/login_screen.dart';
import '../main_screen/main_screen.dart';
import '../test_auth/signup.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = "/splash_screen";
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(
      const Duration(seconds: 2),
          () {
        // var lang = localStore.read('lang');
        //
        // if (lang == null || lang == "") {
        //   currectLang = const Locale('en', 'US');
        //   Get.updateLocale(currectLang);
        //   Navigator.pushReplacementNamed(
        //       context, SelectLanguageScreen.routeName);
        // } else {
        //   lan = lang;
        //   https: //stage.cint-cam.com
        //
        //   if (lang == 'kh') {
        //     localStore.write('lang', 'kh');
        //     currectLang = const Locale('kh', 'KH');
        //   } else {
        //     localStore.write('lang', 'en');
        //     currectLang = const Locale('en', 'US');
        //   }
        //   Get.updateLocale(currectLang);
          // Get.to(RecodeScreen());

            // Navigator.pushNamedAndRemoveUntil(context, SignUpScreen.routeName, (route) => false);
            Navigator.pushNamedAndRemoveUntil(context, LoginScreen.routeName, (route) => false);
          // Navigator.pushNamedAndRemoveUntil(context, MyHomePage.routeName, (route) => false);


        // }
      },
    );
    return  Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: AppColors().white,
        child: Stack(
          children: [
            Center(

              child: AppImages.logoImage(),
            ),
            Positioned(
                bottom: 40,
                left: 0,
                right: 0,

                child: Text("Copyright Vichet@CuteBoy",textAlign: TextAlign.center,style: TextStyle(color: AppColors().white),))
          ],
        ),
      ),
    );
  }
}
