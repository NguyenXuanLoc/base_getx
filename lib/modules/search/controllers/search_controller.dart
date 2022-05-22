import 'dart:convert';

import 'package:docsify/components/dialogs.dart';
import 'package:docsify/config/constant.dart';
import 'package:docsify/data/app_database.dart';
import 'package:docsify/data/model/doctor_model.dart';
import 'package:docsify/data/model/search_response.dart';
import 'package:docsify/data/provider/search_provider.dart';
import 'package:docsify/generated/app_translation.dart';
import 'package:docsify/services/globals.dart' as globals;
import 'package:docsify/utils/app_utils.dart';
import 'package:docsify/utils/snack_bar_utils.dart';
import 'package:docsify/utils/toast_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../data/model/city_response.dart';

enum ACTION_SEARCH { ONLINE, OFFLINE }

class SearchController extends GetxController {
  String query = '';
  BuildContext? context;
  final scrollController = ScrollController();
  final queryController = TextEditingController();
  final cityController = TextEditingController();
  final errorQuery = ''.obs;

  final listSuggestion = globals.listSuggestion.obs;
  final searchProvider = SearchProvider();
  final listSearch = List<DoctorResponse>.empty(growable: true).obs;
  final listFamousDoctor = List<DoctorResponse>.empty(growable: true).obs;
  final listLastSearch = List<InfoDoctorModel>.empty(growable: true).obs;
  final listSuggestDoctor = List<InfoDoctorModel>.empty(growable: true).obs;
  final listCity = List<CityResponse>.empty(growable: true).obs;
  final isCity = false.obs;

  final isLoading = true.obs;
  final isLoadingFamous = true.obs;
  final isDefaultView = false.obs;
  final isReadEnd = false.obs;
  var paging = 0;
  final listSort = [
    'Price: lowest price',
    'Price: highest price',
    'Rating worst rating',
    'Rating best rating'
  ];
  final sortValue = ''.obs;

  @override
  void onInit() {
    sortValue.value = listSort[0];
    try {
      query = Get.arguments;
      if (query.isNotEmpty)
        isDefaultView.value = false;
      else
        isDefaultView.value = true;
    } catch (ex) {
      isDefaultView.value = true;
    }
    super.onInit();
  }

  @override
  void onReady() {
    getCity();
    if (isDefaultView.value) {
      getLastSearch();
      getFamousDoctor();
      listSuggestDoctor.value = globals.listDoctorSuggest;
    }
    if (query.isNotEmpty) {
      queryController.obs.value.text = query;
      handleSearch(query);
    }
    handlePaging();
    super.onReady();
  }

  void getCity() async {
    String response = await rootBundle.loadString('assets/json/city.json');
    var result = json.decode(response);
    listCity.value = cityResponseFromJson(result);
  }

  void setCity(CityResponse cityResponse) {
    cityController.text = cityResponse.city!;
  }

  void setCategory(String category) {
    queryController.text = category;
    handleSearch(category);
  }

  List<CityResponse> filterCity(String text) {
    var result = <CityResponse>[];
    for (var e in listCity) {
      if (e.city!.toLowerCase().contains(text.toLowerCase())) {
        result.add(e);
      }
    }
    return result;
  }

  void getLastSearch() async {
    var listResult = await AppDatabase.instance.readAllDoctors();
    listLastSearch.value = listResult;
    update();
  }

  void setContext(BuildContext context) {
    this.context = context;
  }

  void handleSort(String value) {
    sortValue.value = value;
    if (queryController.text.isNotEmpty) {
      handleSearch(queryController.text);
    }
  }

  String getSortKey(String value) {
    switch (value) {
      case 'Price: lowest price':
        return ApiKey.price_desc;
      case 'Price: highest price':
        return ApiKey.price_asc;
      case 'Rating worst rating':
        return ApiKey.rate_desc;
    }
    return ApiKey.rate_asc;
  }

  void handlePaging() {
    scrollController.addListener(() {
      var maxScroll = scrollController.position.maxScrollExtent;
      var currentScroll = scrollController.position.pixels;
      if (maxScroll - currentScroll <= 200 &&
          !isLoading.value &&
          listSearch.isNotEmpty &&
          !isReadEnd.value &&
          queryController.text.isNotEmpty) {
        paging++;
        handleSearch(queryController.text, isPaging: true);
      }
    });
  }

  void handleSuggest(String suggest) {
    queryController.text = suggest;
    handleSearch(suggest);
  }

  void getFamousDoctor() async {
    isLoadingFamous.value = true;
    var result = await searchProvider.getFamousDoctor();
    if (result.error != null) {
      toast(result.error.toString());
    } else {
      var listResult = DoctorResponseFromJson(result.data['data']);
      listFamousDoctor.addAll(listResult);
    }
    isLoadingFamous.value = false;
    update();
  }

  void handleSearch(String query,
      {String city = '', bool isPaging = false}) async {
    if (query.isNotEmpty) {
      if (isCity.value == true && cityController.text.isNotEmpty) {
        city = cityController.text;
        print("TAG city: $city");
      }
      isDefaultView.value = false;
      if (!isPaging) paging = 0;
      var sort = getSortKey(sortValue.value);
      if (context != null) Utils.hideKeyboard(context!);
      isLoading.value = true;
      if (!isPaging) Dialogs.showLoadingDialog(context);
      var result = await searchProvider.searchDoctor(
          query: query, city: city, sort: sort, from: paging);
      if (!isPaging) Dialogs.hideLoadingDialog();
      isLoading.value = false;
      if (result.error != null) {
        toast(result.error.toString());
      } else {
        var listResult =
            DoctorResponseFromJson(result.data['data']['search_result']);
        if (listResult.isEmpty) {
          isReadEnd.value = true;
        } else {
          isReadEnd.value = false;
        }
        if (!isPaging) {
          listSearch.value = listResult;
        } else {
          listSearch.addAll(listResult);
        }
        update();
      }
    } else {
      SnackBarUtils.message(LocaleKeys.please_input_keyword.tr);
    }
  }

  void actionSearch(bool isShowCity) {
    if (isShowCity) {
      isCity.value = true;
    } else {
      isCity.value = false;
    }
  }

  void openDoctorDetail(DoctorResponse ob) {
    saveDoctor(
        name: ob.doctorName!,
        avatar: ob.doctorProfile!.avatar![0],
        id: ob.id!,
        specialization: ob.doctorProfile!.specialization!);
  }

  void saveDoctor(
      {String name = '',
      String avatar = '',
      String specialization = '',
      int id = 0}) async {
    AppDatabase.instance.create(InfoDoctorModel(
        id: id, name: name, avatar: avatar, specialization: specialization));
  }

  @override
  void onClose() {}
}
