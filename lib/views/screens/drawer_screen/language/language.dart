import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../logic/cubit/select_language_cubit/select_language_cubit.dart';
import '../../../../main.dart';
import '../../../../routes/config_router.dart';
import '../../../../utils/constants/app_colors.dart';
import '../../../../utils/constants/app_font_styles.dart';
import '../../../../utils/global_use.dart';
import '../../home_function/attendance/checkin_form/checkin_form.dart';
import '../../home_function/attendance/list_attendance/list_attendance.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({Key? key}) : super(key: key);

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SelectLanguageCubit(lan == "kh" ? false : true),
      child: Scaffold(
          backgroundColor: AppColors().bgColorApp,
          appBar: AppBar(
            backgroundColor: Colors.lightBlueAccent,
            // automaticallyImplyLeading: false,
            title: Container(
                padding: EdgeInsets.only(right: 50),
                child:  Center(
                    child: Text(
                  "LANGUAGE".tr,
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ))),
            leading: const BackButton(
              color: Colors.white,
            ),
          ),
          body: BlocBuilder<SelectLanguageCubit, bool>(
            builder: (context, state) {
              return Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: double.infinity,
                    height: double.infinity,
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: ListView(
                        scrollDirection: Axis.vertical,
                        children: [
                          SizedBox(height: 15.px),
                          InkWell(
                            onTap: () {
                              context.read<SelectLanguageCubit>().SelectLanguage(false);
                              lan = "kh";
                              localStore.write('lang', 'kh');
                              currectLang = const Locale('kh', 'KH');
                              Get.updateLocale(currectLang);
                            },
                            child: Container(
                              height: 70.px,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Color(0xffF7F7F7),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey.withOpacity(.2),
                                        blurRadius: 5,
                                        spreadRadius: 1)
                                  ]),
                              child: Row(
                                children: [
                                  Expanded(
                                      flex: 2,
                                      child: Image.network(
                                        "https://cdn.countryflags.com/thumbs/cambodia/flag-round-250.png",
                                        width: 40,
                                        height: 40,
                                      )),
                                  Expanded(
                                    flex: 8,
                                    child: Text(
                                      "ភាសាខ្មែរ".tr,
                                      style: AppTextStyle().textL(),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 15.px),
                          InkWell(
                            onTap: () {
                              context.read<SelectLanguageCubit>().SelectLanguage(true);
                              // SharedPreferencesService.instance!.setLanguage("en");
                              localStore.write('lang', 'en');
                              currectLang = const Locale('en', 'US');
                              Get.updateLocale(currectLang);
                              lan = "en";
                            },
                            child: Container(
                              height: 70.px,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Color(0xffF7F7F7),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey.withOpacity(.2),
                                        blurRadius: 5,
                                        spreadRadius: 1)
                                  ]),
                              child: Row(
                                children: [
                                  Expanded(
                                      flex: 2,
                                      child: Image.network(
                                        "https://www.clipartmax.com/png/full/41-413003_english-uk-flag-circle-vector.png",
                                        width: 40,
                                        height: 40,
                                      )),
                                  Expanded(
                                    flex: 8,
                                    child: Text(
                                      "English".tr,
                                      style: AppTextStyle().textL(),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              );
            },
          )),
    );
  }
}
