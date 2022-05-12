import 'dart:async';

import 'package:docsify/data/model/search_response.dart';
import 'package:docsify/data/provider/search_provider.dart';
import 'package:docsify/services/globals.dart' as globals;
import 'package:docsify/utils/app_utils.dart';
import 'package:docsify/utils/log_utils.dart';
import 'package:docsify/utils/toast_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

enum ACTION_SEARCH { ONLINE, OFFLINE }

class SearchController extends GetxController {
  String query = '';
  final scrollController = ScrollController();
  final queryController = TextEditingController();
  final errorQuery = ''.obs;
  final listSuggestion = globals.listSuggestion.obs;
  final isShowAddress = false.obs;
  final height = 180.h.obs;
  final searchProvider = SearchProvider();
  final itemCount = 0.obs;
  final listSearch = List<SearchResponse>.empty(growable: true).obs;
  final isLoading = false.obs;
  final isView = false.obs;
  final isReadEnd = false.obs;

  @override
  void onInit() {
    query = Get.arguments;
    super.onInit();
  }

  @override
  void onReady() {
    Timer(const Duration(milliseconds: 400), () => isView.value = true);
    if (query.isNotEmpty) {
      queryController.obs.value.text = query;
      Timer(const Duration(seconds: 2), () => handleSearch(query));
    }
    handlePaging();
    super.onReady();
  }

  void handlePaging() {
    scrollController.addListener(() {
      var maxScroll = scrollController.position.maxScrollExtent;
      var currentScroll = scrollController.position.pixels;
      if (maxScroll - currentScroll <= 200 &&
          !isLoading.value &&
          listSearch.isNotEmpty) {
        logE("SEARCHSEARCHSEARCHSEARCH");
        handleSearch(queryController.text, isRemoveList: false);
      }
    });
  }

  void handleSearch(String query,
      {String city = '',
      BuildContext? context,
      bool isRemoveList = true}) async {
    if (query.isNotEmpty) {
      if (context != null) Utils.hideKeyboard(context);
      isLoading.value = true;
      var result = await searchProvider.searchDoctor(query: query, city: city);
      isLoading.value = false;
      if (result.error != null) {
        toast(result.error.toString());
      } else {
        var listResult = searchResponseFromJson(result.data['data']);
        if (listResult.isEmpty) {
          isReadEnd.value = true;
        } else {
          isReadEnd.value = false;
        }
        if (isRemoveList) {
          listSearch.value = listResult;
        } else {
          listSearch.addAll(listResult);
        }
      }
    }
  }

  void actionSearch() {
    isShowAddress.value = !isShowAddress.value;
  }

  void showAddress() {}

  @override
  void onClose() {}
}
