import 'package:docsify/components/dialogs.dart';
import 'package:docsify/data/provider/user_provider.dart';
import 'package:docsify/generated/app_translation.dart';
import 'package:docsify/utils/toast_utils.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPassController extends GetxController {
  var emailController = TextEditingController();
  var errorEmail = ''.obs;
  var userProvider = UserProvider();

  @override
  void onClose() {}

  void handleForgotPass(BuildContext context) async {
    var email = emailController.value.text;
    bool isValid = true;
    if (email.isEmpty) {
      errorEmail.value = LocaleKeys.please_input_email.tr;
      isValid = false;
    } else if (!EmailValidator.validate(email)) {
      isValid = false;
      errorEmail.value = LocaleKeys.please_input_valid_email.tr;
    }
    if (isValid) {
      Dialogs.showLoadingDialog(context);
      errorEmail.value = '';
      var result = await userProvider.forgotPass(email);
      Dialogs.hideLoadingDialog();
      if (result.error != null) {
        toast(result.error);
      } else if (result.message != null) {
        toast(result.message.toString());
      }
    }
  }
}
