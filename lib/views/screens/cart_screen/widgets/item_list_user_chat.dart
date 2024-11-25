

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ItemListUserChat extends StatefulWidget {
  const ItemListUserChat({super.key});

  @override
  State<ItemListUserChat> createState() => _ItemListUserChatState();
}

class _ItemListUserChatState extends State<ItemListUserChat> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
          Expanded(
            flex: 7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Ko KO Zin", style: TextStyle(color: Colors.white),),
                Text("Hello what are you doing?", style: TextStyle(color: Colors.white),),
              ],
            ),
          ),

          Expanded(
            flex: 2,
              child: Text("10:15", style: TextStyle(color: Colors.white),))
        ],
      ),
    );
  }
}
