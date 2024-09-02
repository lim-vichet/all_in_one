import 'package:get/get.dart';

import 'check_connectivity_controller.dart';

class GetXNetworkManagerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GetXNetworkManager>(() => GetXNetworkManager());

  }
}
