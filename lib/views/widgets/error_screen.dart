import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../utils/constants/app_colors.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.error_outline,color: AppColors().primaryRed,size: 60,),
          SizedBox(height: 15.px,),
          const Text("Something wrong.\n Please try again!")
        ],
      ),
    );
  }
}
