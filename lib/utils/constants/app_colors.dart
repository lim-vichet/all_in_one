import 'package:flutter/material.dart';

class AppColors {
  static final AppColors _singleton = AppColors._internal();

  factory AppColors() {
    return _singleton;
  }

  AppColors._internal();

  Color get transparent => Colors.transparent;
  Color get black => Colors.black;
  Color get black54 => Colors.black54;
  Color get black26 => Colors.black26;
  Color get blackDialog => Colors.black26;

  Color get white =>  const Color(0xFFFFFFFF);
  Color get white2 =>  const Color(0xFFFEFEFF);
  Color get depWhite =>  const Color(0xFFE9E2E2);

  Color get primaryRed => const Color(0xffcc2e31);
  // Color get primaryBlue => const Color(0xff4a64f6);
  Color get primaryBlue => const Color(0xff4a64f6);
  Color get primaryRedBtn => const Color(0xffAB2225);

  Color get textColor => const Color(0xff333333);
  Color get deepBlue => const Color(0xff041a34);

  Color get facebook => const Color(0xFF3A5999);
  Color get brown => const Color(0xffbfb1af);

  Color get blue => const Color(0xFF4E67F3);
  Color get blued => const Color(0xFF0C53A8);
  Color get aliceBlue => const Color(0xFFEAF9FF);
  Color get deepAliceBlue => const Color(0x1C005E7B);
  Color get deepGrey => const Color(0xFFBFB1AF);

  Color get star => const Color(0xFFF8B81B);

  Color get yellow => const Color(0xFFF8B81B);
  Color get yellowBit => const Color(0xFFD5BF9B);
  Color get yellowed => const Color(0xFFE68A2E);

  Color get green => const Color(0xFF229D2F);

  Color get grey => const Color(0xff9B9B9B);

  Color get borderColor => const Color(0xffEFEFEF);

  Color get point1 => const Color(0xffF7A71E);

  Color get point2 => const Color(0xffEBD94F);
  Color get red => const Color(0xffde2424);
  Color get otherGrey => const Color(0xffDEDBDB);
  Color get orange => const Color(0x54ffae1d);
  Color get removePub => const Color(0xbaeeeaea);

  Color get backgroundColor =>  Colors.white;
  Color get bgDetailIcons => const Color(0xff1FA8E0).withOpacity(0.5);

  Color get bgCardIcons => const Color(0xffF1F5F9);
  Color get bgColorDisable => const Color(0xff1EA8E0).withOpacity(0.03);

  Color get primaryBluePrice => const Color(0xff4E67F3);
  Color get bgColorTwo => const Color(0xffF6F7FE);
  Color get bgBottomGroceries => const Color(0xffBFB1AF);
  Color get yellowSmall => const Color(0xffFCF6D6);
  Color get depYellow => const Color(0xffBE8C48);

}
