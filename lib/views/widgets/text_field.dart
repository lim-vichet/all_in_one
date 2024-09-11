
import 'package:all_in_one/views/widgets/time_picker/time_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../logic/cubit/app_text_input/app_text_input_cubit.dart';
import '../../logic/cubit/time_picker/time_cubit.dart';
import '../../utils/constants/app_colors.dart';
import '../../utils/constants/app_font_styles.dart';
import '../../utils/constants/url_path.dart';
import '../../utils/global_use.dart';

class AppTextInput extends StatelessWidget {

  List<TextInputFormatter>? inputFormatters;
  final String? hint;
  final String? hintText;
  late  String isError;
  final Widget? priFixIcon;
  final Widget? suffixIcon;
  final bool? readOnly;
  final TextEditingController? controller;
  final TextEditingController? secondController;
  final bool disable;
  final bool keyDisable;
  final void Function()? onTap;
  final void Function(String text)? onChange;
  final int maxLine;
  final Color? suffixIconColors;
  final Color? bgDisableColor;
  // final int maxLength;
  final EdgeInsets edgeInsets;
  final double? height;
  final bool borderNone;
  final Function(String text)? onSubmitted;
   AppTextInput(
      {super.key,
        this.inputFormatters,
      this.hint,
      this.priFixIcon,
      this.keyDisable = false,
      this.suffixIcon,
      this.isError = "",
      this.controller,
      this.secondController,
      this.disable = true,
      this.onTap,
      this.maxLine = 1,
      this.readOnly,
      this.hintText,
      // this.maxLength = 100,
      this.edgeInsets = const EdgeInsets.symmetric(vertical: 16, horizontal: 10),
      this.height,
      this.onChange,
      this.suffixIconColors=  Colors.grey,
      this.borderNone = true,
      this.onSubmitted,
      this.bgDisableColor = Colors.white,
    });

  @override
  Widget build(BuildContext context) {
    if(!controller.isNull&&controller!.text.isNotEmpty) isError = "";
      return BlocProvider(
        create: (context) => AppTextInputCubit(),
        child: BlocConsumer<AppTextInputCubit, AppTextInputState>(
            listener: (contextApp, state) {
              if( state is RemoveErrorSuccess ) {
                isError="";
              }
            },
            builder: (contextApp, state) {
              return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      // height: height?? 55.px,
                      child: TextField(
                        keyboardType: keyDisable ? TextInputType.number:null,
                        onTap: onTap,
                        controller: controller,
                        maxLines: maxLine,
                        onSubmitted:onSubmitted,
                        enabled: disable,
                        readOnly: readOnly??false,
                        style: TextStyle(
                          fontSize: 15.px,
                          color: Colors.black.withOpacity(0.8),
                          fontWeight: FontWeight.w400,
                        ),
                        onChanged: (String value){
                          if ( onChange != null ) {
                            onChange!(value);
                          }
                          contextApp.read<AppTextInputCubit>().removeError(value);
                        },
                        // maxLength: maxLength,
                        inputFormatters: inputFormatters,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white.withOpacity(0.5),
                          suffixIconColor: isError.isEmpty? suffixIconColors : AppColors().primaryRed,
                          prefixIcon: priFixIcon,
                          suffixIcon:  suffixIcon,
                          labelStyle: textStyle(isError),
                          labelText: hint,
                          hintText: hintText,
                          border: InputBorder.none,
                          hintStyle: TextStyle(color: AppColors().grey.withOpacity(0.9)),
                          contentPadding: edgeInsets.isNonNegative?EdgeInsets.symmetric(horizontal: 15.px,vertical: 14.px):edgeInsets,
                          enabledBorder: borderNone ?border(isError) : null,
                          focusedBorder:borderNone ?border(isError) : null,
                          disabledBorder: borderNone ?border(isError) : null,
                        ),
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
      color: err.isEmpty ? AppColors().grey.withOpacity(0.9) : AppColors().primaryRed,
    );
  }

  OutlineInputBorder border(String err) {
    return OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(3)),
        borderSide: BorderSide(
            color:
                err.isEmpty ? Colors.cyan.withOpacity(0.15) : AppColors().primaryRed,
            width: err.isEmpty ? 1 : 1.15));
  }
}

class TextLabel extends StatelessWidget {
  final String text;
  final double left;
  final double right;
  final double top;
  final double bottom;
  final bool isRequired;
  final bool isStar;
  const TextLabel(
      {super.key,
      required this.text,
      this.left = 0,
      this.right = 0,
      this.top = 0,
      this.bottom = 10,
      this.isStar=true,
      this.isRequired = true});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin:
          EdgeInsets.only(left: left, right: right, top: top, bottom: bottom),
      child: Row(
        children: [
          Text(
            text,
            style: AppTextStyle().textS(fontWeight: FontWeight.bold),
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(
            width: 10.sp,
          ),
          isRequired
              ? Text(
                isStar? "*" : "",
                  style: AppTextStyle().textS(color: AppColors().primaryRed),
                )
              : Container()
        ],
      ),
    );
  }
}

class AppDatePicker extends StatelessWidget {
  final Color? suffixIconColors;
  final String? hint;
  final String? hintText;
  late String isError;
  final Widget? priFixIcon;
  final Widget? suffixIcon;
  final bool? readOnly;
  final bool disable;
  final bool keyDisable;
  final void Function(String text)? onChange;
  final int maxLine;
  final EdgeInsets edgeInsets;
  dynamic options;
  final bool fromDate;
  final bool toDate;
  final bool date;
  final bool dateHour;
  final TextEditingController? controller;

  AppDatePicker(
      {super.key,
        this.suffixIconColors = Colors.grey,
        this.controller,
        this.hint,
        this.priFixIcon,
        this.keyDisable = false,
        this.suffixIcon,
        this.isError = "",
        this.disable = true,
        this.maxLine = 1,
        this.readOnly,
        this.hintText,
        this.edgeInsets = const EdgeInsets.symmetric(vertical: 14, horizontal: 15),
        this.options=0,
        this.fromDate=false,
        this.toDate=false,
        this.date=false,
        this.dateHour=false,
        this.onChange,
      });
  @override
  Widget build(BuildContext context) {
    if(!controller.isNull&&controller!.text.isNotEmpty) isError = "";
    return BlocProvider(
      create: (context) => TimeCubit(),
      child: BlocConsumer<TimeCubit, TimeState>(
        listener: (contextDate, state) {
          if(state is RemoveErrorAppPickerSuccess){
            isError = "";
          }
          if ( state is DatePickerSuccess ) {
            isError = "";
            controller?.text = state.valueDate;

            if(onChange!= null){
              onChange!(state.valueDate);
            }
            //print("print--------------${ controller?.text}");
          }
        },
        builder: (contextDate, state) {
          return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                    keyboardType: keyDisable ? TextInputType.number:null,
                    onTap: (){
                      datePicker(context,contextDate);
                    },
                    onChanged: (value){
                      if ( onChange != null ) {
                        onChange!(value);
                      }
                      contextDate.read<TimeCubit>().removeErrorAppPicker(value);
                    },
                    controller: controller,
                    maxLines: maxLine,
                    style: TextStyle(
                      fontSize: 15.px,
                      color: Colors.black.withOpacity(0.8),
                      fontWeight: FontWeight.w400,
                    ),
                    enabled: disable,
                    readOnly: true,
                    decoration: InputDecoration(
                      alignLabelWithHint: true,
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.5),
                      suffixIconColor:isError.isEmpty? suffixIconColors : AppColors().primaryRed,
                      prefixIcon: priFixIcon,
                      suffixIcon: suffixIcon,
                      labelStyle: textStyle(isError),
                      labelText: hint,
                      hintText: hintText,
                      border: InputBorder.none,
                      hintStyle: TextStyle(color: AppColors().grey.withOpacity(0.9)),
                      contentPadding: edgeInsets,
                      enabledBorder: border(isError),
                      focusedBorder: border(isError),
                      disabledBorder: border(isError),
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
      color: err.isEmpty ? AppColors().grey.withOpacity(0.9) :AppColors().primaryRed,
    );
  }

  OutlineInputBorder border(String err) {
    return OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(3)),
        borderSide: BorderSide(
            color:
            err.isEmpty ? Colors.cyan.withOpacity(0.15) :AppColors().primaryRed,
            width: err.isEmpty ? 1 : 1.15));
  }

  void datePicker(BuildContext context,dateContext) async {
    DateTime selectedDate = DateTime.now();
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    BlocProvider.of<TimeCubit>(dateContext).date(picked!);
  }

}



class AppTextInputTimePicker extends StatefulWidget {
  final Color? suffixIconColors;
  final String? hint;
  final String? hintText;
  late  String isError;
  final Widget? priFixIcon;
  final Widget? suffixIcon;
  final bool? readOnly;
  final bool disable;
  final bool keyDisablle;
  // final void Function()? onTap;
  final int maxLine;
  final EdgeInsets edgeInsets;
  final double? height;
  final int options;
  final TextEditingController? controller;
  final VoidCallback? onVoidCallBack;
  final bool isDismissible ;

  AppTextInputTimePicker(
      {super.key,
        this.hint,
        this.priFixIcon,
        this.keyDisablle = false,
        this.suffixIcon,
        this.isError = "",
        this.disable = true,
        // this.onTap,
        this.maxLine = 1,
        this.readOnly,
        this.hintText,
        this.edgeInsets = const EdgeInsets.symmetric(vertical: 14, horizontal: 15),
        this.height,
        this.options=0,
        this.controller,
        this.suffixIconColors = Colors.grey,
        this.onVoidCallBack,
        this.isDismissible = true ,
      });

  @override
  State<AppTextInputTimePicker> createState() => _AppTextInputTimePickerState();
}

class _AppTextInputTimePickerState extends State<AppTextInputTimePicker> {
  TextEditingController nController = TextEditingController();

   int hour = 0;
   int min = 0;
   int amOrPm = 0;

    @override
  void initState(){
      super.initState();
      DateTime dateTime = DateTime.now();
      var dateHours = DateFormat("h").format(dateTime);
      var dateMinute = DateFormat("m").format(dateTime);
      var dateAmPm = DateFormat("a").format(dateTime);
      hour = int.parse(dateHours)-1;
      min = int.parse(dateMinute);
      amOrPm = dateAmPm == "AM" ? 0 : 1;
    }

  @override
  Widget build(BuildContext context) {

      if(widget.controller!.text.isEmpty||widget.controller.isNull){
        nController.clear();
      }

      return BlocProvider(
      create: (context) => TimeCubit(),
      child: BlocConsumer<TimeCubit, TimeState>(
        listener: (timeContext, state) {
          if( state is StateOfTheTime ) {
            widget.isError="";
            String time = "";
            hour = state.hour; min = state.min; amOrPm = state.amOrPm;


            String minStr = min < 10 ? "0$min" : "$min";
            if( amOrPm == 1 ){
              int hourPm = 13+hour;
              time = "$hourPm:$minStr";
            } else {
              time = "${hour+1}:$minStr";
            }
            widget.controller?.text = time;
            nController.text = state.fullTime;

            // print("DataTimeFull =====${time}");
            // print("DataTimeFullOK =====${state.fullTime}");

          }
        },
        builder: (timeContext, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: widget.height,
                child: TextField(
                  keyboardType: widget.keyDisablle ? TextInputType.number:null,
                  onTap:
                      (){
                    AppTimePicker().timePicker(context,timeContext,UrlPath().fromTime,hour,min,amOrPm,onBack: widget.onVoidCallBack!,widget.isDismissible);
                  },
                  controller: nController,
                  maxLines: widget.maxLine,
                  style:  TextStyle(color: widget.isError.isEmpty? AppColors().black.withOpacity(0.7):AppColors().primaryRed),
                  enabled: widget.disable,
                  readOnly: true,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.5),
                    suffixIconColor: widget.isError.isEmpty? widget.suffixIconColors : AppColors().primaryRed,
                    prefixIcon: widget.priFixIcon,
                    suffixIcon: widget.suffixIcon,
                    labelStyle: textStyle(widget.isError),
                    labelText: widget.hint,
                    hintText: widget.hintText,
                    border: InputBorder.none,
                    hintStyle: TextStyle(color: AppColors().black),
                    contentPadding: widget.edgeInsets,
                    enabledBorder: border(widget.isError),
                    focusedBorder: border(widget.isError),
                    disabledBorder: border(widget.isError),
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              // Container(
              //     margin: const EdgeInsets.only(left: 5),
              //     child: Text(
              //       widget.isError,
              //       style: AppTextStyle().textValidate(isError: widget.isError)
              //     ))
            ],
          );
        },
      ),
    );
  }

  TextStyle textStyle(String err) {
    return TextStyle(
      color: err.isEmpty ? AppColors().grey.withOpacity(0.9) : AppColors().primaryRed,
    );
  }

  OutlineInputBorder border(String err) {
    return OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(3)),
        borderSide: BorderSide(
            color:
            err.isEmpty ? Colors.cyan.withOpacity(0.15) :AppColors().primaryRed,
            width: err.isEmpty ? 1 : 1.15));
  }
}




// vichet New Version Text Input

class AppVichetDatePicker extends StatelessWidget {
  final Color? suffixIconColors;
  final String? hint;
  final String? hintText;
  late String isError;
  final Widget? priFixIcon;
  final Widget? suffixIcon;
  final bool? readOnly;
  final bool disable;
  final bool keyDisable;
  // final void Function()? onTap;
  final void Function(String text)? onChange;
  final int maxLine;
  final EdgeInsets edgeInsets;
  final double? height;
  dynamic options;
  final bool fromDate;
  final bool toDate;
  final bool date;
  final bool dateHour;
  final TextEditingController? controller;

  AppVichetDatePicker(
      {super.key,
        this.suffixIconColors = Colors.grey,
        this.controller,
        this.hint,
        this.priFixIcon,
        this.keyDisable = false,
        this.suffixIcon,
        this.isError = "",
        this.disable = true,
        // this.onTap,
        this.maxLine = 1,
        this.readOnly,
        this.hintText,
        this.edgeInsets = const EdgeInsets.symmetric(vertical: 14, horizontal: 15),
        this.height = 48.00,
        this.options=0,
        this.fromDate=false,
        this.toDate=false,
        this.date=false,
        this.dateHour=false,
        this.onChange,
      });
  @override
  Widget build(BuildContext context) {
    // if(!controller.isNull&&controller!.text.isNotEmpty) isError = "";
    return BlocProvider(
      create: (context) => TimeCubit(),
      child: BlocConsumer<TimeCubit, TimeState>(
        listener: (contextDate, state) {
          if ( state is DatePickerSuccess ) {
            isError = "";
            controller?.text = state.valueDate;

            if(onChange!= null){
              onChange!(state.valueDate);
            }

          }
        },
        builder: (contextDate, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Container(
            alignment: Alignment.center,
            margin: EdgeInsets.zero,
            padding: EdgeInsets.only(top: 8.px),
            width: MediaQuery.of(context).size.width,
            height: screenHeight/12.85.px,
            decoration: BoxDecoration(
                color: AppColors().white,
                border: Border.all(color: isError.isEmpty ? Colors.lightBlueAccent.withOpacity(0.2): AppColors().primaryRed),
                borderRadius: const BorderRadius.all(Radius.circular(8))),
            child: Theme(
              data: ThemeData(
                colorScheme: Theme.of(context).colorScheme.copyWith(primary: Colors.cyan),
                inputDecorationTheme: const InputDecorationTheme(
                  // isDense: true,// this will remove the default content padding
                  // now you can customize it here or add padding widget
                  isCollapsed: false,
                  constraints: BoxConstraints.expand(),
                  contentPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                ),

              ),
                child: SizedBox(
                  height: height,
                  child: TextField(
                    keyboardType: keyDisable ? TextInputType.number:null,
                    onTap: (){
                      datePicker(context,contextDate);
                    },
                    controller: controller,
                    maxLines: maxLine,
                    // style: AppTextStyle().textValidate(isError:isError),
                    enabled: disable,
                    readOnly: true,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      suffixIconColor:isError.isEmpty? suffixIconColors : AppColors().primaryRed,
                      prefixIcon: priFixIcon,
                      suffixIcon: suffixIcon,
                      labelStyle: textStyle(isError),
                      labelText: hint,
                      hintText: hintText,
                      border: InputBorder.none,
                      hintStyle: TextStyle(color: AppColors().grey.withOpacity(0.9)),
                      contentPadding: edgeInsets,
                      enabledBorder: border(isError),
                      focusedBorder: border(isError),
                      disabledBorder: border(isError),
                    ),
                  ),
                ),
              ),
              )
            ],
          );
        },
      ),
    );
  }

  TextStyle textStyle(String err) {
    return TextStyle(
      color: err.isEmpty ? AppColors().grey.withOpacity(0.9) :AppColors().primaryRed,
    );
  }

  OutlineInputBorder border(String err) {
    return OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(3)),
        borderSide: BorderSide(
            color: err.isEmpty ? Colors.cyan.withOpacity(0.2) :AppColors().primaryRed,
            width: err.isEmpty ? 1 : 1.15));
  }

  void datePicker(BuildContext context,dateContext) async {
    DateTime selectedDate = DateTime.now();
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    BlocProvider.of<TimeCubit>(dateContext).date(picked);
  }

}
// vichet New Version Text Input


