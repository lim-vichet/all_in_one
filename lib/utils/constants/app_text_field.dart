import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../../logic/cubit/text_obsecure_cubit/text_obsecure_cubit.dart';
import '../global_use.dart';
import 'app_colors.dart';
import 'app_text_style.dart';


class AppTextField {
  static Widget appTextFieldBorder(
    BuildContext context, {
    required String hintText,
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
    EdgeInsetsGeometry? padding = const EdgeInsets.only(left: 0, top: 2),
    int? maxLength,
    int? lengthLimiting = 100,
    bool enabled = true,
    bool fill = false,
    double widthBorder = 1.5,
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
                      keyboardType: keyboardType,
                      readOnly: readOnly,
                      focusNode: myFocusNode,
                      maxLength: maxLength,
                      enabled: enabled,
                      cursorColor: AppColors().primaryRed,
                      onTap: onTap,
                      obscureText: isObsecure
                          ? context.read<TextObsecureCubit>().isObsecure
                          : false,
                      maxLines: maxLines,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(lengthLimiting),
                      ],
                      decoration: InputDecoration(
                        filled: fill,
                        fillColor: AppColors().grey.withOpacity(0.1),
                        hintText: hintText,
                        prefixIcon: prefixIcon,
                        suffixIcon: suffixIcon == null
                            ? null
                            : (isObsecure
                                ? (GestureDetector(
                                    onTap: () {
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
                        hintStyle: AppTextStyleV2().textTitleSizeS(color: AppColors().grey),
                        border: const UnderlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),

                  isError != null
                      ? Container(
                          margin: EdgeInsets.only(top: 5, left: 2),
                          width: screenWidth,
                          child: Text(
                            isError,
                            style: AppTextStyleV2()
                                .textSizeS(color: AppColors().primaryRed),
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

  static Widget appTextField(BuildContext context,
      {
        required String hintText,
        required Function(String value) onChange,
        VoidCallback? onTap,
        int? heightTfd,
        bool isObsecure = false,
        bool readOnly = false,
        final double height = 52,
        List<TextInputFormatter>? inputFormatters,
        Widget? suffixIcon,
        Widget? prefixIcon,
        Iterable<String>? autofillHints,
        int? maxLines = 1,
        TextEditingController? controller,
        TextInputType? keyboardType = TextInputType.text,
        String? isError,
        FocusNode? myFocusNode,
        EdgeInsetsGeometry? padding = const EdgeInsets.only(left: 5, top: 2),
        int? maxLength,
        bool enable = true,
        int? lengthLimiting = 100
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
                    width: double.infinity,
                    child: TextFormField(
                      controller: controller,
                      keyboardType: keyboardType, //TextInputType.number,
                      readOnly: readOnly,
                      focusNode: myFocusNode,
                      maxLength: maxLength,
                      autofillHints: autofillHints,
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
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: AppColors().primaryBlue),
                        ),
                        hintText: hintText,
                        prefixIcon: prefixIcon,
                        suffixIcon: suffixIcon == null
                            ? null
                            : (isObsecure
                                ? (GestureDetector(
                                    onTap: () {
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
                        hintStyle: AppTextStyleV2().textSizeS(
                            color: AppColors().grey,
                        ),
                      ),
                    ),
                  ),

                  isError != null
                      ? Container(
                          margin: EdgeInsets.only(top: 5, left: 2),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  isError,
                                  style: AppTextStyleV2().textSizeS(
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

