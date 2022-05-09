import 'package:docsify/app/routes/app_pages.dart';
import 'package:docsify/components/dialogs.dart';
import 'package:docsify/data/model/user_model.dart';
import 'package:docsify/data/provider/user_provider.dart';
import 'package:docsify/generated/app_translation.dart';
import 'package:docsify/modules/login/controllers/login_controller.dart';
import 'package:docsify/utils/app_utils.dart';
import 'package:docsify/utils/log_utils.dart';
import 'package:docsify/utils/storage_utils.dart';
import 'package:docsify/utils/toast_utils.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get/get.dart';

class RegisterStep1Controller extends GetxController {
  final userProvider = UserProvider();
  final focusEmail = FocusNode();
  final focusPass = FocusNode();
  final focusRePass = FocusNode();

  final errorEmail = ''.obs;
  final errorPass = ''.obs;
  final errorRePass = ''.obs;

  final errorBusinessName = ''.obs;
  final errorBirthDate = ''.obs;
  final errorPhoneNumber = ''.obs;

  final isHidePass = true.obs;
  final isHideRsPass = true.obs;
  final emailController = TextEditingController();
  final passController = TextEditingController();
  final rePassController = TextEditingController();

  final birthDateController = TextEditingController();
  final businessNameController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final count = 0.obs;
  final isAgreeTerm = false.obs;

  @override
  void onClose() {}

  void increment() => count.value++;

  void checkTerm() {
    isAgreeTerm.value = !isAgreeTerm.value;
  }

  Future<void> handleRegister(BuildContext context) async {
    if (isvalidInfo()) {
      Utils.hideKeyboard(context);
      var email = emailController.value.text;
      var pass = passController.value.text;
      Dialogs.showLoadingDialog(context);
      var result =
          await userProvider.registerByEmail(email, email.split('@')[0], pass);
      if (result.error != null) {
        toast(result.error);
        await Dialogs.hideLoadingDialog();
      } else {
        var userModel = UserResponse.fromJson(result.data['data']);
        await StorageUtils.saveUser(userModel);
        updateProfile(context);
      }
    }
  }

  void updateProfile(BuildContext context) async {
    var userModel = await StorageUtils.getUser();
    var userId = userModel?.userId;
    if (userId != null) {
      var result = await userProvider.createUserProfile(
          userId,
          businessNameController.text,
          birthDateController.text,
          phoneNumberController.text);
      await Dialogs.hideLoadingDialog();
      if (result.error != null) {
        toast(result.error);
      } else {
        Get.toNamed(Routes.ACTIVE_CODE, arguments: emailController.text);
      }
    }
  }

  bool isvalidInfo() {
    var email = emailController.value.text;
    var pass = passController.value.text;
    var rePass = rePassController.value.text;
    var isValid = true;
    if (email.isEmpty) {
      errorEmail.value = LocaleKeys.please_input_email.tr;
      isValid = false;
    } else if (!EmailValidator.validate(email)) {
      errorEmail.value = LocaleKeys.please_input_valid_email.tr;
      isValid = false;
    } else {
      errorEmail.value = '';
    }
    if (pass.isEmpty) {
      errorPass.value = LocaleKeys.please_input_pass.tr;
      isValid = false;
    } else if (pass.length < 6) {
      errorPass.value = LocaleKeys.please_input_valid_pass.tr;
      isValid = false;
    } else {
      errorPass.value = '';
    }
    if (rePass.isEmpty) {
      errorRePass.value = LocaleKeys.please_enter_confirm_pass.tr;
      isValid = false;
    } else if (rePass.length < 6) {
      errorRePass.value = LocaleKeys.please_input_valid_pass.tr;
      isValid = false;
    } else {
      errorRePass.value = '';
    }

    var fullName = businessNameController.value.text;
    var phoneNumber = phoneNumberController.value.text;
    var birthDate = birthDateController.value.text;

    if (fullName.isEmpty) {
      isValid = false;
      errorBusinessName.value = LocaleKeys.please_input_your_name.tr;
    } else {
      errorBusinessName.value = '';
    }
    if (phoneNumber.isEmpty) {
      isValid = false;
      errorPhoneNumber.value = LocaleKeys.please_input_phone_number.tr;
    } else if (!Utils.validateMobile(phoneNumber)) {
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

    if (isValid && pass != rePass) {
      errorPass.value = LocaleKeys.pass_and_confirm_pass_not_match.tr;
      errorRePass.value = LocaleKeys.pass_and_confirm_pass_not_match.tr;
      isValid = false;
    }
    return isValid;
  }

  void changeHidePass() {
    isHidePass.value = !isHidePass.value;
  }

  void changeHideRePass() {
    isHideRsPass.value = !isHideRsPass.value;
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

  void handleAction(LoginAction action) {}
}
