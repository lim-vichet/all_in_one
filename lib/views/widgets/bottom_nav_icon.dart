import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../utils/constants/app_colors.dart';

Widget bottomNavIcon(
    {required IconData icon,
      required bool isActive,
      bool showBadge = false,
      int amount = 0}) {
  return Padding(
    padding: EdgeInsets.only(bottom: 5.px),
    child: Stack(
      children: [
        Container(
          alignment: Alignment.bottomCenter,
          height: 25.px,
          width: 35.px,
          child: Icon(icon,color: isActive ? AppColors().red : AppColors().black)
          //
          // SvgPicture.asset(
          //   icon,
          //   color: isActive ? AppColors().primary : AppColors().black,
          // ),
        ),
        showBadge == true && amount > 0
            ? Positioned(
          top: 2,
          right: 2,
          child: Container(
            // padding: const EdgeInsets.all(3),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: Colors.red,
            ),
            // padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Text(
              amount.toString(),
              style: const TextStyle(color: Colors.white, fontSize: 10),
            ),
          ),
        )
            : const SizedBox(),
      ],
    ),
  );
}