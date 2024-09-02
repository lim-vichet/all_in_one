import 'dart:async';
import 'dart:developer';

import 'package:floating_bottom_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../utils/constants/app_colors.dart';
import '../../../utils/constants/app_font_styles.dart';
import '../../../utils/constants/app_images.dart';
import '../../widgets/banner_slider.dart';
import '../notification/notification_screen/notification_screen.dart';


final GlobalKey <ScaffoldState> keyContext = GlobalKey();

class HomeScreen extends StatefulWidget {
  static const String routeName = "HomeScreen";
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  var listBanner = [
    {
      "id":1,
      "image":""
    },
    {
      "id":2,
      "image":""
    },
    {
      "id":3,
      "image":""
    }
  ];

  bool circleButtonToggle = false;
  List<Color> listOfColor = [
    const Color(0xFFF2B5BA),
    Colors.orange,
    Colors.amber,
    Colors.deepOrangeAccent
  ];
  int index = 2;


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
                            Navigator.pushNamedAndRemoveUntil(context, HomeScreen.routeName, (route) => false);
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
          // showGeneralDialog(
          //   context: keyContext.currentState!.context,
          //   // context: context,
          //   barrierColor: Colors.black12.withOpacity(0.6), // Background color
          //   barrierDismissible: false,
          //   barrierLabel: 'Dialog',
          //   transitionDuration: Duration(milliseconds: 400),
          //   pageBuilder: (context, __, ___) {
          //     return WillPopScope(
          //       onWillPop: () async {
          //         // your logic
          //         return false;
          //       },
          //       child: Container(
          //         color: Colors.red,
          //         child: Column(
          //           children: <Widget>[
          //             Expanded(
          //               flex: 5,
          //               child: SizedBox.expand(child: FlutterLogo()),
          //             ),
          //             Expanded(
          //               flex: 1,
          //               child: SizedBox.expand(
          //                 child: ElevatedButton(
          //                   onPressed: () => Navigator.pop(context),
          //                   child: Text('Dismiss'),
          //                 ),
          //               ),
          //             ),
          //           ],
          //         ),
          //       ),
          //     );
          //   },
          // );
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
      // onPointerDown: (PointerDownEvent event) {
      //   log("message-----PointerDownEvent: $event");
      //   _start = 10;
      //   startTimer();
      // },
      child: Scaffold(
        backgroundColor: Colors.green,
        appBar: AppBar(
          elevation: 0,
          title: Container(
            // color: Colors.yellow,
            width: double.infinity,
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    margin: EdgeInsets.only(left: 5.px),
                    // color: Colors.pink,
                    height: 40,
                    child: Center(
                      child: Image.asset(AppImages.logo, color: Colors.white,)
                    ),
                  ),
                ),
                Expanded(
                  flex:8,
                  child: Container(
                    margin: EdgeInsets.only(left: 22.px,right: 18.px),
                    padding: EdgeInsets.symmetric(horizontal: 12.px,vertical: 8.px),

                    decoration: BoxDecoration(
                        border: Border.all(width: .2,color: Colors.grey),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8)
                    ),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Search...",style: AppTextStyle().textS(color: Colors.grey),),
                          Icon(Icons.search,size: 20,color: Colors.grey,)
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    margin: EdgeInsets.only(right: 5.px),
                    // color: Colors.blue,

                    child: GestureDetector(
                      onTap: (){
                        Navigator.pushNamed(context, NotificationScreen.routeName);
                      },
                      child: Center(
                        child: Icon(Icons.notifications_none_outlined,size: 30,color: Colors.white,),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Column(
              children: [
                Stack(
                  children: [
                    Column(
                      children: [
                        Container(
                          height: 90,
                          color: Colors.red,
                        ),
                        Container(
                          height: 110,
                          color: Colors.white,
                        ),
                      ],
                    ),
                    Positioned(
                        top: 15,
                        right: 0,
                        left: 0,
                        child: BannerSlider(listBanner: listBanner,)

                    ),
                  ],
                ),


                Container(
                  color: Colors.white,
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 18.px),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Categories",style: AppTextStyle().textS(),),
                            Text("See all",style: AppTextStyle().textS(),),

                          ],
                        ),
                      ),
                      Container(
                        height: 200,

                        margin: EdgeInsets.symmetric(horizontal: 18.px,vertical: 18.px),
                        padding: EdgeInsets.symmetric(vertical: 20.px),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(color: Colors.grey.withOpacity(.2),blurRadius: 5,spreadRadius: 1)
                          ]
                        ),
                        child: GridView.count(
                            crossAxisCount: 3,
                          childAspectRatio:1.30,

                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          children: List.generate(6, (index) => _buildCategoryItem()),
                        ),

                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 18.px),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Promotions",style: AppTextStyle().textS(),),
                            Text("See all",style: AppTextStyle().textS(),),

                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 20.px,bottom: 20.px),
                        height: MediaQuery.of(context).size.width/2.2.px,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 7,
                          padding: EdgeInsets.symmetric(horizontal: 20.px),
                          physics: const ScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context,index){
                            return _buildPromotionItem();
                          },
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 18.px),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Shops",style: AppTextStyle().textS(),),
                            Text("See all",style: AppTextStyle().textS(),),

                          ],
                        ),
                      ),
                      Container(
                        height: 280,

                        margin: EdgeInsets.symmetric(horizontal: 5.px,vertical: 1.px),
                        padding: EdgeInsets.symmetric(vertical: 20.px),

                        child: GridView.count(
                          crossAxisCount: 3,
                          childAspectRatio:1.10,


                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          children: List.generate(6, (index) => _buildShopItem()),
                        ),

                      ),

                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );

  }
  _buildCategoryItem(){
    return Column(
      children: const [
        Icon(Icons.local_printshop_outlined,size: 40,),
        Text("Food")
      ],
    );
  }
  _buildShopItem(){
    return Column(
      children:  [
        Container(
            margin: EdgeInsets.all(10.px),
            padding: EdgeInsets.symmetric(horizontal: 25,vertical: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.red,
                boxShadow: [
                  BoxShadow(color: Colors.red.withOpacity(.2),blurRadius: 5,spreadRadius: 1)
                ]
            ),
            child: Icon(Icons.local_printshop_outlined,size: 40,)),
        Text("Shop")
      ],
    );
  }

  _buildPromotionItem(){
    return Container(
      margin: EdgeInsets.only(right: 15.px),
      height: 30,
      width: MediaQuery.of(context).size.width/1.3,
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(8)
      ),

    );
  }
}
