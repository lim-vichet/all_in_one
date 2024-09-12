import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../logic/cubit/cupertino_time_picker/cupertino_time_picker_cubit.dart';
import '../global_use.dart';
import 'app_colors.dart';
import 'app_font_styles.dart';

class AppTimePickerBS extends StatefulWidget {
  final Color? suffixIconColors;
  final String? hint;
  final String? hintText;
  late String isError;
  final Widget? priFixIcon;
  final Widget? suffixIcon;
  final bool? readOnly;
  final bool disable;
  final void Function(String text)? onChange;
  final int maxLine;
  final EdgeInsets edgeInsets;
  final bool fromDate;
  final bool toDate;
  final bool date;
  final bool dateHour;
  final TextEditingController controller;

  AppTimePickerBS({
    super.key,
    this.suffixIconColors = Colors.grey,
    required this.controller,
    this.hint,
    this.priFixIcon,
    this.suffixIcon,
    this.isError = "",
    this.disable = true,
    this.maxLine = 1,
    this.readOnly,
    this.hintText,
    this.edgeInsets = const EdgeInsets.symmetric(vertical: 14, horizontal: 15),
    this.fromDate = false,
    this.toDate = false,
    this.date = false,
    this.dateHour = false,
    this.onChange,
  });

  @override
  State<AppTimePickerBS> createState() => _AppTimePickerBSState();
}

class _AppTimePickerBSState extends State<AppTimePickerBS> {
  late DateTime selectedDateTime;

  @override
  void initState() {
    super.initState();
    // Initialize with the current time
    selectedDateTime = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    if(widget.controller.isNull&&widget.controller.text.isNotEmpty) widget.isError = "";
    return BlocProvider(
      create: (context) => CupertinoTimePickerCubit(),
      child: BlocConsumer<CupertinoTimePickerCubit, CupertinoTimePickerState>(
        listener: (contextCTP, state) {
          if(state is GetValueTimePickerBSSuccess){
            widget.isError = "";
            widget.controller.text = state.value;
            print("print----------------------------ddddddddddddddddddddddddd${state.value}");

            if(widget.onChange !=null){
              widget.onChange!(state.value);
            }
          }
        },
        builder: (contextCTP, state) {
          if(state is RemoveErrorAppPickerTBSSuccess){
            widget.isError = "";
            print("print----------------------------ddddddddddddddddddddddddd");
          }
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                keyboardType: TextInputType.datetime,
                onTap: () {
                  showTimePicker(context,contextCTP);
                },
                onChanged: (value){
                  print("print------onchange---------$value");
                  if ( widget.onChange != null ) {
                    widget.onChange!(value);
                  }
                  contextCTP.read<CupertinoTimePickerCubit>().removeErrorAppPickerTBS(value);
                },
                controller: widget.controller,
                maxLines: widget.maxLine,
                style: TextStyle(
                  fontSize: 15.px,
                  color: Colors.black.withOpacity(0.8),
                  fontWeight: FontWeight.w400,
                ),
                enabled: widget.disable,
                readOnly: true,
                decoration: InputDecoration(
                  alignLabelWithHint: true,
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.5),
                  suffixIconColor: widget.isError.isEmpty
                      ? widget.suffixIconColors
                      : AppColors().primaryRed,
                  prefixIcon: widget.priFixIcon,
                  suffixIcon: widget.suffixIcon,
                  labelStyle: textStyle(widget.isError),
                  labelText: widget.hint,
                  hintText: widget.hintText,
                  border: InputBorder.none,
                  hintStyle:
                      TextStyle(color: AppColors().grey.withOpacity(0.9)),
                  contentPadding: widget.edgeInsets,
                  enabledBorder: border(widget.isError),
                  focusedBorder: border(widget.isError),
                  disabledBorder: border(widget.isError),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
            ],
          );
        },
      ),
    );
  }

  TextStyle textStyle(String err) {
    return TextStyle(
      color: err.isEmpty
          ? AppColors().grey.withOpacity(0.9)
          : AppColors().primaryRed,
    );
  }

  OutlineInputBorder border(String err) {
    return OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(3)),
        borderSide: BorderSide(
            color: err.isEmpty
                ? Colors.cyan.withOpacity(0.15)
                : AppColors().primaryRed,
            width: err.isEmpty ? 1 : 1.15));
  }

  String formatTime(DateTime time) {
    return '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}:${time.second.toString().padLeft(2, '0')}';
  }

  void showTimePicker(context,contextCTP) {
    showModalBottomSheet<void>(
      context: context,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(dialogBorderRadius),
          )),
      backgroundColor: AppColors().white,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Wrap(
          children: [
            Container(
              padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
              child: Column(
                children: [
                  Container(
                    padding:  EdgeInsets.symmetric(horizontal: 15.px,vertical: 10.px),
                    child: Row(
                      mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Select Time".tr,
                          style: AppTextStyle().textTitleDialog(
                              color: AppColors().black60
                          ),
                        ),
                        IconButton(
                          onPressed: (){
                            Navigator.pop(context);
                          },
                          icon:  Icon(Icons.close,color: AppColors().black60),
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      children: [
                        CupertinoTimerPicker(
                          mode: CupertinoTimerPickerMode.hms,
                          initialTimerDuration: Duration(
                            hours: selectedDateTime.hour,
                            minutes: selectedDateTime.minute,
                            seconds: selectedDateTime.second,
                          ),
                          onTimerDurationChanged: (Duration changedTimer) {
                              selectedDateTime = DateTime(
                              selectedDateTime.hour,
                              selectedDateTime.month,
                              selectedDateTime.day,
                              changedTimer.inHours,
                              changedTimer.inMinutes.remainder(60),
                              changedTimer.inSeconds.remainder(60),
                            );
                           BlocProvider.of<CupertinoTimePickerCubit>(contextCTP).eventGetValueTimePickerBS(formatTime(selectedDateTime));
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20.px)
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
