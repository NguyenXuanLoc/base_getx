import 'package:get/get.dart';

import '../controllers/register_step2_controller.dart';

class RegisterStep2Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegisterStep2Controller>(
      () => RegisterStep2Controller(),
    );
  }
}
