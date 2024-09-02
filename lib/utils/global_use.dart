import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../main.dart';

class GlobalUse {
  static TextTheme appTextTheme(BuildContext context) =>
      Theme.of(context).textTheme;
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
}

double screenWidth = 0.0;
double screenHeight = 0.0;
double gridBorderRadius = 8.00.sp;
double listBorderRadius = 8.00.sp;
double heightCardList = 60;
double widthListIcons = 60;
double sizeArrowIcons = 15;
double widthListIconsArrowIcons = 32;
double gridBorderRadiusDetail = 10.00.sp;
double dialogBorderRadius = 15.00;
double heightCards = 55.00;

double bottomDetail = 5.px;


double heightCard = 80.00;

String? lan = "en";
String idTokenFirebase = "";
bool onTapNotification = false;
String idNotification = '1';
String notificationId = '1';
String notificationType = '';

String chatIdNotification = '1';
String chatGroupIdNotification = '1';
String chatUserMemberNotification = '1';
String chatImageNotification = '';
String notificationChatType = '';
String notificationTypeChat = '';
String chatUserNameNotification = '';
String messageChatNotification = '';
String fileChatNotification = '';
String durationChatNotification = '';

int countNotifications = 0;
bool isPushNotification = false;
int durationNavigator = 5;
double heightTabBar = 55.px;
double heightTabBarChat = 60.px;
double heightHeader = 55.px;
double heightHeaderHasSearch = 60.px;
PushNotification? notificationTypeGlobal;



// form message
String messageReject      = "Reject SuccessFully".tr;
String messageApproval    = "Approved SuccessFully".tr;
String messageError       = "Something Wrong!".tr;
String messageErrorFile   = "Upload image failed".tr;
String messageErrorDelete = "Delete failed".tr;
String messageSuccess     = "Save SuccessFully".tr;
String messageAddTask     = "Add Task SuccessFully".tr;
String messageAddBoard    = "Add Board SuccessFully".tr;

String msgMoveBoardToProcessing  = "Move board to processing".tr;
String msgMoveBoardToToDo        = "Move board to to do".tr;
String msgMoveBoardToDone        = "Move board to done".tr;
String msgMoveBoardSuccess       = "Move board SuccessFully".tr;
String msgAddModuleSuccess       = "Add Module SuccessFully".tr;
String msgUpdateModuleSuccess    = "Updated Module SuccessFully".tr;
String msgDeleteFileBoard        = "File Delete  SuccessFully".tr;
String msgDeleteComment          = "Delete SuccessFully".tr;
String msgPostComment            = "Save SuccessFully".tr;


// for 2 user in chat screen all isUserInChatScreen = true , isUserInChatScreen = false;
bool isUserInChatScreen = false;



// Chat
int gbChatId = 0;

