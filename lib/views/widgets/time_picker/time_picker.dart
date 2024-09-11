
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../logic/cubit/time_picker/time_cubit.dart';
import '../../../utils/constants/app_font_styles.dart';
import '../../../utils/constants/url_path.dart';
import '../../../utils/global_use.dart';
class AppTimePicker {

  List<String> listShift = ["AM","PM"];
  String fromDate = UrlPath().fromDate;
  String fromTime = UrlPath().fromTime;
  String toDate   = UrlPath().toDate;
  String toTime   = UrlPath().toTime;
  bool isDismissible = true ;

  String validTime = "";

  void timePicker(context,outContext,String timeType,int hour,int min,int amOrPm,bool isDismissible,
      {required VoidCallback onBack}) {
    showModalBottomSheet(
      isDismissible: isDismissible,
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      isScrollControlled: true, // set this to true
      builder: (_) {
        return BlocProvider(
          create:(context) => TimeCubit(),
          child: BlocBuilder<TimeCubit, TimeState>(
            builder: (timeContext, state) {
              if( state is StateOfTheTime ) {
                hour = state.hour;
                min = state.min;
                amOrPm = state.amOrPm;
                state.typeOfTime == UrlPath().fromTime ? fromTime = state.fullTime : toTime = state.fullTime;

                // print("dataTimeFromPicker ======${fromTime}");

              } else if ( state is ValidTimeState ) {
                validTime = state.validTime;
              }
              return Container(
                  padding: const EdgeInsets.only(top: 10,left: 10,right: 10),
                  height: screenHeight/1.7,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                              onPressed: onBack,
                              icon: const Icon(Icons.close,color: Colors.black)
                          ),
                        ],
                      ),
                      const Divider(thickness: 1,indent: 40,endIndent: 40,),
                      Container(
                          height: screenHeight/1.7 - screenHeight/8,
                          width: double.infinity,
                          margin: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            children: [
                              SizedBox(
                                width: double.infinity,
                                height: 40,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Center(child: Text("Hour",style: AppTextStyle().textM(),)),
                                    Center(child: Text("Minute",style: AppTextStyle().textM())),
                                    Center(child: Text("Type",style: AppTextStyle().textM())),
                                  ],
                                ),
                              ),

                              const Divider(thickness: 1,indent: 20,endIndent: 20,),

                              Expanded(
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    _timeWidget(12,"h",timeContext,outContext,timeType, hour, min, amOrPm),
                                    _timeWidget(60,"m",timeContext,outContext,timeType, hour, min, amOrPm),
                                    _timeWidget(2 ,"t",timeContext,outContext,timeType, hour, min, amOrPm),
                                  ],
                                ),
                              ),
                            ],
                          )
                      ),
                    ],
                  )
              );
            },
          ),
        );
      },
    );
  }

  Widget _timeWidget(int itemCount,String type,timeContext,outContext,String timeType,int hour,int min,int amOrPm) {
    return SizedBox(
        width: 80,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ListView.builder(
                  itemCount: itemCount,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (content,i) {
                    return InkWell(
                      onTap: (){
                        if( type == "h" ) {
                          hour = i;
                          BlocProvider.of<TimeCubit>(outContext).setUpTheTime(hour,min,amOrPm,timeType);
                          BlocProvider.of<TimeCubit>(timeContext).setUpTheTime(hour,min,amOrPm,timeType);
                        } else if ( type == "m" ) {
                          min = i;
                          BlocProvider.of<TimeCubit>(outContext).setUpTheTime(hour,min,amOrPm,timeType);
                          BlocProvider.of<TimeCubit>(timeContext).setUpTheTime(hour,min,amOrPm,timeType);
                        } else {
                          amOrPm = i;
                          BlocProvider.of<TimeCubit>(outContext).setUpTheTime(hour,min,amOrPm,timeType);
                          BlocProvider.of<TimeCubit>(timeContext).setUpTheTime(hour,min,amOrPm,timeType);
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                        margin: const EdgeInsets.only(bottom: 20),
                        decoration: type=="h" ? BoxDecoration(
                            color: i==hour ? Colors.blue.shade100 : Colors.transparent,
                            borderRadius: BorderRadius.circular(30)
                        ) : type=="m" ? BoxDecoration(
                            color: i==min ? Colors.blue.shade100 : Colors.transparent,
                            borderRadius: BorderRadius.circular(30)
                        ) : BoxDecoration(
                            color: i==amOrPm ? Colors.blue.shade100 : Colors.transparent,
                            borderRadius: BorderRadius.circular(30)
                        ),
                        child: type=="h" ? Center(
                            child:Text("${i+1}" , style: AppTextStyle().textM(fontWeight: i!=hour ? FontWeight.normal :FontWeight.bold),)
                        ): type == "m" ? Center(
                            child:Text( i < 10 ? "0$i" : "$i" , style: AppTextStyle().textM(fontWeight: i!=min ? FontWeight.normal : FontWeight.bold),)
                        ) : Center(
                            child:Text(listShift[i], style: AppTextStyle().textM(fontWeight: i!=amOrPm ? FontWeight.normal : FontWeight.bold),)
                        ),
                      ),
                    );
                  }
              )
            ],
          ),
        )
    );
  }

  void datePicker(BuildContext context, String typeDate,dateContext , {bool dateValid=true}) async {
    DateTime selectedDate = DateTime.now();
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2000),
        lastDate: DateTime(2100),
    );
      BlocProvider.of<TimeCubit>(dateContext).datePicker(picked,selectedDate,typeDate,dateValid: dateValid);
  }

}



