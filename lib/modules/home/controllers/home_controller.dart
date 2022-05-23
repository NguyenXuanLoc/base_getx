import 'dart:async';

import 'package:docsify/app/routes/app_pages.dart';
import 'package:docsify/components//dialogs.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final index = 0.obs;
  final pageController = PageController();

  @override
  void onClose() {}

  @override
  void onReady() {
    var isLogin = Get.arguments ?? false;
    if (isLogin) {
      Timer(const Duration(milliseconds: 500), () => Get.toNamed(Routes.LOGIN));
    }
    super.onReady();
  }

  void changeTabIndex(int index) {
    this.index.value = index;
    pageController.jumpToPage(index);
  }

  void showDialog(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Dialogs.showLoadingDialog(context);
      Timer(const Duration(seconds: 1), () => Dialogs.hideLoadingDialog());
    });
  }
}
