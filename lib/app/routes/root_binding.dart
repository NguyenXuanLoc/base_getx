import 'package:docsify/modules/search/controllers/search_controller.dart';
import 'package:docsify/modules/tab_favourite/controllers/favourite_controller.dart';
import 'package:docsify/modules/tab_reservation/controllers/reservation_controller.dart';
import 'package:docsify/modules/tab_search/controllers/tab_search_controller.dart';
import 'package:get/get.dart';

class RootBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<TabSearchController>(TabSearchController());
    Get.put<ReservationController>(ReservationController());
    Get.put<FavouriteController>(FavouriteController());
  }
}
