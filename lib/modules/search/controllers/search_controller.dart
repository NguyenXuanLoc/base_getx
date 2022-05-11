import 'dart:async';

import 'package:docsify/data/provider/search_provider.dart';
import 'package:docsify/utils/log_utils.dart';
import 'package:docsify/utils/toast_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:docsify/services/globals.dart' as globals;

enum ACTION_SEARCH { ONLINE, OFFLINE }

class SearchController extends GetxController {
  final query = ''.obs;
  final queryController = TextEditingController();
  final listSuggestion = globals.listSuggestion.obs;
  final isShowAddress = false.obs;
  final height = 180.h.obs;
  final searchProvider = SearchProvider();
  final itemCount = 0.obs;
  final isView = false.obs;

  @override
  void onInit() {
    query.value = Get.arguments;
    super.onInit();
  }

  @override
  void onReady() {
    Timer(const Duration(milliseconds: 500), () => isView.value = true);
    Timer(const Duration(seconds: 2), () => itemCount.value = 5);
    super.onReady();
  }

  void handleSearch(String query, {String city = ''}) async {
    if (query.isNotEmpty) {
      var result = await searchProvider.searchDoctor(query: query, city: city);
      if (result.error != null) {
        toast(result.error.toString());
      } else {}
    }
  }

  void actionSearch() {
    isShowAddress.value = !isShowAddress.value;
  }

  void showAddress() {}

  @override
  void onClose() {}
}
