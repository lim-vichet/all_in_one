import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../utils/constants/app_colors.dart';
import '../../utils/constants/app_font_styles.dart';
import '../../utils/constants/app_images.dart';

class NoDataScreen extends StatelessWidget {
  const NoDataScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors().bgColorApp,
      body: SafeArea(
        child: Stack(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Image.asset(
                  //     "assets/svgs/No_Data.svg",
                  //   width: 100.px,
                  //   height: 100.px,
                  // ),
                  Image(image: NetworkImage("https://cdn-icons-png.flaticon.com/512/7466/7466140.png",), width: 100, height: 100,),
                   Text("No more data...", style: AppTextStyle().textS(
                     color: AppColors().grey
                   )
                  )
                ],
              ),

            ),
            // Positioned(
            //     top: 10,
            //     left: 20,
            //     child: InkWell(
            //       onTap: (){
            //         Navigator.pop(context);
            //       },
            //       child: Container(
            //           padding: const EdgeInsets.all(10),
            //           child: const Icon(Icons.arrow_back)),
            //     ))
          ],
        ),
      ),
    );
  }
}
