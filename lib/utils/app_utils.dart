import 'package:docsify/const/resource.dart';
import 'package:docsify/generated/app_translation.dart';
import 'package:docsify/theme/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class Utils {
  static String getNumberRating(double rate) {
    if (rate == 0) return R.assetsPngRate0Png;
    if (rate >= 0 && rate <= 0.5) {
      return R.assetsPngRate05Png;
    } else if (rate > 0.5 && rate <= 1) {
      return R.assetsPngRate1Png;
    } else if (rate > 1 && rate <= 1.5) {
      return R.assetsPngRate15Png;
    } else if (rate > 1.5 && rate <= 2) {
      return R.assetsPngRate2Png;
    } else if (rate > 2 && rate <= 2.5) {
      return R.assetsPngRate25Png;
    } else if (rate > 2.5 && rate <= 3) {
      return R.assetsPngRate3Png;
    } else if (rate > 3 && rate <= 3.5) {
      return R.assetsPngRate35Png;
    } else if (rate > 3.5 && rate <= 4) {
      return R.assetsPngRate4Png;
    } else if (rate > 4.5 && rate <= 5) {
      return R.assetsPngRate45Png;
    } else if (rate >= 5) {
      return R.assetsPngRate5Png;
    }

    return R.assetsPngRate5Png;
  }

  static String getQueryString(Map params,
      {String prefix: '&', bool inRecursion: false}) {
    String query = '';

    params.forEach((key, value) {
      if (inRecursion) {
        key = '[$key]';
      }
      if (value is String || value is int || value is double || value is bool) {
        query += '$prefix$key=$value';
      } else if (value is List || value is Map) {
        if (value is List) value = value.asMap();
        value.forEach((k, v) {
          query +=
              getQueryString({k: v}, prefix: '$prefix$key', inRecursion: true);
        });
      }
    });
    query = query.replaceFirst(RegExp('&'), '?');
    return query;
  }

  static void hideKeyboard(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  static bool validateMobile(String value) {
    String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    RegExp regExp = RegExp(pattern);
    if (value.isEmpty) {
      return false;
    } else if (!regExp.hasMatch(value)) {
      return false;
    }
    return true;
  }

  String numberFormat(int num) {
    final formatter = NumberFormat("#,###");
    return formatter.format(num);
  }

  String stringDateFormat(String? stringTime) {
    final date = DateTime.tryParse(stringTime ?? '');
    return date != null ? DateFormat('dd/MM/yyyy').format(date) : '';
  }

  String stringTimeFormat(String? stringTime) {
    final date = DateTime.tryParse(stringTime ?? '');
    return date != null ? DateFormat('HH:mm').format(date) : '';
  }

  String stringTimeDateFormat(String? stringTime) {
    final date = DateTime.tryParse(stringTime ?? '');
    return date != null
        ? "${DateFormat('HH:mm').format(date.toLocal())} - ${DateFormat('dd/MM/yyyy').format(date.toLocal())}"
        : '';
  }

  String fullStringTimeFormat(String? stringTime) {
    final date = DateTime.tryParse(stringTime ?? '');
    return date != null
        ? DateFormat('dd/MM/yyyy HH:mm')
            .format(date.add(const Duration(hours: 7)))
        : '';
  }

  DateTime? string2Date(String? stringTime) {
    return DateTime.tryParse(stringTime ?? '');
  }

  String stringTimeFormatLongDuration(int days, String? stringTime) {
    final date = DateTime.tryParse(stringTime ?? '');
    return date != null
        ? DateFormat('dd/MM/yyyy').format(date.add(Duration(days: days)))
        : '';
  }

/*String stringTimeFormatYearDuration(int month, String? stringTime) {
  final date = DateTime.tryParse(stringTime ?? '');
  return date != null ? Jiffy(date).add(months: month).format('dd/MM/yyyy') : '';
}*/

  String formatLicensePlate(String licensePlate) {
    licensePlate = licensePlate.replaceAll("-", "");
    return licensePlate != ''
        ? (licensePlate.substring(0, 4) + '-' + licensePlate.substring(4))
        : '';
  }

  String getEndYear(int duration, String date) {
    var createyear = int.parse(fullStringTimeFormatYear(date));
    return ((createyear + (duration / 12))).toStringAsFixed(0);
  }

  String fullStringTimeFormatYear(String? stringTime) {
    final date = DateTime.tryParse(stringTime ?? '');
    return date != null ? DateFormat('yyyy').format(date) : '0';
  }

  int daysBetween(DateTime from, DateTime to) {
    from = DateTime(from.year, from.month, from.day);
    to = DateTime(to.year, to.month, to.day);
    return (to.difference(from).inHours / 24).round();
  }

  String formatDateTimeFromString(String date, String month, String year) {
    var validDate = date;
    var validMonth = month;
    var validYear = year;
    switch (int.parse(validMonth)) {
      case 1:
      case 3:
      case 5:
      case 7:
      case 8:
      case 10:
      case 12:
        if (int.parse(validDate) > 31) validDate = "31";
        break;
      case 2:
        if (checkYear(int.parse(year))) {
          if (int.parse(validDate) > 29) validDate = "29";
        } else {
          if (int.parse(validDate) > 28) validDate = "28";
        }
        break;
      default:
        if (int.parse(validDate) > 30) validDate = "30";
        break;
    }
    if (int.parse(validMonth) > 12) validMonth = "12";
    return "$validDate/$validMonth/$validYear";
  }

  bool checkYear(int year) {
    return (((year % 4 == 0) && (year % 100 != 0)) || (year % 400 == 0));
  }

  bool checkFormat(String regex, String checkedString) {
    return RegExp(regex).hasMatch(checkedString);
  }

  static void snackBarMessage(String message,
      {Color? backgroundColor, SnackPosition? position, Color? colorText}) {
    Get.snackbar(LocaleKeys.notify.tr, message,
        snackStyle: SnackStyle.FLOATING,
        backgroundColor: backgroundColor ?? colorBackgroundWhite,
        colorText: colorText ?? colorText100,
        animationDuration: const Duration(seconds: 1),
        duration: const Duration(seconds: 2),
        snackPosition: position ?? SnackPosition.BOTTOM);
  }
}
