import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../screens/main_screen/main_screen.dart';
import '../Internet_widget_full_screen.dart';
import 'check_connectivity_controller.dart';

bool isFirstTime = false;

class InternetConnectionScreen extends StatefulWidget {
  static const String routeName = "/internet_connection";
  const InternetConnectionScreen({Key? key}) : super(key: key);

  @override
  _InternetConnectionScreenState createState() =>
      _InternetConnectionScreenState();
}

class _InternetConnectionScreenState extends State<InternetConnectionScreen> {
  // create an instance
  final GetXNetworkManager _networkManager = Get.find<GetXNetworkManager>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GetBuilder<GetXNetworkManager>(
            builder: (builder) {
              if (_networkManager.connectionType == 0) {
                Future.delayed(
                  const Duration(milliseconds: 10),
                  () {
                    Get.to(const InternetFullScreenScreen());
                  },
                );
                return const SizedBox();
              } else {
                Future.delayed(
                  const Duration(milliseconds: 10),
                  () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, MainScreen.routeName, (route) => false);
                  },
                );

                return const SizedBox();
              }
            },
          ),
        ],
      ),
    );
  }
}
