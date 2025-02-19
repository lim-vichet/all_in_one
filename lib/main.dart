// // import 'package:flutter/material.dart';
// //
// // void main() {
// //   runApp(const MyApp());
// // }
// //
// // class MyApp extends StatelessWidget {
// //   const MyApp({super.key});
// //
// //   // This widget is the root of your application.
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       title: 'Flutter Demo',
// //       theme: ThemeData(
// //         // This is the theme of your application.
// //         //
// //         // TRY THIS: Try running your application with "flutter run". You'll see
// //         // the application has a purple toolbar. Then, without quitting the app,
// //         // try changing the seedColor in the colorScheme below to Colors.green
// //         // and then invoke "hot reload" (save your changes or press the "hot
// //         // reload" button in a Flutter-supported IDE, or press "r" if you used
// //         // the command line to start the app).
// //         //
// //         // Notice that the counter didn't reset back to zero; the application
// //         // state is not lost during the reload. To reset the state, use hot
// //         // restart instead.
// //         //
// //         // This works for code too, not just values: Most code changes can be
// //         // tested with just a hot reload.
// //         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
// //         useMaterial3: true,
// //       ),
// //       home: const MyHomePage(title: 'Flutter Demo Home Page'),
// //     );
// //   }
// // }
// //
// // class MyHomePage extends StatefulWidget {
// //   const MyHomePage({super.key, required this.title});
// //
// //   // This widget is the home page of your application. It is stateful, meaning
// //   // that it has a State object (defined below) that contains fields that affect
// //   // how it looks.
// //
// //   // This class is the configuration for the state. It holds the values (in this
// //   // case the title) provided by the parent (in this case the App widget) and
// //   // used by the build method of the State. Fields in a Widget subclass are
// //   // always marked "final".
// //
// //   final String title;
// //
// //   @override
// //   State<MyHomePage> createState() => _MyHomePageState();
// // }
// //
// // class _MyHomePageState extends State<MyHomePage> {
// //   int _counter = 0;
// //
// //   void _incrementCounter() {
// //     setState(() {
// //       // This call to setState tells the Flutter framework that something has
// //       // changed in this State, which causes it to rerun the build method below
// //       // so that the display can reflect the updated values. If we changed
// //       // _counter without calling setState(), then the build method would not be
// //       // called again, and so nothing would appear to happen.
// //       _counter++;
// //     });
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     // This method is rerun every time setState is called, for instance as done
// //     // by the _incrementCounter method above.
// //     //
// //     // The Flutter framework has been optimized to make rerunning build methods
// //     // fast, so that you can just rebuild anything that needs updating rather
// //     // than having to individually change instances of widgets.
// //     return Scaffold(
// //       appBar: AppBar(
// //         // TRY THIS: Try changing the color here to a specific color (to
// //         // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
// //         // change color while the other colors stay the same.
// //         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
// //         // Here we take the value from the MyHomePage object that was created by
// //         // the App.build method, and use it to set our appbar title.
// //         title: Text(widget.title),
// //       ),
// //       body: Center(
// //         // Center is a layout widget. It takes a single child and positions it
// //         // in the middle of the parent.
// //         child: Column(
// //           // Column is also a layout widget. It takes a list of children and
// //           // arranges them vertically. By default, it sizes itself to fit its
// //           // children horizontally, and tries to be as tall as its parent.
// //           //
// //           // Column has various properties to control how it sizes itself and
// //           // how it positions its children. Here we use mainAxisAlignment to
// //           // center the children vertically; the main axis here is the vertical
// //           // axis because Columns are vertical (the cross axis would be
// //           // horizontal).
// //           //
// //           // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
// //           // action in the IDE, or press "p" in the console), to see the
// //           // wireframe for each widget.
// //           mainAxisAlignment: MainAxisAlignment.center,
// //           children: <Widget>[
// //             const Text(
// //               'You have pushed the button this many times:',
// //             ),
// //             Text(
// //               '$_counter',
// //               style: Theme.of(context).textTheme.headlineMedium,
// //             ),
// //           ],
// //         ),
// //       ),
// //       floatingActionButton: FloatingActionButton(
// //         onPressed: _incrementCounter,
// //         tooltip: 'Increment',
// //         child: const Icon(Icons.add),
// //       ), // This trailing comma makes auto-formatting nicer for build methods.
// //     );
// //   }
// // }
//
// import 'dart:async';
// import 'dart:convert';
// import 'dart:developer';
// import 'dart:io';
// import 'package:all_in_one/routes/routes.dart';
// import 'package:all_in_one/utils/global_use.dart';
// import 'package:all_in_one/utils/shared_preferences_service.dart';
// import 'package:all_in_one/views/screens/home_screen/home_screen.dart';
// import 'package:all_in_one/views/screens/splash_screen/splash_screen.dart';
// import 'package:all_in_one/views/widgets/internet_connection_screen/getx_network_manager_binding.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:get/get_navigation/src/root/get_material_app.dart';
// import 'package:get_storage/get_storage.dart';
// import 'package:responsive_sizer/responsive_sizer.dart';
// import 'configs/config_reader.dart';
// import 'configs/environment.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:overlay_support/overlay_support.dart';
//
// import 'languages/language.dart';
//
//
// class MyHttpOverrides extends HttpOverrides{
//   @override
//   HttpClient createHttpClient(SecurityContext? context){
//     return super.createHttpClient(context)..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
//   }
// }
// late FirebaseMessaging messaging;
//
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(
//     options: FirebaseOptions(
//         apiKey: "AIzaSyBNNA0yrikxnrAF4fyqHMZHMMP_M822Ki0",
//         appId: "1:634090600777:android:75cb2ce5019896635b8298",
//         messagingSenderId: "634090600777",
//         projectId: "all-in-one-eee8d"
//     ),
//   );
//
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   await SharedPreferencesService.init();
//   SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
//   SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
//     statusBarColor: Colors.transparent,
//   ));
//
//   HttpOverrides.global = MyHttpOverrides();
//   messaging = FirebaseMessaging.instance;
//   messaging.getToken().then((value) {
//     idTokenFirebase = value.toString();
//     log("ContentContent $idTokenFirebase \n\n\n\n");
//   });
//   // subscribeT();
//   await ConfigReader.initialize(Environment.UAT);
//   runApp(const MyApp());
//
//
// }
//
// var localStore = GetStorage();
// Locale currectLang = const Locale('en', 'US');
//
// class MyApp extends StatefulWidget {
//   const MyApp({super.key});
//
//   @override
//   State<MyApp> createState() => _MyAppState();
// }
//
//
//
// class _MyAppState extends State<MyApp> {
//   late final FirebaseMessaging _messaging;
//   PushNotification? _notificationInfo;
//
//
//   registerNotification() async {
//     await Firebase.initializeApp();
//     _messaging = FirebaseMessaging.instance;
//
//     FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
//     NotificationSettings settings = await _messaging.requestPermission(
//       alert: true,
//       badge: true,
//       provisional: true,
//       sound: true,
//     );
//     // open App Push Notification (សម្រាប់ពេលចុច Poin ទៅលើ Notification alert តែម្ដង)
//     if (settings.authorizationStatus == AuthorizationStatus.authorized) {
//       FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//         log('========================== Hello');
//         log("KJJKJKKJJK${jsonEncode(message.notification)}");
//         // Parse the message received
//
//         PushNotification notification = PushNotification(
//             title: message.notification?.title,
//             body: message.notification?.body,
//             dataTitle: message.data['title'],
//             dataBody: message.data['body'],
//             id: message.data["id"],
//             type :message.data["type"],
//             notificationId: message.data["notificationId"]
//         );
//         print("nnnnnnnnnnnnnnnnnnnnnnnn------1 type ${notification.type}");
//         print("nnnnnnnnnnnnnnnnnnnnnnnn------1 id ${notification.notificationId}");
//         print("nnnnnnnnnnnnnnnnnnnnnnnn------1 Data ${jsonEncode(message.data)}");
//         print("nnnnnnnnnnnnnnnnnnnnnnnn------1 Title${jsonEncode(message.notification!.title)}");
//         print("nnnnnnnnnnnnnnnnnnnnnnnn------1 Body${jsonEncode(message.notification!.body)}");
//
//         setState(() {
//           if( notificationTypeGlobal != null ) notificationTypeGlobal=null;
//           _notificationInfo = notification;
//           idNotification = notification.id??'';
//           countNotifications++;
//           isPushNotification = true;
//           onTapNotification = true;
//           notificationTypeGlobal = _notificationInfo;
//         });
//
//         if (_notificationInfo != null) {
//           Container();
//           // print('test zsak merl===========2222 ');
//           // _showNotification();
//           // if (notification.type == 'Ticket'){
//           //   print('test1');
//           //   Navigator.pushNamed(context, TicketDetailScreen.routeName,
//           //       arguments: {
//           //         'getListStatusTicket':(v){},
//           //         'id': int.tryParse(_notificationInfo!.id),
//           //         'status': true,
//           //         'countNo': countNotifications
//           //       }
//           //   );
//           // }
//           // else if(notification.type =='Leave Application Form'){
//           //   Navigator.pushNamed(context, LeaveApplicationDetailScreen.routeName,
//           //       arguments: {
//           //         // 'getListStatusTicket':(v){},
//           //         'id': int.tryParse(_notificationInfo!.id),
//           //         'formType': notification.type,
//           //         'statusApprove': "Approve",
//           //         'status': true,
//           //         'countNo': countNotifications,
//           //         'onTapGetDataStaffApprove':(v) {}
//           //       }
//           //   );
//           // }
//           // else if(notification.type =='Work On-Site'){
//           //   Navigator.pushNamed(context, WorkOnSiteDetailScreen.routeName,
//           //       arguments: {
//           //         // 'getListStatusTicket':(v){},
//           //         'id': int.tryParse(_notificationInfo!.id),
//           //         'formType': notification.type,
//           //         'statusApprove': "Approve",
//           //         'status': true,
//           //         'countNo': countNotifications,
//           //         'onTapGetDataStaffApprove':(v) {}
//           //       }
//           //   );
//           // }
//           // else if(notification.type =='Mission Request'){
//           //   Navigator.pushNamed(context, RequestMissionDetailScreen.routeName,
//           //       arguments: {
//           //         // 'getListStatusTicket':(v){},
//           //         'id': int.tryParse(notification.id),
//           //         'formType': notification.type,
//           //         'statusApprove': "Approve",
//           //         'status': true,
//           //         'countNo': countNotifications,
//           //         'onTapGetDataStaffApprove':(v) {}
//           //       }
//           //   );
//           // }
//           // else if(notification.type =='Vehicle Usage'){
//           //   Navigator.pushNamed(context, VehicleUseRequestDetailScreen.routeName,
//           //       arguments: {
//           //         // 'getListStatusTicket':(v){},
//           //         'id': int.tryParse(notification.id),
//           //         'formType': notification.type,
//           //         'statusApprove': "Approve",
//           //         'status': true,
//           //         'countNo': countNotifications,
//           //         'onTapGetDataStaffApprove':(v) {}
//           //       }
//           //   );
//           // }
//           // else if(notification.type =='Request Form'){
//           //   Navigator.pushNamed(context, RequestFormDetailScreen.routeName,
//           //       arguments: {
//           //         // 'getListStatusTicket':(v){},
//           //         'id': int.tryParse(notification.id),
//           //         'formType': notification.type,
//           //         'statusApprove': "Approve",
//           //         'status': true,
//           //         'countNo': countNotifications,
//           //         'onTapGetDataStaffApprove':(v) {}
//           //       }
//           //   );
//           // }
//           // else if(notification.type =='Overtime Form'){
//           //   Navigator.pushNamed(context, OverTimeDetailScreen.routeName,
//           //       arguments: {
//           //         // 'getListStatusTicket':(v){},
//           //         'id': int.tryParse(notification.id),
//           //         'formType': notification.type,
//           //         'statusApprove': "Approve",
//           //         'status': true,
//           //         'countNo': countNotifications,
//           //         'onTapGetDataStaffApprove':(v) {}
//           //       }
//           //   );
//           // }
//           // else if(notification.type =='Use Electronic Usage'){
//           //   Navigator.pushNamed(context, RequestUseApplicationDetailScreen.routeName,
//           //       arguments: {
//           //         // 'getListStatusTicket':(v){},
//           //         'id': int.tryParse(notification.id),
//           //         'formType': notification.type,
//           //         'statusApprove': "Approve",
//           //         'status': true,
//           //         'countNo': countNotifications,
//           //         'onTapGetDataStaffApprove':(v) {}
//           //       }
//           //   );
//           // }
//           // else if(notification.type =='Mission Order'){
//           //   Navigator.pushNamed(context, MissionDetailScreen.routeName,
//           //       arguments: {
//           //         // 'getListStatusTicket':(v){},
//           //         'id': int.tryParse(notification.id),
//           //         'formType': notification.type,
//           //         'statusApprove': "Approve",
//           //         'status': true,
//           //         'countNo': countNotifications,
//           //         'onTapGetDataStaffApprove':(v) {}
//           //       }
//           //   );
//           // }
//           // else if(notification.type =='Mission Report'){
//           //   Navigator.pushNamed(context, MissionReportDetailScreen.routeName,
//           //       arguments: {
//           //         // 'getListStatusTicket':(v){},
//           //         'id': int.tryParse(notification.id),
//           //         'formType': notification.type,
//           //         'statusApprove': "Approve",
//           //         'status': true,
//           //         'countNo': countNotifications,
//           //         'onTapGetDataStaffApprove':(v) {}
//           //       }
//           //   );
//           // }
//           // else if(notification.type =='Employment Certificate' && onTapNotification){
//           //   Navigator.pushNamed(context, FromJobCertificateDetailScreen.routeName,
//           //       arguments: {
//           //         // 'getListStatusTicket':(v){},
//           //         'id': int.tryParse(notification.id),
//           //         'formType': notification.type,
//           //         'statusApprove': "Approve",
//           //         'status': true,
//           //         'countNo': countNotifications,
//           //         'onTapGetDataStaffApprove':(v) {}
//           //       }
//           //   );
//           // }
//           showOverlayNotification((context) {
//             return Card(
//               margin:  EdgeInsets.symmetric(horizontal: 10.px,vertical: 30.px),
//               color: Colors.white,
//               child: InkWell(
//                 onTap: (){
//                   OverlaySupportEntry.of(context)!.dismiss();
//
//                   if (notification.title == 'Ticket'){
//                     Navigator.pushNamed(context, HomeScreen.routeName,
//                         arguments: {
//                           'getListStatusTicket':(v){},
//                           // 'id': int.tryParse(_notificationInfo!.id),
//                           'id': int.tryParse(notification!.id),
//                           'idCheckStatusNotification':int.tryParse(notification.notificationId.toString()),
//                           'getListStatusTicket':(v){},
//                           // 'id': int.tryParse(idNotification),
//                           'status': true,
//                           'countNo': countNotifications,
//                           'statusNotification': 'fromListNotification',
//                           // 'statusNotification': 'Main Thom',
//                         }
//                     );
//                   }
//                   else if(notification.title =='Leave Application Form'){
//                     Navigator.pushNamed(context, HomeScreen.routeName,
//                         arguments: {
//                           // 'getListStatusTicket':(v){},
//                           'id': int.tryParse(notification.id),
//                           'idCheckStatusNotification':int.tryParse(notification.notificationId.toString()),
//                           // 'formType': notification.type,
//                           'formType': '',
//                           'statusApprove': "Approve",
//                           'status': true,
//                           'countNo': countNotifications,
//                           'onTapGetDataStaffApprove':(v) {},
//                           'statusNotification': 'fromListNotification',
//                           'getListNotification': () {
//                             // print("Hello uuuuu");
//                           },
//                         }
//                     );
//                   }
//                 },
//                 child: ListTile(
//                   leading: SizedBox.fromSize(
//                       size: const Size(40, 40),
//                       child: ClipOval(
//                           child: Container(
//                             color: Colors.blue,
//                             child: Icon(Icons.notifications_active,color: Colors.white,size: 20.px,),
//                           ))),
//                   title: Text(_notificationInfo!.title!),
//                   subtitle: Text(_notificationInfo!.body!),
//                 ),
//               ),
//             );
//           },
//               duration: const Duration(seconds: 5),
//               position: NotificationPosition.top
//           );
//         }
//       });
//     } else {
//       // print('User declined or has not accepted permission');
//     }
//     // open App Push Notification
//   }
//
//   checkForInitialMessage() async {
//     await Firebase.initializeApp();
//     RemoteMessage? initialMessage =
//     await FirebaseMessaging.instance.getInitialMessage();
//     if (initialMessage != null) {
//       PushNotification notification = PushNotification(
//           title: initialMessage.notification?.title,
//           body: initialMessage.notification?.body,
//           dataTitle: initialMessage.data['title'],
//           dataBody: initialMessage.data['body'],
//           id: initialMessage.data["id"],
//           type: initialMessage.data["type"]??"",
//           notificationId: initialMessage.data["notificationId"]
//       );
//       // print("nnnnnnnnnnnnnnnnnnnnnnnn------2 ${jsonEncode(notification.type)}");
//       // print("nnnnnnnnnnnnnnnnnnnnnnnn------2 ${jsonEncode(initialMessage.data)}");
//       // print("nnnnnnnnnnnnnnnnnnnnnnnn------2 ${jsonEncode(initialMessage.notification!.title)}");
//       // print("nnnnnnnnnnnnnnnnnnnnnnnn------2 ${jsonEncode(initialMessage.notification!.body)}");
//       setState(() {
//         if( notificationTypeGlobal != null ) notificationTypeGlobal=null;
//         _notificationInfo = notification;
//         onTapNotification = true ;
//         idNotification = notification.id;
//         // notificationType = notification.type!;
//         notificationType = notification.title!;
//         notificationTypeGlobal = _notificationInfo!;
//         notificationId = notification.notificationId!;
//       });
//       // BlocProvider.of<NotificationCubit>(context).onNotificationChange(onTapNotification);
//     }
//   }
//   // close and clear app Push Notification (continue in Splash Screen)
//
//   @override
//   void initState() {
//     registerNotification();
//     checkForInitialMessage();
//     FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
//       PushNotification notification = PushNotification(
//         title: message.notification?.title,
//         body: message.notification?.body,
//         dataTitle: message.data['title'],
//         dataBody: message.data['body'],
//       );
//       // log("Test----${notification.body}");
//     });
//     super.initState();
//   }
//
//   addToGroup(context) {
//     return showDialog(
//         barrierDismissible: true,
//         context: context,
//         builder: (BuildContext context) {
//           bool checkBox = false;
//           return StatefulBuilder(
//             builder: (context, setState) {
//               return Dialog(
//                 child: Container(
//                   height: 250.px,
//                   width: 30,
//                   padding: EdgeInsets.all(15.px),
//                   decoration: BoxDecoration(
//                     color: Colors.red,
//                     borderRadius: BorderRadius.circular(30),
//                   ),
//                   child: Column(
//                     children: [
//                       Text("Add to group"),
//                       Container(
//                         height: 150,
//                         // color: Colors.pink,
//                         child: ListView.builder(
//                             itemCount: 5,
//                             padding: EdgeInsets.zero,
//                             shrinkWrap: true,
//                             physics: const ScrollPhysics(),
//                             itemBuilder: (context, index) {
//                               return Container(
//                                 height: 30,
//                                 child: InkWell(
//                                   onTap: (){
//                                     setState(() {
//                                       checkBox = true;
//                                     });
//                                     print("testggg==================${checkBox}");
//                                   },
//                                   child: ListTile(
//                                     leading: checkBox == true?
//                                     Icon(Icons.check_box, color: Colors.green,):
//                                     Icon(Icons.check_box_outline_blank, color: Colors.red,),
//                                     title: Text("Developer Mobile"),
//                                     trailing: Text(""),
//                                   ),
//                                 ),
//                               );
//                             }
//
//                         ),
//                       ),
//                       SizedBox(height: 20,),
//                       Align(
//                         alignment: FractionalOffset.centerRight,
//                         child: InkWell(
//                           onTap: (){
//
//                             Navigator.pop(context);
//                           },
//                           child: Container(
//                               height: 30,
//                               width: 70,
//                               decoration: BoxDecoration(
//                                   color: Colors.blue,
//                                   borderRadius: BorderRadius.circular(10)
//                               ),
//                               child: Center(child: Text("Add"))
//                           ),
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//                 // child: InkWell(
//                 //   onTap: () {
//                 //     setState(() {
//                 //       contentText = true ;
//                 //     });
//                 //   },
//                 //   child: Text("Change",
//                 //     style: TextStyle(
//                 //         color: contentText?
//                 //         Colors.green:
//                 //         Colors.red
//                 //     ),),
//                 // ),
//               );
//             },
//           );
//         });
//   }
//
//   void showNow() {
//     showGeneralDialog(
//       context: context,
//       pageBuilder: (BuildContext buildContext, Animation<double> animation, Animation<double> secondaryAnimation) {
//         return Container(
//           width: 200.0,
//           height: 200.0,
//           color: Colors.orange,
//         );
//       },
//       barrierDismissible: true,
//       barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
//       barrierColor: Colors.black,
//       transitionDuration: const Duration(milliseconds: 200),
//     );
//   }
//
//   late Timer _timer;
//   int _start = 10;
//
//   void startTimer() {
//     const oneSec = const Duration(seconds: 5);
//     _timer = new Timer.periodic(
//       oneSec,
//           (Timer timer) {
//         if (_start == 0) {
//           setState(() {
//             timer.cancel();
//           });
//
//           showGeneralDialog(
//             context: keyContext.currentState!.context,
//             pageBuilder: (BuildContext buildContext, Animation<double> animation, Animation<double> secondaryAnimation) {
//               return Container(
//                 width: 200.0,
//                 height: 200.0,
//                 color: Colors.orange,
//               );
//             },
//             barrierDismissible: true,
//             barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
//             barrierColor: Colors.black,
//             transitionDuration: const Duration(milliseconds: 200),
//           );
//
//           // showGeneralDialog(
//           //   context: keyContext.currentState!.context,
//           //   // context: context,
//           //   barrierColor: Colors.black12.withOpacity(0.6), // Background color
//           //   barrierDismissible: false,
//           //   barrierLabel: 'Dialog',
//           //   transitionDuration: Duration(milliseconds: 400),
//           //   pageBuilder: (context, __, ___) {
//           //     return WillPopScope(
//           //       onWillPop: () async {
//           //         // your logic
//           //         return false;
//           //       },
//           //       child: Container(
//           //         color: Colors.red,
//           //         child: Column(
//           //           children: <Widget>[
//           //             Expanded(
//           //               flex: 5,
//           //               child: SizedBox.expand(child: FlutterLogo()),
//           //             ),
//           //             Expanded(
//           //               flex: 1,
//           //               child: SizedBox.expand(
//           //                 child: ElevatedButton(
//           //                   onPressed: () => Navigator.pop(context),
//           //                   child: Text('Dismiss'),
//           //                 ),
//           //               ),
//           //             ),
//           //           ],
//           //         ),
//           //       ),
//           //     );
//           //   },
//           // );
//         }
//         else {
//           setState(() {
//             log("message=====> $_start");
//             _start--;
//           });
//         }
//       },
//     );
//   }
//
//   @override
//   void dispose() {
//     _timer.cancel();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//
//     return OverlaySupport(
//       child: ResponsiveSizer(
//         builder: (context, orientation, screenType) {
//           return Listener(
//             // onPointerDown: (PointerDownEvent event) {
//             //     log("message-----PointerDownEvent: $event");
//             //     _start = 10;
//             //     startTimer();
//             // },
//             child: GetMaterialApp(
//               title: 'Luna',
//               debugShowCheckedModeBanner: false,
//               locale: currectLang,
//               translations: Language(),
//               fallbackLocale: const Locale('en', 'US'),
//               // initialBinding: GetXNetworkManagerBinding(),
//               theme: ThemeData(
//                 fontFamily: 'Battambang-Regular',
//                 appBarTheme:  AppBarTheme(
//                     systemOverlayStyle: SystemUiOverlayStyle.dark,
//                     color: Colors.red
//                 ),
//               ),
//               initialBinding: GetXNetworkManagerBinding(),
//               navigatorKey: GlobalUse.navigatorKey,
//               initialRoute: SplashScreen.routeName,
//               routes: routes,
//               // home: const ExampleScreen(),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
//
// subscribeT() async {
//   // print('---------------------');
//   FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
//   await FirebaseMessaging.instance.subscribeToTopic('TopicToCustomerStaging');
//
//   FirebaseMessaging.onMessageOpenedApp.listen((event) {
//     // print("KJJKJJKJKJKJKJJKJK LISTEN MESSAGE}");
//   });
//
//   // print('---------------------');
// }
//
// Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   await Firebase.initializeApp();
//   // print('A bg message just showed up :  ${message.messageId}');
// }
// class PushNotification {
//   PushNotification({this.title, this.body, this.dataTitle, this.dataBody, this.id, this.type, this.notificationId, this.chatId, this.userName, this.message, this.chatType, this.typeChat, this.chatGroupId, this.userMember, this.image, this.file, this.duration});
//   String? title;
//   String? body;
//   String? dataTitle;
//   String? dataBody;
//   String? type;
//   String? notificationId;
//
//   dynamic chatId;
//   dynamic chatGroupId;
//   dynamic userMember;
//   String? image;
//   String? userName;
//   String? message;
//   String? chatType;
//   String? typeChat;
//   String? file;
//   // Timer? duration;
//   String? duration;
//   dynamic id;
// }









/// New Main Notification




// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         // This is the theme of your application.
//         //
//         // TRY THIS: Try running your application with "flutter run". You'll see
//         // the application has a purple toolbar. Then, without quitting the app,
//         // try changing the seedColor in the colorScheme below to Colors.green
//         // and then invoke "hot reload" (save your changes or press the "hot
//         // reload" button in a Flutter-supported IDE, or press "r" if you used
//         // the command line to start the app).
//         //
//         // Notice that the counter didn't reset back to zero; the application
//         // state is not lost during the reload. To reset the state, use hot
//         // restart instead.
//         //
//         // This works for code too, not just values: Most code changes can be
//         // tested with just a hot reload.
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       home: const MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});
//
//   // This widget is the home page of your application. It is stateful, meaning
//   // that it has a State object (defined below) that contains fields that affect
//   // how it looks.
//
//   // This class is the configuration for the state. It holds the values (in this
//   // case the title) provided by the parent (in this case the App widget) and
//   // used by the build method of the State. Fields in a Widget subclass are
//   // always marked "final".
//
//   final String title;
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;
//
//   void _incrementCounter() {
//     setState(() {
//       // This call to setState tells the Flutter framework that something has
//       // changed in this State, which causes it to rerun the build method below
//       // so that the display can reflect the updated values. If we changed
//       // _counter without calling setState(), then the build method would not be
//       // called again, and so nothing would appear to happen.
//       _counter++;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     // This method is rerun every time setState is called, for instance as done
//     // by the _incrementCounter method above.
//     //
//     // The Flutter framework has been optimized to make rerunning build methods
//     // fast, so that you can just rebuild anything that needs updating rather
//     // than having to individually change instances of widgets.
//     return Scaffold(
//       appBar: AppBar(
//         // TRY THIS: Try changing the color here to a specific color (to
//         // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
//         // change color while the other colors stay the same.
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//         // Here we take the value from the MyHomePage object that was created by
//         // the App.build method, and use it to set our appbar title.
//         title: Text(widget.title),
//       ),
//       body: Center(
//         // Center is a layout widget. It takes a single child and positions it
//         // in the middle of the parent.
//         child: Column(
//           // Column is also a layout widget. It takes a list of children and
//           // arranges them vertically. By default, it sizes itself to fit its
//           // children horizontally, and tries to be as tall as its parent.
//           //
//           // Column has various properties to control how it sizes itself and
//           // how it positions its children. Here we use mainAxisAlignment to
//           // center the children vertically; the main axis here is the vertical
//           // axis because Columns are vertical (the cross axis would be
//           // horizontal).
//           //
//           // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
//           // action in the IDE, or press "p" in the console), to see the
//           // wireframe for each widget.
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headlineMedium,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }

import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:all_in_one/routes/routes.dart';
import 'package:all_in_one/utils/global_use.dart';
import 'package:all_in_one/utils/shared_preferences_service.dart';
import 'package:all_in_one/views/screens/home_screen/home_screen.dart';
import 'package:all_in_one/views/screens/splash_screen/splash_screen.dart';
import 'package:all_in_one/views/widgets/internet_connection_screen/getx_network_manager_binding.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'configs/config_reader.dart';
import 'configs/environment.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:overlay_support/overlay_support.dart';

import 'languages/language.dart';


class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}
late FirebaseMessaging messaging;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
        apiKey: "AIzaSyBNNA0yrikxnrAF4fyqHMZHMMP_M822Ki0",
        appId: "1:634090600777:android:75cb2ce5019896635b8298",
        messagingSenderId: "634090600777",
        projectId: "all-in-one-eee8d"
    ),
  );

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await SharedPreferencesService.init();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
    statusBarColor: Colors.transparent,
  ));

  HttpOverrides.global = MyHttpOverrides();
  messaging = FirebaseMessaging.instance;
  messaging.getToken().then((value) {
    idTokenFirebase = value.toString();
    log("ContentContent $idTokenFirebase \n\n\n\n");
  });
  // subscribeT();
  await ConfigReader.initialize(Environment.SIT);
  runApp(const MyApp());


}

var localStore = GetStorage();
Locale currectLang = const Locale('en', 'US');

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}



class _MyAppState extends State<MyApp> {
  late final FirebaseMessaging _messaging;
  PushNotification? _notificationInfo;


  registerNotification() async {
    await Firebase.initializeApp();
    _messaging = FirebaseMessaging.instance;

    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
    NotificationSettings settings = await _messaging.requestPermission(
      alert: true,
      badge: true,
      provisional: true,
      sound: true,
    );
    // open App Push Notification (សម្រាប់ពេលចុច Poin ទៅលើ Notification alert តែម្ដង)
    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      FirebaseMessaging.onMessage.listen((RemoteMessage message) {
        log('========================== Hello');
        log("KJJKJKKJJK${jsonEncode(message.notification)}");
        // Parse the message received

        PushNotification notification = PushNotification(
            title: message.notification?.title,
            body: message.notification?.body,
            dataTitle: message.data['title'],
            dataBody: message.data['body'],
            id: message.data["id"],
            type :message.data["type"],
            notificationId: message.data["notificationId"]
        );
        print("nnnnnnnnnnnnnnnnnnnnnnnn------1 type ${notification.type}");
        print("nnnnnnnnnnnnnnnnnnnnnnnn------1 id ${notification.notificationId}");
        print("nnnnnnnnnnnnnnnnnnnnnnnn------1 Data ${jsonEncode(message.data)}");
        print("nnnnnnnnnnnnnnnnnnnnnnnn------1 Title${jsonEncode(message.notification!.title)}");
        print("nnnnnnnnnnnnnnnnnnnnnnnn------1 Body${jsonEncode(message.notification!.body)}");

        setState(() {
          if( notificationTypeGlobal != null ) notificationTypeGlobal=null;
          _notificationInfo = notification;
          idNotification = notification.id??'';
          countNotifications++;
          isPushNotification = true;
          onTapNotification = true;
          notificationTypeGlobal = _notificationInfo;
        });

        if (_notificationInfo != null) {
          Container();
          // print('test zsak merl===========2222 ');
          // _showNotification();
          // if (notification.type == 'Ticket'){
          //   print('test1');
          //   Navigator.pushNamed(context, TicketDetailScreen.routeName,
          //       arguments: {
          //         'getListStatusTicket':(v){},
          //         'id': int.tryParse(_notificationInfo!.id),
          //         'status': true,
          //         'countNo': countNotifications
          //       }
          //   );
          // }
          // else if(notification.type =='Leave Application Form'){
          //   Navigator.pushNamed(context, LeaveApplicationDetailScreen.routeName,
          //       arguments: {
          //         // 'getListStatusTicket':(v){},
          //         'id': int.tryParse(_notificationInfo!.id),
          //         'formType': notification.type,
          //         'statusApprove': "Approve",
          //         'status': true,
          //         'countNo': countNotifications,
          //         'onTapGetDataStaffApprove':(v) {}
          //       }
          //   );
          // }
          // else if(notification.type =='Work On-Site'){
          //   Navigator.pushNamed(context, WorkOnSiteDetailScreen.routeName,
          //       arguments: {
          //         // 'getListStatusTicket':(v){},
          //         'id': int.tryParse(_notificationInfo!.id),
          //         'formType': notification.type,
          //         'statusApprove': "Approve",
          //         'status': true,
          //         'countNo': countNotifications,
          //         'onTapGetDataStaffApprove':(v) {}
          //       }
          //   );
          // }
          // else if(notification.type =='Mission Request'){
          //   Navigator.pushNamed(context, RequestMissionDetailScreen.routeName,
          //       arguments: {
          //         // 'getListStatusTicket':(v){},
          //         'id': int.tryParse(notification.id),
          //         'formType': notification.type,
          //         'statusApprove': "Approve",
          //         'status': true,
          //         'countNo': countNotifications,
          //         'onTapGetDataStaffApprove':(v) {}
          //       }
          //   );
          // }
          // else if(notification.type =='Vehicle Usage'){
          //   Navigator.pushNamed(context, VehicleUseRequestDetailScreen.routeName,
          //       arguments: {
          //         // 'getListStatusTicket':(v){},
          //         'id': int.tryParse(notification.id),
          //         'formType': notification.type,
          //         'statusApprove': "Approve",
          //         'status': true,
          //         'countNo': countNotifications,
          //         'onTapGetDataStaffApprove':(v) {}
          //       }
          //   );
          // }
          // else if(notification.type =='Request Form'){
          //   Navigator.pushNamed(context, RequestFormDetailScreen.routeName,
          //       arguments: {
          //         // 'getListStatusTicket':(v){},
          //         'id': int.tryParse(notification.id),
          //         'formType': notification.type,
          //         'statusApprove': "Approve",
          //         'status': true,
          //         'countNo': countNotifications,
          //         'onTapGetDataStaffApprove':(v) {}
          //       }
          //   );
          // }
          // else if(notification.type =='Overtime Form'){
          //   Navigator.pushNamed(context, OverTimeDetailScreen.routeName,
          //       arguments: {
          //         // 'getListStatusTicket':(v){},
          //         'id': int.tryParse(notification.id),
          //         'formType': notification.type,
          //         'statusApprove': "Approve",
          //         'status': true,
          //         'countNo': countNotifications,
          //         'onTapGetDataStaffApprove':(v) {}
          //       }
          //   );
          // }
          // else if(notification.type =='Use Electronic Usage'){
          //   Navigator.pushNamed(context, RequestUseApplicationDetailScreen.routeName,
          //       arguments: {
          //         // 'getListStatusTicket':(v){},
          //         'id': int.tryParse(notification.id),
          //         'formType': notification.type,
          //         'statusApprove': "Approve",
          //         'status': true,
          //         'countNo': countNotifications,
          //         'onTapGetDataStaffApprove':(v) {}
          //       }
          //   );
          // }
          // else if(notification.type =='Mission Order'){
          //   Navigator.pushNamed(context, MissionDetailScreen.routeName,
          //       arguments: {
          //         // 'getListStatusTicket':(v){},
          //         'id': int.tryParse(notification.id),
          //         'formType': notification.type,
          //         'statusApprove': "Approve",
          //         'status': true,
          //         'countNo': countNotifications,
          //         'onTapGetDataStaffApprove':(v) {}
          //       }
          //   );
          // }
          // else if(notification.type =='Mission Report'){
          //   Navigator.pushNamed(context, MissionReportDetailScreen.routeName,
          //       arguments: {
          //         // 'getListStatusTicket':(v){},
          //         'id': int.tryParse(notification.id),
          //         'formType': notification.type,
          //         'statusApprove': "Approve",
          //         'status': true,
          //         'countNo': countNotifications,
          //         'onTapGetDataStaffApprove':(v) {}
          //       }
          //   );
          // }
          // else if(notification.type =='Employment Certificate' && onTapNotification){
          //   Navigator.pushNamed(context, FromJobCertificateDetailScreen.routeName,
          //       arguments: {
          //         // 'getListStatusTicket':(v){},
          //         'id': int.tryParse(notification.id),
          //         'formType': notification.type,
          //         'statusApprove': "Approve",
          //         'status': true,
          //         'countNo': countNotifications,
          //         'onTapGetDataStaffApprove':(v) {}
          //       }
          //   );
          // }
          showOverlayNotification((context) {
            return Card(
              margin:  EdgeInsets.symmetric(horizontal: 10.px,vertical: 30.px),
              color: Colors.white,
              child: InkWell(
                onTap: (){
                  OverlaySupportEntry.of(context)!.dismiss();

                  if (notification.title == 'Ticket'){
                    Navigator.pushNamed(context, HomeScreen.routeName,
                        arguments: {
                          'getListStatusTicket':(v){},
                          // 'id': int.tryParse(_notificationInfo!.id),
                          'id': int.tryParse(notification!.id),
                          'idCheckStatusNotification':int.tryParse(notification.notificationId.toString()),
                          'getListStatusTicket':(v){},
                          // 'id': int.tryParse(idNotification),
                          'status': true,
                          'countNo': countNotifications,
                          'statusNotification': 'fromListNotification',
                          // 'statusNotification': 'Main Thom',
                        }
                    );
                  }
                  else if(notification.title =='Leave Application Form'){
                    Navigator.pushNamed(context, HomeScreen.routeName,
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
                },
                child: ListTile(
                  leading: SizedBox.fromSize(
                      size: const Size(40, 40),
                      child: ClipOval(
                          child: Container(
                            color: Colors.blue,
                            child: Icon(Icons.notifications_active,color: Colors.white,size: 20.px,),
                          ))),
                  title: Text(_notificationInfo!.title!),
                  subtitle: Text(_notificationInfo!.body!),
                ),
              ),
            );
          },
              duration: const Duration(seconds: 5),
              position: NotificationPosition.top
          );
        }
      });
    } else {
      // print('User declined or has not accepted permission');
    }
    // open App Push Notification
  }

  checkForInitialMessage() async {
    await Firebase.initializeApp();
    RemoteMessage? initialMessage =
    await FirebaseMessaging.instance.getInitialMessage();
    if (initialMessage != null) {
      PushNotification notification = PushNotification(
          title: initialMessage.notification?.title,
          body: initialMessage.notification?.body,
          dataTitle: initialMessage.data['title'],
          dataBody: initialMessage.data['body'],
          id: initialMessage.data["id"],
          type: initialMessage.data["type"]??"",
          notificationId: initialMessage.data["notificationId"]
      );
      // print("nnnnnnnnnnnnnnnnnnnnnnnn------2 ${jsonEncode(notification.type)}");
      // print("nnnnnnnnnnnnnnnnnnnnnnnn------2 ${jsonEncode(initialMessage.data)}");
      // print("nnnnnnnnnnnnnnnnnnnnnnnn------2 ${jsonEncode(initialMessage.notification!.title)}");
      // print("nnnnnnnnnnnnnnnnnnnnnnnn------2 ${jsonEncode(initialMessage.notification!.body)}");
      setState(() {
        if( notificationTypeGlobal != null ) notificationTypeGlobal=null;
        _notificationInfo = notification;
        onTapNotification = true ;
        idNotification = notification.id;
        // notificationType = notification.type!;
        notificationType = notification.title!;
        notificationTypeGlobal = _notificationInfo!;
        notificationId = notification.notificationId!;
      });
      // BlocProvider.of<NotificationCubit>(context).onNotificationChange(onTapNotification);
    }
  }
  // close and clear app Push Notification (continue in Splash Screen)

  @override
  void initState() {
    registerNotification();
    checkForInitialMessage();
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      PushNotification notification = PushNotification(
        title: message.notification?.title,
        body: message.notification?.body,
        dataTitle: message.data['title'],
        dataBody: message.data['body'],
      );
      // log("Test----${notification.body}");
    });
    super.initState();
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

                            Navigator.pop(context);
                          },
                          child: Container(
                              height: 30,
                              width: 70,
                              decoration: BoxDecoration(
                                  color: Colors.blue,
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

  void showNow() {
    showGeneralDialog(
      context: context,
      pageBuilder: (BuildContext buildContext, Animation<double> animation, Animation<double> secondaryAnimation) {
        return Container(
          width: 200.0,
          height: 200.0,
          color: Colors.orange,
        );
      },
      barrierDismissible: true,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      barrierColor: Colors.black,
      transitionDuration: const Duration(milliseconds: 200),
    );
  }

  late Timer _timer;
  int _start = 10;

  void startTimer() {
    const oneSec = const Duration(seconds: 5);
    _timer = new Timer.periodic(
      oneSec,
          (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
          });
          showGeneralDialog(
            context: keyContext.currentState!.context,
            pageBuilder: (BuildContext buildContext, Animation<double> animation, Animation<double> secondaryAnimation) {
              return Container(
                width: 200.0,
                height: 200.0,
                color: Colors.orange,
              );
            },
            barrierDismissible: true,
            barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
            barrierColor: Colors.black,
            transitionDuration: const Duration(milliseconds: 200),
          );

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

    return OverlaySupport(
      child: ResponsiveSizer(
        builder: (context, orientation, screenType) {
          return Listener(
            // onPointerDown: (PointerDownEvent event) {
            //     log("message-----PointerDownEvent: $event");
            //     _start = 10;
            //     startTimer();
            // },
            child: GetMaterialApp(
              title: 'Luna',
              debugShowCheckedModeBanner: false,
              locale: currectLang,
              translations: Language(),
              fallbackLocale: const Locale('en', 'US'),
              // initialBinding: GetXNetworkManagerBinding(),
              theme: ThemeData(
                fontFamily: 'Battambang-Regular',
                appBarTheme:  AppBarTheme(
                    systemOverlayStyle: SystemUiOverlayStyle.dark,
                    color: Colors.red
                ),
              ),
              initialBinding: GetXNetworkManagerBinding(),
              navigatorKey: GlobalUse.navigatorKey,
              initialRoute: SplashScreen.routeName,
              routes: routes,
              // home: const ExampleScreen(),
            ),
          );
        },
      ),
    );
  }
}

subscribeT() async {
  // print('---------------------');
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  await FirebaseMessaging.instance.subscribeToTopic('TopicToCustomerStaging');

  FirebaseMessaging.onMessageOpenedApp.listen((event) {
    // print("KJJKJJKJKJKJKJJKJK LISTEN MESSAGE}");
  });

  // print('---------------------');
}

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  // print('A bg message just showed up :  ${message.messageId}');
}
class PushNotification {
  PushNotification({this.title, this.body, this.dataTitle, this.dataBody, this.id, this.type, this.notificationId, this.chatId, this.userName, this.message, this.chatType, this.typeChat, this.chatGroupId, this.userMember, this.image, this.file, this.duration});
  String? title;
  String? body;
  String? dataTitle;
  String? dataBody;
  String? type;
  String? notificationId;

  dynamic chatId;
  dynamic chatGroupId;
  dynamic userMember;
  String? image;
  String? userName;
  String? message;
  String? chatType;
  String? typeChat;
  String? file;
  // Timer? duration;
  String? duration;
  dynamic id;
}