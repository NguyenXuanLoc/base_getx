import 'package:docsify/app/routes/app_pages.dart';
import 'package:docsify/components/dialogs.dart';
import 'package:docsify/config/constant.dart';
import 'package:docsify/data/model/user_model.dart';
import 'package:docsify/data/provider/user_provider.dart';
import 'package:docsify/generated/app_translation.dart';
import 'package:docsify/utils/log_utils.dart';
import 'package:docsify/utils/storage_utils.dart';
import 'package:docsify/utils/toast_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class RegisterStep2Controller extends GetxController {
  final userProvider = UserProvider();
  final isAgree = false.obs;
  final errorFullName = ''.obs;
  final errorPhoneNumber = ''.obs;
  final errorBirthDate = ''.obs;
  final fullNameController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final birthDateController = TextEditingController();
  final count = 0.obs;
  String email = '';

  @override
  void onInit() {
    email = Get.arguments;
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void handleTerm() {
    isAgree.value = !isAgree.value;
  }

  void updateProfile(BuildContext context) async {
    if (checkValid()) {
      var userModel = await StorageUtils.getUser();
      var userId = userModel?.userId;
      if (userId != null) {
        Dialogs.showLoadingDialog(context);
        var result = await userProvider.createUserProfile(
            userId,
            fullNameController.text,
            birthDateController.text,
            phoneNumberController.text);
        await Dialogs.hideLoadingDialog();
        if (result.error != null) {
          toast(result.error);
        } else {
          Get.toNamed(Routes.ACTIVE_CODE, arguments: email);
        }
      }
    }
  }

  bool checkValid() {
    var isValid = true;
    var fullName = fullNameController.value.text;
    var phoneNumber = phoneNumberController.value.text;
    var birthDate = birthDateController.value.text;
    if (fullName.isEmpty) {
      isValid = false;
      errorFullName.value = LocaleKeys.please_input_your_name.tr;
    } else {
      errorFullName.value = '';
    }
    if (phoneNumber.isEmpty) {
      isValid = false;
      errorPhoneNumber.value = LocaleKeys.please_input_phone_number.tr;
    } else if (!validateMobile(phoneNumber)) {
      isValid = false;
      errorPhoneNumber.value = LocaleKeys.please_input_valid_phone_number.tr;
    } else {
      errorPhoneNumber.value = '';
    }
    if (birthDate.isEmpty) {
      isValid = false;
      errorBirthDate.value = LocaleKeys.please_input_phone_number.tr;
    } else {
      errorBirthDate.value = '';
    }
    return isValid;
  }

  void pickDate(BuildContext context) {
    var time = DateTime.now();
    DatePicker.showDatePicker(context,
        showTitleActions: true,
        minTime: DateTime(1900, 3, 5),
        maxTime: DateTime(time.year + 10, 12),
        onChanged: (date) {}, onConfirm: (date) {
      birthDateController.obs.value.text =
          "${date.year}-${date.month}-${date.day}";
    }, currentTime: DateTime.now(), locale: LocaleType.en);
  }

  bool validateMobile(String value) {
    String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    RegExp regExp = RegExp(pattern);
    if (value.isEmpty) {
      return false;
    } else if (!regExp.hasMatch(value)) {
      return false;
    }
    return true;
  }
}
