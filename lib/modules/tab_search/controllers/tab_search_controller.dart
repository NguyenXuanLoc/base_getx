import 'dart:async';

import 'package:docsify/app/routes/app_pages.dart';
import 'package:docsify/data/model/rating_response.dart';
import 'package:docsify/data/model/search_response.dart';
import 'package:docsify/data/provider/search_provider.dart';
import 'package:docsify/utils/log_utils.dart';
import 'package:docsify/utils/toast_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:docsify/services/globals.dart' as globals;

class TabSearchController extends GetxController {
  var searchProvider = SearchProvider();
  final lRating = List<RatingResponse>.empty(growable: true).obs;
  final lDoctor = List<DoctorResponse>.empty(growable: true).obs;

  var listSuggestion = globals.listSuggestion;
  final currentIndex = 0.obs;
  final scrollController = ScrollController();

  final isLoadRating = true.obs;
  int pagingLatestRating = 0;
  final isReadEndLatestRating = false.obs;

  final isLoadDoctor = true.obs;
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
        if (currentIndex.value == 0 &&
            !isLoadDoctor.value &&
            !isReadEndDoctor.value) {
          getDoctor();
        } else if (currentIndex.value == 1 &&
            !isReadEndLatestRating.value &&
            !isLoadRating.value) {
          getRatingLatest();
        }
      }
    });
  }

  void switchTab(bool isDoctor) {
    if (isDoctor) {
      currentIndex.value = 0;
    } else {
      currentIndex.value = 1;
    }
  }

  void handleRefresh() async {
    if (currentIndex.value == 0) {
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

  void openDoctorDetail(
      {DoctorResponse? doctorResponse, RatingResponse? ratingResponse}) {
    logE("open rating detail");
  }

  void getDoctor({bool isRefresh = false}) async {
    isLoadDoctor.value = true;
    var result =
        await searchProvider.getFamousDoctor(from: pagingDoctor, size: 10);
    isLoadDoctor.value = false;
    if (isRefresh) lDoctor.clear();
    if (result.error != null) {
      toast(result.error.toString());
    } else {
      List<DoctorResponse>? listResponse;
      try {
        listResponse = DoctorResponseFromJson(result.data['data']);
      } catch (ex) {
        listResponse = [];
        isReadEndDoctor.value = true;
      }
      if (listResponse.isNotEmpty) {
        lDoctor.addAll(listResponse);
        isReadEndDoctor.value = false;
        pagingDoctor++;
      } else {
        isReadEndDoctor.value = true;
      }
      update();
    }
  }

  void getRatingLatest({bool isRefresh = false}) async {
    isLoadRating.value = true;
    if (isRefresh) lRating.clear();
    var result =
        await searchProvider.getDoctorRatingLatest(offset: pagingLatestRating);
    isLoadRating.value = false;
    if (result.error != null) {
      toast(result.error.toString());
    } else {
      List<RatingResponse>? listResponse;
      try {
        listResponse = ratingResponseFromJson(result.data['data']);
      } catch (ex) {
        listResponse = [];
        isReadEndLatestRating.value = true;
      }
      if (listResponse.isNotEmpty) {
        lRating.addAll(listResponse);
        isReadEndLatestRating.value = false;
        pagingLatestRating++;
      } else {
        isReadEndLatestRating.value = true;
      }
    }
    update();
  }
}
