import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget {
  final Color? color;
  const LoadingScreen({Key? key, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Padding(
            padding: EdgeInsets.all(6.0),
            child:
            Image.network("https://www.iconarchive.com/download/i108219/google/noto-emoji-smileys/10006-grinning-face-with-smiling-eyes.ico", width: 50,height: 50,)
            // Icon(Icons.ac_unit_outlined,size: 50,),
          ),
          Positioned.fill(
            child: CircularProgressIndicator(
              color: color ?? Colors.red,
              strokeWidth: 3,
            ),
          ),
        ],
      ),
    );
  }
}