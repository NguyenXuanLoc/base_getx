import 'dart:async';

import 'package:docsify/app/routes/app_pages.dart';
import 'package:docsify/data/model/rating_response.dart';
import 'package:docsify/data/provider/search_provider.dart';
import 'package:docsify/utils/log_utils.dart';
import 'package:docsify/utils/toast_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:docsify/services/globals.dart' as globals;

class TabSearchController extends GetxController {
  final tabRating = 1;
  final tabDoctor = 0;

  var searchProvider = SearchProvider();
  final lRating = List<RatingResponse>.empty(growable: true).obs;
  final lDoctor = List<RatingResponse>.empty(growable: true).obs;

  var listSuggestion = globals.listSuggestion;
  final currentIndex = 0.obs;
  final scrollController = ScrollController();

  bool isLoadRating = false;
  int pagingLatestRating = 0;
  final isReadEndLatestRating = false.obs;

  bool isLoadDoctor = false;
  int pagingDoctor = 0;
  final isReadEndDoctor = false.obs;

  @override
  void onReady() {
    getRatingLatest();
    getDoctor();
    handlePaging();
    super.onReady();
  }

  void handlePaging() {
    scrollController.addListener(() {
      var maxScroll = scrollController.position.maxScrollExtent;
      var currentScroll = scrollController.position.pixels;
      if (maxScroll - currentScroll <= 200) {
        if (currentIndex.value == 0 && !isLoadDoctor) {
          if (isReadEndDoctor.value) {
            getDoctor();
          }
        } else {
          if (isReadEndLatestRating.value && !isLoadRating) {
            getRatingLatest();
          }
        }
      }
    });
  }

  void switchTab() {
    currentIndex.value =
        currentIndex.value == tabDoctor ? tabRating : tabDoctor;
  }

  void handleRefresh() async {

    if (currentIndex.value == tabDoctor) {
      pagingDoctor = 0;
      getDoctor(isRefresh: true);
    } else {
      pagingLatestRating = 0;
      getRatingLatest(isRefresh: true);
    }
  }

  void openSearchScreen({String? suggestion = ''}) {
    Get.toNamed(Routes.SEARCH, arguments: suggestion);
  }

  void openDoctorDetail(RatingResponse ratingResponse) {
    logE("open rating detail");
  }

  void getDoctor({bool isRefresh = false}) async {
    isLoadDoctor = true;
    var result =
        await searchProvider.getDoctorRatingLatest(offset: pagingDoctor);
    isLoadDoctor = false;
    if (isRefresh) lDoctor.clear();
    if (result.error != null) {
      toast(result.error.toString());
    } else {
      var listResponse = ratingResponseFromJson(result.data['data']);
      if (listResponse.isNotEmpty) {
        lDoctor.addAll(listResponse);
        isReadEndDoctor.value = true;
        pagingDoctor++;
      } else {
        isReadEndDoctor.value = false;
      }
      update();
    }
  }

  void getRatingLatest({bool isRefresh = false}) async {
    isLoadRating = true;
    if (isRefresh) lRating.clear();
    var result =
        await searchProvider.getDoctorRatingLatest(offset: pagingLatestRating);
    isLoadRating = false;
    if (result.error != null) {
      toast(result.error.toString());
    } else {
      var listResponse = ratingResponseFromJson(result.data['data']);
      if (listResponse.isNotEmpty) {
        lRating.addAll(listResponse);
        isReadEndLatestRating.value = true;
        pagingLatestRating++;
      } else {
        isReadEndLatestRating.value = false;
      }
    }
    update();
  }
}
