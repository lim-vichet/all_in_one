import 'package:flutter/material.dart';

void modalLoading(BuildContext context){

  showDialog(
    context: context,
    barrierDismissible: false,
    barrierColor: Colors.white54,

    builder: (context) 
      => AlertDialog(
        insetPadding: EdgeInsets.all(20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        content: Container(
          height: 100,
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [

                CircularProgressIndicator( color: Colors.red),
                SizedBox(width: 15.0),
                Text("Loading...")
              ],
            ),
          ),
        ),
      ),
  );

}