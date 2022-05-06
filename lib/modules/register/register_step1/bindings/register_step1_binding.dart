import 'package:get/get.dart';

import '../controllers/register_step1_controller.dart';

class RegisterStep1Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegisterStep1Controller>(
      () => RegisterStep1Controller(),
    );
  }
}
