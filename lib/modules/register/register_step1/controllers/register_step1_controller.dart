import 'package:docsify/components/dialogs.dart';
import 'package:docsify/data/model/user_model.dart';
import 'package:docsify/data/provider/user_provider.dart';
import 'package:docsify/generated/app_translation.dart';
import 'package:docsify/utils/log_utils.dart';
import 'package:docsify/utils/toast_utils.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterStep1Controller extends GetxController {
  final userProvider = UserProvider();
  final focusEmail = FocusNode();
  final focusPass = FocusNode();
  final focusRePass = FocusNode();
  final errorEmail = ''.obs;
  final errorPass = ''.obs;
  final errorRePass = ''.obs;
  final emailController = TextEditingController();
  final passController = TextEditingController();
  final rePassController = TextEditingController();
  final count = 0.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void increment() => count.value++;

  Future<void> handleRegister(BuildContext context) async {
    if (validInfo()) {
      Dialogs.showLoadingDialog(context);
      var result = await userProvider.registerByEmail(
          emailController.value.text,
          emailController.value.text.split('@')[0],
          passController.value.text);
      Dialogs.hideLoadingDialog();
      if (result.error != null) {
        toast(result.error);
      } else {
        var userModel = UserResponse.fromJson(result.data['data']);
        logE("LOGIN SUCCESS: ${userModel.toJson()}");
      }
    }
  }

  bool validInfo() {
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
    if (isValid && pass != rePass) {
      errorPass.value = LocaleKeys.pass_and_confirm_pass_not_match.tr;
      errorRePass.value = LocaleKeys.pass_and_confirm_pass_not_match.tr;
      isValid = false;
    }
    return isValid;
  }
}
