import 'package:intl/intl.dart';

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
