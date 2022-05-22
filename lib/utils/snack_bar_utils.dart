import 'package:docsify/generated/app_translation.dart';
import 'package:docsify/theme/colors.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_utils/get_utils.dart';

class SnackBarUtils {
  static message(String message) {
    Get.snackbar(LocaleKeys.notify.tr, message,
        backgroundColor: colorBackgroundWhite,
        animationDuration: const Duration(seconds: 1),
        duration: const Duration(seconds: 2),
        snackPosition: SnackPosition.BOTTOM);
  }
}
