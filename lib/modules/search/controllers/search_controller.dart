import 'dart:async';

import 'package:docsify/components/dialogs.dart';
import 'package:docsify/config/constant.dart';
import 'package:docsify/data/app_database.dart';
import 'package:docsify/data/model/doctor_model.dart';
import 'package:docsify/data/model/search_response.dart';
import 'package:docsify/data/provider/search_provider.dart';
import 'package:docsify/generated/app_translation.dart';
import 'package:docsify/services/globals.dart' as globals;
import 'package:docsify/theme/colors.dart';
import 'package:docsify/utils/app_utils.dart';
import 'package:docsify/utils/log_utils.dart';
import 'package:docsify/utils/toast_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:rxdart/rxdart.dart';

import '../../../data/model/city_response.dart';

enum ACTION_SEARCH { ONLINE, OFFLINE }

class SearchController extends GetxController {
  String query = '';
  BuildContext? context;
  final scrollController = ScrollController();
  final queryController = TextEditingController();
  final cityController = TextEditingController();
  final errorQuery = ''.obs;

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
  final listSort = ['Rating best rating', 'Rating worst rating'];
  final sortValue = ''.obs;
  late StreamSubscription<Position> streamSubscription;
  final searchOnChange = BehaviorSubject<String>();

  @override
  void onInit() {
    sortValue.value = listSort[0];
    searchOnChange.debounceTime(const Duration(seconds: 2)).listen((query) {
      if (query.isNotEmpty) handleSearch(query);
    });
    try {
      query = Get.arguments;
      if (query.isNotEmpty) {
        isDefaultView.value = false;
      } else {
        isDefaultView.value = true;
      }
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
    getLocation();
    handlePaging();
    super.onReady();
  }

  void getQuerySearch(String query) {
    searchOnChange.add(query);
  }

  void getCity() async {
    var result = await searchProvider.getCity();
    listCity.value = cityResponseFromJson(result.data['data']);
  }

  void setCity(CityResponse cityResponse) {
    cityController.text = cityResponse.name!;
    handleSearch(queryController.text, city: cityController.text);
  }

  void setCategory(String category) {
    queryController.text = category;
    handleSearch(category);
  }

  List<CityResponse> filterCity(String text) {
    var result = <CityResponse>[];
    for (var e in listCity) {
      if (e.name!.toLowerCase().contains(text.toLowerCase())) {
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
    handleSearch(queryController.text);
  }

  String getSortKey(String value) {
    if (value == 'Rating worst rating') {
      return ApiKey.rate_desc;
    } else {
      return ApiKey.rate_asc;
    }
  }

  Future<void> addDoctorFavourite(int doctorId) async {
    if (globals.isLogin) {
      Dialogs.showLoadingDialog(context);
      var result =
          await searchProvider.addDoctorFavourite(doctorId, globals.accountId);
      Dialogs.hideLoadingDialog();
      if (result.error != null) {
        toast(result.error);
      } else
        toast(result.message);
    } else {
      Utils.snackBarMessage(LocaleKeys.you_must_login.tr,
          backgroundColor: colorSemanticRed60,
          position: SnackPosition.TOP,
          colorText: colorWhite);
    }
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
    if (!isPaging) listSearch.value = [];
    if (isCity.value == true && cityController.text.isNotEmpty) {
      city = cityController.text;
    }
    if (context != null) Utils.hideKeyboard(context!);
    isDefaultView.value = false;
    if (!isPaging) paging = 0;
    var sort = getSortKey(sortValue.value);
    isLoading.value = true;
    var result = await searchProvider.searchDoctor(
        query: query, city: city, sort: sort, from: paging);
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
  }

  void actionSearch(bool isShowCity) {
    if (isShowCity) {
      isCity.value = true;
      handleSearch(queryController.text, city: cityController.text);
    } else {
      isCity.value = false;
      if (queryController.text.isNotEmpty) handleSearch(queryController.text);
    }
  }

  void openDoctorDetail(DoctorResponse ob) {
    if (context != null) Utils.hideKeyboard(context!);
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

  getLocation() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      return Future.error('Location services are disabled.');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    streamSubscription =
        Geolocator.getPositionStream().listen((Position position) {
      getAddressFromLatLang(position);
      streamSubscription.cancel();
    });
  }

  Future<void> getAddressFromLatLang(Position position) async {
    List<Placemark> placemark =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    Placemark place = placemark[0];
    cityController.text = place.administrativeArea ?? "";
  }

  @override
  void onClose() {}
}
