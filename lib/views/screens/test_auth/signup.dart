


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  static String routeName = 'SignUpScreen';
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Padding(
        padding: EdgeInsets.all(15.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 200,
                height: 200,
                // color: Colors.green,
                  child: ClipRect(
                    child: Align(
                      alignment: Alignment.center,
                      widthFactor: 0.8,
                      heightFactor: 1.0,
                      child: Image.network("https://img.freepik.com/premium-photo/symbol-flutter-logo-vector-design-illustration-style-light-navy-emerald_921860-41795.jpg"),
                      ),
                    ),


                // child: ClipOval(child: Image.network("https://img.freepik.com/premium-photo/symbol-flutter-logo-vector-design-illustration-style-light-navy-emerald_921860-41795.jpg")),
              ),
              SizedBox(height: 20,),
              Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        // color: Colors.pink,
                        padding: EdgeInsets.only(left: 15),
                        child: Text("855+", style: TextStyle(color: Colors.white),),
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: Container(
                        // color: Colors.green,
                        child: TextField(),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 20,),
              Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(10)
                ),
                child: Center(child: Text("OK", style: TextStyle(color: Colors.white),)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
