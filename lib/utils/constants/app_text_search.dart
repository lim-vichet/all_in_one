
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'app_colors.dart';

class AppTextSearchWidget extends StatelessWidget {
  final TextEditingController controller ;
  final Function(String value)? onChange;
  final Function(String value)? onSubmit;
  final Function()? onEditingComplete;
  final Function()? onTap;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? hinText ;
  final EdgeInsetsGeometry? contentPadding;
  final double? radius;
  final bool? readOnly;
  final Color? colorHinText;
  final bool? autofocus;


  const AppTextSearchWidget({
    super.key,
    required this.controller,
    this.onChange,
    this.onSubmit,
    this.onEditingComplete,
    this.onTap,
    this.prefixIcon,
    this.suffixIcon,
    this.hinText,
    this.contentPadding,
    this.radius,
    this.readOnly,
    this.colorHinText,
    this.autofocus,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45.px,
      width: double.infinity,
      decoration: BoxDecoration(
          color: AppColors().white.withOpacity(0.2),
          borderRadius: BorderRadius.circular(radius??5.px),
          boxShadow: [
            BoxShadow(
              color: AppColors().grey.withOpacity(0.1),
              spreadRadius: 0,
              blurRadius: 1,
              offset: const Offset(0, 0),
            ),
            BoxShadow(
              color: AppColors().grey.withOpacity(0.1),
              offset: const Offset(0, 0),
            )
          ]
      ),
      child: TextField(
        textAlignVertical: TextAlignVertical.center,
        controller: controller,
        autofocus: autofocus??false,
        onTap: ()=>onTap!(),
        onChanged: (value){
          onChange!(value);
        },
        onEditingComplete: ()=> onEditingComplete!(),
        onSubmitted: (value) {
          if (value.isNotEmpty) {
            onSubmit!(value);
          }
        },
        readOnly: readOnly??false,
        decoration: InputDecoration(
          hintStyle: TextStyle(
            fontSize: 14.px,
            color: colorHinText?? Colors.grey,
          ),
          prefixIcon: prefixIcon?? Container(
            margin: EdgeInsets.only(
              left: 2.px,
              top: 13.px,
              bottom: 13.px,
            ),
            child:SvgPicture.asset(
              "assets/icons/icons_svg/ic_search.svg",
            ),
          ),
          suffixIcon:suffixIcon,
          hintText: hinText??'Search'.tr,
          contentPadding: contentPadding ?? EdgeInsets.only(bottom: 8.px),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
