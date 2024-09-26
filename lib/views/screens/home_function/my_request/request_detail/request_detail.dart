import 'package:flutter/material.dart';

class RequestDetailScreen extends StatefulWidget {
  const RequestDetailScreen({Key? key}) : super(key: key);

  @override
  State<RequestDetailScreen> createState() => _RequestDetailScreenState();
}

class _RequestDetailScreenState extends State<RequestDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Hello kon apapa"),
      ),
    );
  }
}
