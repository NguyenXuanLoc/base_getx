import 'package:get/get.dart';

import '../controllers/active_code_controller.dart';

class ActiveCodeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ActiveCodeController>(
      () => ActiveCodeController(),
    );
  }
}
