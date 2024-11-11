import 'dart:async';
import 'dart:developer';

import 'package:floating_bottom_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

// import '../../../utils/constants/app_colors.dart';
import '../../../utils/constants/app_font_styles.dart';
import '../../../utils/constants/app_images.dart';
import '../../widgets/banner_slider.dart';
import '../drawer_screen/drawer_item/drawer_item.dart';
import '../main_screen/main_screen.dart';
import '../notification/notification_screen/notification_screen.dart';



final GlobalKey <ScaffoldState> keyContext = GlobalKey();

class HomeScreen extends StatefulWidget {
  static const String routeName = "HomeScreen";
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  final Map<int, String> listShop = {1:'Khmer', 2: 'Asian', 3: 'Korean', 4: 'Japan', 5: 'FastFood', 6: 'Thai'};

  List<Map<String, dynamic>> users = [
    {'name': 'John', 'age': 30},
    {'name': 'Alice', 'age': 25},
    {'name': 'Bob', 'age': 35}
  ];
  List<String> listPromotion = [
    "https://static.vecteezy.com/system/resources/thumbnails/036/804/355/small/ai-generated-assorted-indian-food-on-dark-wooden-background-free-photo.jpg",
    "https://marketplace.canva.com/EAFqj6plqhY/1/0/1600w/canva-cream-retro-fresh-delicious-menu-banner-landscape-30JXYs045So.jpg",
    "https://www.shutterstock.com/image-vector/banner-template-burger-restaurant-260nw-1708635589.jpg",
    "https://fiverr-res.cloudinary.com/images/t_main1,q_auto,f_auto,q_auto,f_auto/gigs/359597152/original/714951ac39e1251552fa8ba233d55f7d3c3a1341/design-food-drink-product-banner-and-restaurant-banners.png",
    "https://cdn3.f-cdn.com//files/download/169583946/restaurent%20banner%201-01.jpg?width=780&height=296&fit=crop",
  ];
  List<String> listBanner = [
    "https://static.vecteezy.com/system/resources/thumbnails/036/804/355/small/ai-generated-assorted-indian-food-on-dark-wooden-background-free-photo.jpg",
    "https://marketplace.canva.com/EAFqj6plqhY/1/0/1600w/canva-cream-retro-fresh-delicious-menu-banner-landscape-30JXYs045So.jpg",
    "https://www.shutterstock.com/image-vector/banner-template-burger-restaurant-260nw-1708635589.jpg",
    "https://fiverr-res.cloudinary.com/images/t_main1,q_auto,f_auto,q_auto,f_auto/gigs/359597152/original/714951ac39e1251552fa8ba233d55f7d3c3a1341/design-food-drink-product-banner-and-restaurant-banners.png",
    "https://cdn3.f-cdn.com//files/download/169583946/restaurent%20banner%201-01.jpg?width=780&height=296&fit=crop",
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
    const oneSec = Duration(minutes: 30);
    _timer = Timer.periodic(
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
        backgroundColor: Color(0xffF7F7F7),
        // drawer: DrawerItem(),
        appBar: AppBar(
          backgroundColor: Colors.lightBlueAccent,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.white),
          // automaticallyImplyLeading: false,
          leading: IconButton(
            icon: Icon(Icons.menu, color: Colors.white),
            onPressed: () {
              if(scaffoldKey.currentState!.isDrawerOpen){
                scaffoldKey.currentState!.closeDrawer();
                //close drawer, if drawer is open
              }else{
                scaffoldKey.currentState!.openDrawer();
                //open drawer, if drawer is closed
              }
            },
          ),
          title: Container(
            // color: Colors.yellow,
            width: double.infinity,
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex:8,
                  child: Container(
                    margin: EdgeInsets.only(left: 22.px,right: 18.px),
                    padding: EdgeInsets.symmetric(horizontal: 12.px,vertical: 8.px),
                    decoration: BoxDecoration(
                        border: Border.all(width: .2,color: Colors.grey),
                        color: Color(0xffF7F7F7),
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
                    margin: EdgeInsets.only(left: 5.px),
                    // color: Colors.pink,
                    height: 40,
                    child: Center(
                        child: Image.asset(AppImages.logo, color: Color(0xffF7F7F7),)
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

        body: SingleChildScrollView(
          child: Container(
            // color: Colors.pink,
            child: Column(
              children: [
                Stack(
                  children: [
                    Column(
                      children: [
                        Container(
                          height: 90,
                          color: Colors.lightBlueAccent,
                        ),
                        Container(
                          height: 110,
                          color: Color(0xffF7F7F7),
                        ),
                      ],
                    ),
                    Positioned(
                        top: 15,
                        right: 0,
                        left: 0,
                        child: BannerSlider(listBanner: listBanner[index],)

                    ),
                  ],
                ),


                Container(
                  // color: Colors.blue,
                  child: Column(
                    children: [
                      ///Categories
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 18.px),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Categories",style: AppTextStyle().textS(color: Colors.lightBlueAccent),),
                            Text("See all",style: AppTextStyle().textS(color: Colors.lightBlueAccent),),
                          ],
                        ),
                      ),


                      ///Categories
                      Container(
                        height: 200,

                        margin: EdgeInsets.symmetric(horizontal: 18.px,vertical: 18.px),
                        // padding: EdgeInsets.symmetric(vertical: 50.px),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Color(0xffF7F7F7),
                          boxShadow: [
                            BoxShadow(color: Colors.grey.withOpacity(.2),blurRadius: 5,spreadRadius: 1)
                          ]
                        ),
                        child: _buildCategoryItem(),
                      ),

                      ///Promotions
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 18.px),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Promotions",style: AppTextStyle().textS(color: Colors.lightBlueAccent),),
                            Text("See all",style: AppTextStyle().textS(color: Colors.lightBlueAccent),),

                          ],
                        ),
                      ),
                      ///Promotions
                      Container(
                        margin: EdgeInsets.only(top: 20.px,bottom: 20.px),
                        height: MediaQuery.of(context).size.width/2.4.px,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: listPromotion.length,
                          padding: EdgeInsets.symmetric(horizontal: 20.px),
                          physics: const ScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context,index){
                            return Container(
                              // margin: EdgeInsets.only(right: 15.px),
                              // height: 30,
                              // width: MediaQuery.of(context).size.width/1.3,
                              // color: Colors.green,
                              margin: EdgeInsets.only(right: 20),
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Image.network("${listPromotion[index]}")),

                            );
                          },
                        ),
                      ),
                      ///Shop
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 18.px),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Shops",style: AppTextStyle().textS(color: Colors.lightBlueAccent),),
                            Text("See all",style: AppTextStyle().textS(color: Colors.lightBlueAccent),),

                          ],
                        ),
                      ),
                      ///Shop
                      Container(
                        height: 330,

                        margin: EdgeInsets.symmetric(horizontal: 18.px,vertical: 18.px),
                        // padding: EdgeInsets.symmetric(vertical: 50.px),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Color(0xffF7F7F7),
                            boxShadow: [
                              BoxShadow(color: Colors.grey.withOpacity(.2),blurRadius: 5,spreadRadius: 1)
                            ]
                        ),
                        child: _buildShopItem()
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
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children:  [
                Container(
                  width: 70,
                  height: 50,
                  child: Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTsKNSFSoay4DeyJnNU_Pw9nYZrR7JXxMmwdeXwGT0TbqM1qr1KAgEERHa6BsiZlG-UR18&usqp=CAU"),
                ),
                Text("Burger")
              ],
            ),
            SizedBox(width: 50,),
            Column(
              children:  [
                Container(
                  width: 70,
                  height: 50,
                  child: Image.network("https://img.clipart-library.com/2/clip-food-cartoon/clip-food-cartoon-10.jpg"),
                ),
                Text("Stack")
              ],
            ),
            SizedBox(width: 50,),
            Column(
              children:  [
                Container(
                  width: 70,
                  height: 50,
                  child: Image.network("https://images.vexels.com/content/230824/preview/pink-drink-cartoon-a5a442.png"),
                ),
                Text("Drink")
              ],
            ),
          ],
        ),
        SizedBox(height: 10,),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children:  [
                Container(
                  width: 70,
                  height: 50,
                  child: Image.network("https://i.pinimg.com/originals/d8/10/e7/d810e739470e31ac8c762583bce3db99.jpg"),
                ),
                Text("Fruit")
              ],
            ),
            SizedBox(width: 50,),
            Column(
              children:  [
                Container(
                  width: 70,
                  height: 50,
                  child: Image.network("https://banner2.cleanpng.com/lnd/20240418/wlt/transparent-3d-cartoon-food-sushi-roll-raw-fish-vegetables-woo-sushi-roll-with-raw-fish-and-vegetables6620b36857f983.24885109.webp"),
                ),
                Text("Shu Si")
              ],
            ),
            SizedBox(width: 50,),
            Column(
              children:  [
                Container(
                  width: 70,
                  height: 50,
                  child: Image.network("https://banner2.cleanpng.com/lnd/20240818/k/e6285e8abc2d80334daffe72bf1446.webp"),
                ),
                Text("Donat")
              ],
            ),
          ],
        ),
      ],
    );
  }
  _buildShopItem(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children:  [
                Container(
                  width: 70,
                  height: 50,
                  child: Image.network("https://media1.thehungryjpeg.com/thumbs/800_3909546_0e7ypmde3pv2ro2252ssehtbrb4k8g6liq1teslt.jpg"),
                ),
                Text("Burger")
              ],
            ),
            SizedBox(width: 50,),
            Column(
              children:  [
                Container(
                  width: 70,
                  height: 50,
                  child: Image.network("https://img.lovepik.com/png/20231115/restaurant-clipart-cute-shop-with-an-orange-awning-cartoon-vector_596059_wh860.png"),
                ),
                Text("Stack")
              ],
            ),
            SizedBox(width: 50,),
            Column(
              children:  [
                Container(
                  width: 70,
                  height: 50,
                  child: Image.network("https://static.vecteezy.com/system/resources/previews/015/131/796/original/flat-cartoon-style-shop-facade-front-view-modern-flat-storefront-or-supermarket-design-png.png"),
                ),
                Text("Drink")
              ],
            ),
          ],
        ),
        SizedBox(height: 30,),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children:  [
                Container(
                  width: 70,
                  height: 50,
                  child: Image.network("https://www.pngitem.com/pimgs/m/292-2928190_supermarket-building-grocery-vector-png-transparent-png.png"),
                ),
                Text("Fruit")
              ],
            ),
            SizedBox(width: 50,),
            Column(
              children:  [
                Container(
                  width: 70,
                  height: 50,
                  child: Image.network("https://cdn.vectorstock.com/i/1000v/47/74/cartoon-pet-shop-vector-35844774.jpg"),
                ),
                Text("Shu Si")
              ],
            ),
            SizedBox(width: 50,),
            Column(
              children:  [
                Container(
                  width: 70,
                  height: 50,
                  child: Image.network("https://t4.ftcdn.net/jpg/03/12/84/89/360_F_312848906_cxG09JQbnzeJgQqx6wEpV0I6BLPrDftg.jpg"),
                ),
                Text("Donat")
              ],
            ),
          ],
        ),
        SizedBox(height: 30,),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children:  [
                Container(
                  width: 70,
                  height: 50,
                  child: Image.network("https://cdni.iconscout.com/illustration/premium/thumb/coffee-shop-illustration-download-in-svg-png-gif-file-formats--cafe-area-bar-building-pack-food-drink-illustrations-5325681.png"),
                ),
                Text("Fruit")
              ],
            ),
            SizedBox(width: 50,),
            Column(
              children:  [
                Container(
                  width: 70,
                  height: 50,
                  child: Image.network("https://cdni.iconscout.com/illustration/premium/thumb/coffee-shop-illustration-download-in-svg-png-gif-file-formats--delicious-logo-cafe-area-table-or-ice-cream-pack-restaurants-bar-illustrations-3282823.png"),
                ),
                Text("Shu Si")
              ],
            ),
            SizedBox(width: 50,),
            Column(
              children:  [
                Container(
                  width: 70,
                  height: 50,
                  child: Image.network("https://cdn.pixabay.com/photo/2021/05/27/18/55/woman-6289052_1280.png"),
                ),
                Text("Donat")
              ],
            ),
          ],
        ),
      ],
    );
  }

  _buildPromotionItem(){
    return Container(
      // margin: EdgeInsets.only(right: 15.px),
      // height: 30,
      // width: MediaQuery.of(context).size.width/1.3,
      // color: Colors.green,
      margin: EdgeInsets.only(right: 20),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
          child: Image.network("https://d2vwvwqb5i5vtf.cloudfront.net/homeHero/593ee0a2-0e33-410c-94fa-9616413af5e5.jpeg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAZLUM7VHYRRYIMZ7H%2F20240905%2Fus-east-2%2Fs3%2Faws4_request&X-Amz-Date=20240905T091106Z&X-Amz-Expires=432000&X-Amz-Signature=80dff5479ba61278cf41de5e60a1192213a607ab63ad8718b5c525282901cee9&X-Amz-SignedHeaders=host")),

    );
  }
}
