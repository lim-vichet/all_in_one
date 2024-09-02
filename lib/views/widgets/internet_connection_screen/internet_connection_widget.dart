import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Internet_widget.dart';
import 'check_connectivity_controller.dart';

bool isFirstTime = false;

class InternetConnectWidget extends StatefulWidget {
  Widget child;
  InternetConnectWidget({Key? key, required this.child}) : super(key: key);

  @override
  _InternetConnectWidgetState createState() => _InternetConnectWidgetState();
}

class _InternetConnectWidgetState extends State<InternetConnectWidget> {
  // create an instance
  final GetXNetworkManager _networkManager = Get.find<GetXNetworkManager>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          widget.child,
          GetBuilder<GetXNetworkManager>(
            builder: (builder) {
              if (_networkManager.connectionType == 0) {
                return Visibility(
                  visible: true,
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 0.1, sigmaY: 0.1),
                    child: Container(
                      color: Colors.black26,
                      width: Get.width,
                      height: Get.height,
                      child: const InternetScreen(),
                    ),
                  ),
                );
              } else {
                return widget.child;
              }
            },
          ),
        ],
      ),
    );
  }
}
