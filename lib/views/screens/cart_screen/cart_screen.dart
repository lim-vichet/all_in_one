import 'package:all_in_one/routes/config_router.dart';
import 'package:all_in_one/utils/global_use.dart';
import 'package:all_in_one/views/screens/cart_screen/widgets/item_list_user.dart';
import 'package:all_in_one/views/screens/cart_screen/widgets/item_list_user_chat.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../utils/constants/app_colors.dart';
import '../../../utils/constants/app_text_search.dart';
import 'chat_personal_screen/chat_personal_screen.dart';

class CartScreen extends StatefulWidget {
  static const String routeName = "/cart_screen";
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.lightBlueAccent,
      //   automaticallyImplyLeading: false,
      //   title: Padding(padding: EdgeInsets.only(left: 60)
      //   child: Text("Chat Screen", style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)),
      //   leading: const BackButton(
      //     color: Colors.white,
      //   ),
      // ),
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.lightBlueAccent,
            child: const Image(
              image: NetworkImage("https://e0.pxfuel.com/wallpapers/148/496/desktop-wallpaper-purple-galaxy-background-dark-purple-galaxy.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 50,
              left: 0,
              child: Column(
                children: [
                  Container(
                    width: 390,
                    height: 40,
                    // color: Colors.yellow,
                    child: Row(
                      children: [
                        /// Back Button
                        Expanded(
                          flex:1,
                          child: Container(
                            height: double.infinity,
                            // color: Colors.orange,
                            child: InkWell(
                              onTap: (){
                                Navigator.pop(context);
                              },
                              child: Icon(
                                Icons.arrow_back,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),

                        /// Search Button
                        Expanded(
                          flex:5,
                          child: AppTextSearchWidget(
                            controller: searchController,
                            onSubmit: (value) {
                              // if (value.isNotEmpty) {
                              //   contextB
                              //       .read<EApproveMyRequestBloc>()
                              //       .add(EventGetListMyRequest(
                              //       page: page,
                              //       status: status,
                              //       search: value,
                              //       type: 'search'
                              //   ));
                              // }
                            },
                            onChange: (value){
                              // contextBSI.read<ShowIconCloseBloc>().add(EventShowIconsClose(isShowIconClose: true, value: value));
                            },
                            suffixIcon:
                            // isShowIconClose ?
                            Container(
                              margin: EdgeInsets.only(
                                  left: 8.px,
                                  top: 3.px,
                                  bottom: 3.px
                              ),
                              child: IconButton(
                                  padding: EdgeInsets.zero,
                                  onPressed: ()  async {
                                    await Future.delayed(const Duration(milliseconds: 100),(){
                                      // contextB.read<EApproveMyRequestBloc>().add(EventGetListMyRequest(page: page, status: status, search: '', type: 'getData'));
                                    });

                                    // clear searchController
                                    searchController.clear();
                                    // contextBSI.read<ShowIconCloseBloc>().add(EventShowIconsClose(isShowIconClose: false, value: ''));
                                  },
                                  icon: Icon(Icons.clear,size: 20.px,color: AppColors().primaryRed,)
                              ),
                            )

                          ),
                        ),

                        /// Other Button
                        Expanded(
                          flex:1,
                          child: Container(
                            height: double.infinity,

                            child: Icon(
                              Icons.edit, color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 15,),
                  Container(
                    width: 395,
                    height: 120,
                    // color: Colors.yellow,
                    child: ListView.builder(
                      padding: EdgeInsets.all(10),
                      scrollDirection: Axis.horizontal,
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: (){
                            ConfigRouter.pushPage(context, ChatPersonalScreen());
                          },
                            child: ItemListUser()
                        );

                      },
                    ),
                  ),

                  SizedBox(height: 15,),
                  Container(
                    width: 395,
                    height: 900,
                    padding: EdgeInsets.only(top: 10, left: 5, bottom: 300),
                    decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.8),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50)
                      )
                    ),
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: 8,
                      itemBuilder: (context, index) {
                        return ItemListUserChat();
                      },

                    ),
                  ),
                ],
              )
          )
        ],
      )
    );
  }
}