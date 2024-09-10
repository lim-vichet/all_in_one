import 'package:flutter/material.dart';

class AppColors {
  static final AppColors _singleton = AppColors._internal();

  factory AppColors() {
    return _singleton;
  }

  AppColors._internal();

  Color get black => Colors.black;
  Color get black80 => Colors.black.withOpacity(0.8);
  Color get black60 => Colors.black.withOpacity(0.6);
  Color get black26 => Colors.black26;

  Color get white => Colors.white;
  Color get whiteNavigator => Color(0xffF7F7F7);

  Color get primaryRed => const Color(0xffD91120);
  Color get primaryBlue => const Color(0xff1FA8E0);

  Color get textColor => const Color(0xff333333);
  Color get deepBlue => const Color(0xff041a34);

  Color get facebook => const Color(0xFF3A5999);

  Color get blue => const Color(0xFF23B1E5);

  Color get aliceBlue => const Color(0xFFEAF9FF);
  Color get deepAliceBlue => const Color(0xFF2F657B);
  Color get deepGrey => const Color(0xFF5E5C5C);

  Color get star => const Color(0xFFF8B81B);

  Color get yellow => const Color(0xFFF8B81B);

  Color get green => const Color(0xFF78AC30);

  Color get grey => const Color(0xff9B9B9B);

  Color get borderColor => const Color(0xffEFEFEF);

  Color get point1 => const Color(0xffF7A71E);

  Color get point2 => const Color(0xffEBD94F);
  Color get red => const Color(0xffFF8989);
  Color get otherGrey => const Color(0xffB4B4B4);

  Color get bgDetailIcons => const Color(0xff1FA8E0).withOpacity(0.5);

  Color get bgCardIcons => const Color(0xffF1F5F9);
  Color get bgColorDisable => const Color(0xff1EA8E0).withOpacity(0.03);
  Color get bgColorApp => const Color(0xffF7F7F7);
  Color get bgListColor => const Color(0xffF1F1F1);
  Color get colorSnackBarSuccess => const Color(0xff4CB050);
  Color get colorAlpha => const Color(0xff000000).withOpacity(0.1);


  Color get bgChatReply => const  Color(0xffF2F2F2);
  Color get bgChatOwner => const  Color(0xff4399FF);
  Color get bgChatDate => const  Color(0x558AD3D5);




}
