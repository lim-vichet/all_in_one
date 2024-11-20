

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ItemListUserChat extends StatefulWidget {
  const ItemListUserChat({super.key});

  @override
  State<ItemListUserChat> createState() => _ItemListUserChatState();
}

class _ItemListUserChatState extends State<ItemListUserChat> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 100,
      // color: Colors.yellow,
      child: Row(
        children: [
          Container(
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
                child: Image.network("https://image.tensorartassets.com/cdn-cgi/image/anim=false,plain=false,w=500,q=85/model_showcase/0/73e4f8f1-f78f-a050-bc21-718046697015.jpeg", fit: BoxFit.cover,),
              ),
            ),
          ),
          Text("Vichet", style: TextStyle(color: Colors.white),)
        ],
      ),
    );
  }
}
