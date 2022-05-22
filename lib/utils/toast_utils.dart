import 'package:docsify/generated/app_translation.dart';
import 'package:docsify/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_utils/get_utils.dart';

void toast(String message) {
/*
  Get.snackbar(LocaleKeys.not_result.tr, message,
      backgroundColor: colorBackgroundWhite,
      animationDuration: Duration(seconds: 1),duration: Duration(seconds: 1),
      snackPosition: SnackPosition.BOTTOM);
*/
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.CENTER,
    timeInSecForIosWeb: 1,
    backgroundColor: Colors.white,
    textColor: Colors.black,
    fontSize: 14.sp,
  );
}
