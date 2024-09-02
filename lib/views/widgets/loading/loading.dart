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
          const Padding(
            padding: EdgeInsets.all(6.0),
            child: Icon(Icons.ac_unit_outlined,size: 50,),
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