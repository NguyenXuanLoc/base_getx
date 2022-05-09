import 'dart:math';

import 'package:docsify/data/model/rating_response.dart';
import 'package:docsify/data/provider/search_provider.dart';
import 'package:docsify/utils/log_utils.dart';
import 'package:docsify/utils/toast_utils.dart';
import 'package:get/get.dart';

class TabSearchController extends GetxController {
  var searchProvider = SearchProvider();
  final lRating = List<RatingResponse>.empty(growable: true).obs;
  var listSuggestion = {
    "AAAAAAA",
    'AAAAAAAAAAAA',
    'bbbbbbbbbbbb',
    'bbbbbbbbbb',
    'SSSSSSSSS',
    'wwwwwwwww',
    'yyyyyyyyy',
    'llll',
    'ccccccc',
    'ddddddd',
    'eeeeeeeee'
  };
  final count = 0.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    getRatingLatest();
    super.onReady();
  }

  @override
  void onClose() {}

  void handleRefresh() async {
    var result = await searchProvider.getDoctorRatingLatest();
    if (result.error != null) {
      toast(result.error.toString());
    } else {
      lRating.clear();
      lRating.addAll(ratingResponseFromJson(result.data['data']));
      update();
    }
  }

  void openSearchScreen({String? suggestion}) {
    logE("Open search detai $suggestion");
  }

  void openDoctorDetail(RatingResponse ratingResponse) {
    logE("open rating detail");
  }

  void getRatingLatest() async {
    var result = await searchProvider.getDoctorRatingLatest();
    if (result.error != null) {
      toast(result.error.toString());
    } else {
      lRating.addAll(ratingResponseFromJson(result.data['data']));
      update();
    }
  }
}
