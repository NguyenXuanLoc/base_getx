import 'dart:async';

import 'package:docsify/app/routes/app_pages.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  //TODO: Implement SplashController

  final count = 0.obs;

  @override
  void onInit() {
    super.onInit();
  }

  void routerHome() {
    Timer(const Duration(milliseconds: 500), () => Get.offNamed(Routes.HOME));
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void increment() => count.value++;
}
