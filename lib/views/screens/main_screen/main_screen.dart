import 'dart:async';
import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lazy_load_indexed_stack/lazy_load_indexed_stack.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../logic/cubit/bottom_nav/bottom_nav_cubit.dart';
import '../../../main.dart';
import '../../../utils/constants/app_colors.dart';
import '../../../utils/global_use.dart';
import '../../../utils/shared_preferences_service.dart';
import '../../widgets/bottom_nav_icon.dart';
import '../../widgets/internet_connection_screen/internet_connection_widget.dart';
import '../account_screen/account_screen.dart';
import '../cart_screen/cart_screen.dart';
import '../home_screen/home_screen.dart';
import '../order_screen/order_screen.dart';




class MainScreen extends StatefulWidget {
  static const String routeName = "/main_screen";

  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final GlobalKey<ScaffoldState> keyContext = GlobalKey();

  @override
  void initState() {
    super.initState();
    // close app but not clear Push Notification
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      PushNotification notification = PushNotification(
          title: message.notification?.title,
          body: message.notification?.body,
          dataTitle: message.data['title'],
          dataBody: message.data['body'],
          id: message.data["id"],
          type: message.data["type"] ?? '',
          notificationId: message.data["notificationId"]);
      // print("nnnnnnnnnnnnnnnnnnnnnnnn------3 ${jsonEncode(notification.type)}");
      // print("nnnnnnnnnnnnnnnnnnnnnnnn------3 ${jsonEncode(message.data)}");
      // print("nnnnnnnnnnnnnnnnnnnnnnnn------3 ${jsonEncode(message.notification!.title)}");
      // print("nnnnnnnnnnnnnnnnnnnnnnnn------3 ${jsonEncode(message.notification!.body)}");
      // print("nnnnnnnnnnnnnnnnnnnnnnnn------3 ${jsonEncode(notification.id)}");
      // print("nnnnnnnnnnnnnnnnnnnnnnnn------3 ${jsonEncode(notification.notificationId)}");
      setState(() {
        countNotifications++;
        isPushNotification = true;
        onTapNotification = true;
      });

      if (notification.title == 'Ticket'){
        Navigator.pushNamedAndRemoveUntil(context, HomeScreen.routeName, (route) => false,
            // Navigator.pushNamed(context, TicketDetailScreen.routeName,
            arguments: {
              'getListStatusTicket':(v){},
              'id': int.tryParse(notification!.id),
              'idCheckStatusNotification':int.tryParse(notification.notificationId.toString()),
              'getListStatusTicket':(v){},
              // 'id': int.tryParse(idNotification),
              'status': true,
              'countNo': countNotifications,
              'statusNotification': 'fromListNotification',
            }
        );
      }
      else if(notification.title =='Leave Application Form'){
        Navigator.pushNamedAndRemoveUntil(context, HomeScreen.routeName, (route) => false,
            arguments: {
              // 'getListStatusTicket':(v){},
              'id': int.tryParse(notification.id),
              'idCheckStatusNotification':int.tryParse(notification.notificationId.toString()),
              // 'formType': notification.type,
              'formType': '',
              'statusApprove': "Approve",
              'status': true,
              'countNo': countNotifications,
              'onTapGetDataStaffApprove':(v) {},
              'statusNotification': 'fromListNotification',
              'getListNotification': () {
                // print("Hello uuuuu");
              },
            }
        );
      }

    });
    // close app but not clear Push Notification

    // if (widget.countUnseen != null) {
    //   countNotifications = widget.countUnseen!;
    // }
  }


  addToGroup(context) {
    return showDialog(
        barrierDismissible: true,
        context: context,
        builder: (BuildContext context) {
          bool checkBox = false;
          return StatefulBuilder(
            builder: (context, setState) {
              return Dialog(
                child: Container(
                  height: 250.px,
                  width: 30,
                  padding: EdgeInsets.all(15.px),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Column(
                    children: [
                      Text("Add to group"),
                      Container(
                        height: 150,
                        // color: Colors.pink,
                        child: ListView.builder(
                            itemCount: 5,
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            physics: const ScrollPhysics(),
                            itemBuilder: (context, index) {
                              return Container(
                                height: 30,
                                child: InkWell(
                                  onTap: (){
                                    setState(() {
                                      checkBox = true;
                                    });
                                    print("testggg==================${checkBox}");
                                  },
                                  child: ListTile(
                                    leading: checkBox == true?
                                    Icon(Icons.check_box, color: Colors.green,):
                                    Icon(Icons.check_box_outline_blank, color: Colors.red,),
                                    title: Text("Developer Mobile"),
                                    trailing: Text(""),
                                  ),
                                ),
                              );
                            }

                        ),
                      ),
                      SizedBox(height: 20,),
                      Align(
                        alignment: FractionalOffset.centerRight,
                        child: InkWell(
                          onTap: (){
                            Navigator.pushNamedAndRemoveUntil(context, MainScreen.routeName, (route) => false);
                            // Navigator.pushNamed(context, HomeScreen.routeName);
                            // Navigator.pop(context);
                          },
                          child: Container(
                              height: 30,
                              width: 70,
                              decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(10)
                              ),
                              child: Center(child: Text("Add"))
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                // child: InkWell(
                //   onTap: () {
                //     setState(() {
                //       contentText = true ;
                //     });
                //   },
                //   child: Text("Change",
                //     style: TextStyle(
                //         color: contentText?
                //         Colors.green:
                //         Colors.red
                //     ),),
                // ),
              );
            },
          );
        });
  }


  late Timer _timer;
  int _start = 10;

  void startTimer() {
    const oneSec = const Duration(seconds: 10);
    _timer = new Timer.periodic(
      oneSec,
          (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
          });
          addToGroup(context);
        }
        else {
          setState(() {
            log("message=====> $_start");
            _start--;
          });
        }
      },
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Listener(

      onPointerDown: (PointerDownEvent event) {
        log("message-----PointerDownEvent: $event");
        _start = 10;
        startTimer();
      },
      child: BlocProvider(
        create: (context) => BottomNavCubit(0),
        child: BlocBuilder<BottomNavCubit, int>(
          builder: (context, state) {
            return Scaffold(
              key: keyContext,
              body: InternetConnectWidget(
                child: LazyLoadIndexedStack(
                  index: BlocProvider.of<BottomNavCubit>(context).currentIndex,
                  children: const [
                    HomeScreen(),
                    OrderScreen(),
                    CartScreen(),
                    AccountScreen()
                  ],
                ),
              ),
              bottomNavigationBar: SizedBox(

                child: BottomNavigationBar(
                  currentIndex:
                      BlocProvider.of<BottomNavCubit>(context).currentIndex,
                  onTap: (index) {
                    bool isNotLogin =
                        SharedPreferencesService.instance?.token == "" ||
                            SharedPreferencesService.instance?.token == null;
                    BlocProvider.of<BottomNavCubit>(context)
                        .onNavbarIndexChange(index);
                    // if ((index == 1 || index == 2 || index == 3) &&
                    //     isNotLogin) {
                    //   Navigator.pushNamed(context, LoginScreen.routeName);
                    // } else {
                    //   BlocProvider.of<BottomNavCubit>(context)
                    //       .onNavbarIndexChange(index);
                    // }
                  },
                  backgroundColor: AppColors().white,
                  unselectedItemColor: AppColors().black,
                  unselectedFontSize: 12.px,
                  selectedFontSize: 14.px,
                  iconSize: 24.px,
                  selectedItemColor: AppColors().primaryRed,
                  type: BottomNavigationBarType.fixed,

                  items: [
                    BottomNavigationBarItem(
                      icon: bottomNavIcon(icon: Icons.home, isActive: false),
                      activeIcon: bottomNavIcon(icon: Icons.home, isActive: true),
                      label: "Home",
                    ),
                    BottomNavigationBarItem(
                      icon: bottomNavIcon(
                          icon: Icons.list_alt_outlined, isActive: false),
                      activeIcon: bottomNavIcon(
                          icon: Icons.list_alt_outlined, isActive: true),
                      label: "Order",
                    ),
                    BottomNavigationBarItem(
                      icon: bottomNavIcon(
                          icon: Icons.shopping_cart_outlined, isActive: false),
                      activeIcon: bottomNavIcon(
                          icon: Icons.shopping_cart_outlined, isActive: true),
                      label: "Cart",
                    ),
                    BottomNavigationBarItem(
                      icon: bottomNavIcon(
                          icon: Icons.account_circle_outlined, isActive: false),
                      activeIcon: bottomNavIcon(
                          icon: Icons.account_circle_outlined, isActive: true),
                      label: "Account",
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
