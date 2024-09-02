import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../logic/cubit/text_obsecure_cubit/text_obsecure_cubit.dart';
import '../../utils/constants/app_colors.dart';
import '../../utils/constants/app_font_styles.dart';

class AppTextField  {

  static Widget appTextField(BuildContext context,
      {required String hintText,
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
                        width: 0.5,
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
                      cursorColor: AppColors().primaryRed,
                      onTap: onTap,
                      obscureText: isObsecure
                          ? context.read<TextObsecureCubit>().isObsecure
                          : false,

                      maxLines: maxLines,
                      // onChanged: (String v) {
                      //   onChange!(v);
                      // },
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(lengthLimiting),
                      ],
                      decoration: InputDecoration(
                        // alignLabelWithHint: true,
                        // counterStyle: const TextStyle(
                        //   height: double.minPositive,
                        // ),

                        hintText: hintText,
                        prefixIcon: prefixIcon ??null,
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
                        hintStyle: AppTextStyle().textS(color: AppColors().grey),
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
                          child: Row(
                            children: [
                              Text(
                                isError,
                                style:
                                AppTextStyle().textS(color: AppColors().grey),
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

class PhoneInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }

    int value = int.parse(newValue.text);
    final formatter = NumberFormat('0');

    String newText = formatter.format(value);

    return newValue.copyWith(
        text: newText,
        selection: TextSelection.collapsed(offset: newText.length));
  }
}

OutlineInputBorder _buildOutlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(6.px),
    ),
    borderSide: BorderSide(
      color: AppColors().grey,
      width: 1,
    ),
  );
}
