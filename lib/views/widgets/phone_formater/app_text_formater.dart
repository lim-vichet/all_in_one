import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../logic/cubit/text_obsecure_cubit/text_obsecure_cubit.dart';
import '../../../utils/constants/app_colors.dart';
import '../../../utils/constants/app_font_styles.dart';
import '../../../utils/global_use.dart';

class AppTextFormatter{
  static Widget appTextFormatterBorder(BuildContext context, {
    required String hintText,
        List<TextInputFormatter>? inputFormatters,
        Function? onChange,
        VoidCallback? onTap,
        bool isObsecure = false,
        bool readOnly = false,
        final double height = 52,
        final double width = 500,
        Widget? suffixIcon,
        Widget? prefixIcon,
        int? maxLines = 1,
        TextEditingController? controller,
        TextInputType? keyboardType = TextInputType.text,
        String? isError,
        FocusNode? myFocusNode,
        EdgeInsetsGeometry? padding=const EdgeInsets.only(left: 5, top: 2),
        int? maxLength,
        int? lengthLimiting = 100,
        bool enabled=true,
        bool fill=false,
        double widthBorder=1.5,
      }) {
    return BlocProvider(
      create: (context) => TextObsecureCubit(true),
      child: Builder(
        builder: (context2) {
          return BlocBuilder<TextObsecureCubit, bool>(
            builder: (context, state) {
              return Column(
                children: [
                  Container(
                    padding: padding,
                    height: height,
                    width: width,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      // gradient: LinearGradient(
                      //   stops: const [0.02, 0.02],
                      //   colors: [
                      //     isError != null
                      //         ? AppColors().red
                      //         : AppColors().textColor,
                      //     AppColors().white
                      //   ],
                      // ),

                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 3,
                            color: AppColors().grey.withOpacity(0.1),
                            spreadRadius: 1,
                            offset: const Offset(1, 1))
                      ],
                      border: Border.all(
                        width: widthBorder,
                        color: AppColors().grey.withOpacity(0.5),
                      ),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(8.0),
                      ),
                    ),
                    child: TextFormField(
                      controller: controller,
                      keyboardType: keyboardType, //TextInputType.number,
                      readOnly: readOnly,
                      focusNode: myFocusNode,
                      maxLength: maxLength,
                      // style: AppFont().textM(),
                      enabled: enabled,
                      cursorColor: AppColors().primaryRed,
                      onTap: onTap,
                      obscureText: isObsecure
                          ? context.read<TextObsecureCubit>().isObsecure
                          : false,
                      maxLines: maxLines,
                      // onChanged: (String v) {
                      //   onChange!(v);
                      // },
                      inputFormatters: inputFormatters,
                      decoration: InputDecoration(
                        // alignLabelWithHint: true,
                        // counterStyle: const TextStyle(
                        //   height: double.minPositive,
                        // ),

                        filled:fill,
                        fillColor: AppColors().grey.withOpacity(0.1),
                        hintText: hintText,

                        prefixIcon: prefixIcon,
                        suffixIcon:suffixIcon==null?null:
                        (isObsecure
                            ? (GestureDetector(
                          onTap: (){
                            context
                                .read<TextObsecureCubit>()
                                .onObsecureChange();
                          },
                          child: Icon(
                            context
                                .read<TextObsecureCubit>()
                                .isObsecure
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined,
                            color: AppColors().grey,
                            size: 20,
                          ),
                        ))
                            : suffixIcon),
                        hintStyle: AppTextStyle().textM(color: AppColors().grey),

                        // labelText: hintText,
                        // labelStyle:
                        //     GlobalUse.appTextTheme(context).bodyText2!.copyWith(
                        //           color: AppColors().grey,
                        //         ),
                        border: const UnderlineInputBorder(
                          borderSide: BorderSide.none,

                        ),
                      ),
                    ),
                  ),
                  // const SizedBox(
                  //   height: 5,
                  // ),
                  isError != null
                      ? Container(
                    margin: EdgeInsets.only(top: 5.px, left: 2.px),
                    width: screenWidth,
                    child: Text(isError,style:AppTextStyle().textS(color: AppColors().primaryRed ),),
                  )
                      : const SizedBox()
                ],
              );
            },
          );
        },
      ),
    );
  }


  static Widget appTextFormatter(BuildContext context,
      {required String hintText,
        Function(String value)? onChange,
        List<TextInputFormatter>? inputFormatters,
        VoidCallback? onTap,
        int? heightTfd,
        bool isObsecure = false,
        bool readOnly = false,
        final double height = 52,
        final double width = 600,
        Widget? suffixIcon,
        Widget? prefixIcon,
        int? maxLines = 1,
        TextEditingController? controller,
        TextInputType? keyboardType = TextInputType.text,
        String? isError,
        FocusNode? myFocusNode,
        EdgeInsetsGeometry? padding=const EdgeInsets.only(left: 5, top: 2),
        int? maxLength,
        bool enable=true,
        int? lengthLimiting = 100}) {
    return BlocProvider(
      create: (context) => TextObsecureCubit(true),
      child: Builder(
        builder: (context2) {
          return BlocBuilder<TextObsecureCubit, bool>(
            builder: (context, state) {
              return Column(
                children: [
                  Container(
                    padding: padding,
                    height: height,
                    width: width,
                    decoration: const BoxDecoration(
                      // gradient: LinearGradient(
                      //   stops: const [0.02, 0.02],
                      //   colors: [
                      //     isError != null
                      //         ? AppColors().red
                      //         : AppColors().textColor,
                      //     AppColors().white
                      //   ],
                      // ),

                      // color: Colors.white,
                      // boxShadow: [
                      //   BoxShadow(
                      //       blurRadius: 3,
                      //       color: AppColors().grey.withOpacity(0.1),
                      //       spreadRadius: 1,
                      //       offset: const Offset(1, 1))
                      // ],
                      // border: Border.all(
                      //   width: 0.5,
                      //   color: AppColors().grey.withOpacity(0.5),
                      // ),
                      // borderRadius: const BorderRadius.all(
                      //   Radius.circular(8.0),
                      // ),
                    ),
                    child: TextFormField(
                      controller: controller,
                      keyboardType: keyboardType, //TextInputType.number,
                      readOnly: readOnly,
                      focusNode: myFocusNode,
                      maxLength: maxLength,
                      // style: AppFont().textM(),
                      cursorColor: AppColors().primaryRed,
                      onTap: onTap,
                      enabled: enable,
                      obscureText: isObsecure
                          ? context.read<TextObsecureCubit>().isObsecure
                          : false,

                      maxLines: maxLines,
                      onChanged: (String v) {
                        onChange!(v);
                      },
                      inputFormatters: inputFormatters,
                      decoration: InputDecoration(
                        // alignLabelWithHint: true,
                        // counterStyle: const TextStyle(
                        //   height: double.minPositive,
                        // ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: AppColors().primaryBlue), //<-- SEE HERE
                        ),
                        hintText: hintText,
                        prefixIcon: prefixIcon,
                        suffixIcon:suffixIcon==null?null:
                        (isObsecure
                            ? (GestureDetector(
                          onTap: (){
                            context
                                .read<TextObsecureCubit>()
                                .onObsecureChange();
                          },
                          child: Icon(
                            context
                                .read<TextObsecureCubit>()
                                .isObsecure
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined,
                            color: AppColors().grey,
                            size: 20,
                          ),
                        ))
                            : suffixIcon),
                        hintStyle: AppTextStyle().textM(color: AppColors().grey),

                        // labelText: hintText,
                        // labelStyle:
                        //     GlobalUse.appTextTheme(context).bodyText2!.copyWith(
                        //           color: AppColors().grey,
                        //         ),
                        // border: const UnderlineInputBorder(
                        //   borderSide: BorderSide.none,
                        // ),

                      ),
                    ),
                  ),
                  // const SizedBox(
                  //   height: 5,
                  // ),
                  isError != null
                      ? Container(
                    margin: EdgeInsets.only(top: 5.px, left: 2.px),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            isError,
                            style:AppTextStyle().textS(
                              color: AppColors().primaryRed,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                      : const SizedBox()
                ],
              );
            },
          );
        },
      ),
    );
  }
}