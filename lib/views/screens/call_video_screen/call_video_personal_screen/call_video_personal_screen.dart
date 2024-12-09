

import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/bubble_type.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_4.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_8.dart';

class CallVideoPersonalScreen extends StatefulWidget {
  const CallVideoPersonalScreen({Key? key}) : super(key: key);

  @override
  State<CallVideoPersonalScreen> createState() => _CallVideoPersonalScreenState();
}

class _CallVideoPersonalScreenState extends State<CallVideoPersonalScreen> {

  TextEditingController searchController = TextEditingController();
  bool checkUser = false;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                width: double.infinity,
                height: 835,
                color: Colors.lightBlueAccent,
                child: const Image(
                  image: NetworkImage("https://e0.pxfuel.com/wallpapers/148/496/desktop-wallpaper-purple-galaxy-background-dark-purple-galaxy.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                  top: 30,
                  left: 0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        width: 390,
                        height: 80,
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
                            /// Profile
                            Expanded(
                              flex:5,
                              child: Container(
                                width: 60,
                                height: 80,
                                // color: Colors.yellow,
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: Container(
                                        margin: EdgeInsets.all(10),
                                        width: 60,
                                        height: 50,
                                        // color: Colors.lightBlue,

                                        // color: Colors.lightBlue,
                                        // decoration: BoxDecoration(
                                        //   color: Colors.lightBlue,
                                        //   borderRadius: BorderRadius.circular(50)),

                                        child: ClipRRect(
                                          borderRadius:  BorderRadius.circular(50),
                                          child: Container(
                                            width: double.infinity,
                                            height: 250,
                                            child: Image.network("https://img.freepik.com/premium-photo/beautiful-thai-girl-white-background-asian-young-female-persona-with-dark-hair_92795-4965.jpg?w=360", fit: BoxFit.cover,),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const Expanded(
                                      flex: 7,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text("Ko KO Zin", style: TextStyle(color: Colors.white),),
                                          Text("Active Now", style: TextStyle(color: Colors.white),),
                                        ],
                                      ),
                                    ),

                                  ],
                                ),
                              ),
                            ),

                          ],
                        ),
                      ),
                      Container(
                          width: 390,
                          height: 660,
                          // padding: EdgeInsets.only(top: 10, left: 5, bottom: 300),
                          decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.5),
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10)
                              )
                          ),
                          child: ListView.builder(
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              // physics: const NeverScrollableScrollPhysics(),
                              itemCount: 10,
                              itemBuilder: (ctx, index) {
                                return Container(
                                  child: Column(
                                    children: [
                                      // Container(
                                      //   width: 50,
                                      //   height: 50,
                                      //   color: Colors.cyan,
                                      // )
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          getSenderView(ChatBubbleClipper4(type: BubbleType.sendBubble), context, Text("test1")),
                                          Container(
                                            alignment: checkUser
                                                ? Alignment.centerRight
                                                : Alignment.centerLeft,
                                            child: Container(
                                              margin: const EdgeInsets.only(
                                                  right: 10),
                                              width: 40,
                                              height: 40,
                                              decoration: const BoxDecoration(
                                                color: Colors.green,
                                                image: DecorationImage(
                                                    image: NetworkImage(
                                                        "https://www.popular.com.kh/wp-content/uploads/2023/04/343437369_1499607563902751_2120410454115977700_n.jpg"),
                                                    fit: BoxFit.cover),
                                                shape: BoxShape.circle,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Container(
                                            alignment: checkUser
                                                ? Alignment.centerRight
                                                : Alignment.centerLeft,
                                            child: Container(
                                              margin: EdgeInsets.only(left: 10),
                                              width: 40,
                                              height: 40,
                                              decoration: const BoxDecoration(
                                                color: Colors.green,
                                                image: DecorationImage(
                                                    image: NetworkImage(
                                                        "https://img.freepik.com/premium-photo/beautiful-thai-girl-white-background-asian-young-female-persona-with-dark-hair_92795-4965.jpg?w=360"),
                                                    fit: BoxFit.cover),
                                                shape: BoxShape.circle,
                                              ),
                                            ),
                                          ),
                                          getReceiverView(ChatBubbleClipper8(type: BubbleType.receiverBubble), context, Text("test2")),
                                        ],
                                      ),
                                      SizedBox(height: 50,)
                                    ],
                                  ),
                                );
                              })
                      ),

                      Container(
                        width: 390,
                        height: 70,
                        color: Colors.white,
                        child: Row(
                          children: [
                            Expanded(
                                flex:1,
                                child: Container(
                                  // color: Colors.red,
                                  child: Icon(Icons.photo_camera),
                                )
                            ),
                            Expanded(
                                flex:1,
                                child: Container(
                                  // color: Colors.green,
                                  child: Icon(Icons.photo_camera_back),
                                )
                            ),
                            Expanded(
                                flex:5,
                                child: Container(
                                  height: 40,
                                  decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.circular(20)
                                  ),
                                  child: TextFormField(
                                    decoration: const InputDecoration(
                                      contentPadding: EdgeInsets.only(left: 15, bottom: 5),
                                      border: InputBorder.none,
                                      hintText: 'Search Your Trips ........',
                                    ),
                                  ),
                                )
                            ),
                            Expanded(
                                flex:1,
                                child: Container(
                                  // color: Colors.pink,
                                  child: Icon(Icons.keyboard_voice),
                                )
                            ),
                          ],
                        ),

                      )
                    ],
                  )
              )
            ],
          ),
        )
    );
  }

  // ClipPath
  getSenderView(CustomClipper clipper, BuildContext context, Widget? child) =>
      ChatBubble(
        clipper: clipper,
        alignment: Alignment.topRight,
        margin: EdgeInsets.only(top: 20),
        backGroundColor: Colors.blue,
        child: Container(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.7,
          ),
          child: child,
        ),
      );
  getReceiverView(CustomClipper clipper, BuildContext context, Widget? child) =>
      ChatBubble(
        clipper: clipper,
        backGroundColor: Color(0xffE7E7ED),
        margin: EdgeInsets.only(top: 20),
        child: Container(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.7,
          ),
          // child: Text(
          //   "Yes Kon papa",
          //   style: TextStyle(color: Colors.black),
          // ),
          child: child,
        ),
      );
// ClipPath
}


