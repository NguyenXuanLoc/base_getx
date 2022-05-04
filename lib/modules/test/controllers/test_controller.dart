import 'dart:async';

import 'package:docsify/components/dialogs.dart';
import 'package:docsify/utils/log_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TestController extends GetxController {
  var isCheck = true.obs;
  var testController = ScrollController();
  var isLoading = false;
  var itemCount = 30.obs;
  final count = 0.obs;


  @override
  void onReady() {
    _paging();
    super.onReady();
  }

  @override
  void onClose() {}

  void _paging() {
    testController.addListener(() {
      var maxScroll = testController.position.maxScrollExtent;
      var currentScroll = testController.position.pixels;
      if (maxScroll - currentScroll <= 200 && !isLoading) {
        isLoading = true;
        Timer(const Duration(seconds: 1), () {
          itemCount.value += 10;
          isLoading = false;
          logE("Load more");
        });
      }
    });
  }

  void checkChange(bool value) {
    isCheck.value = value;
  }

  void showDialog(BuildContext context) {
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      Dialogs.showLoadingDialog(context);
      Timer(const Duration(seconds: 1), () => Dialogs.hideLoadingDialog());
    });
  }

  void increment() => count.value++;
}
