import 'dart:async';

import 'package:docsify/components/dialogs.dart';
import 'package:docsify/config/constant.dart';
import 'package:docsify/data/model/user_model.dart';
import 'package:docsify/data/provider/user_provider.dart';
import 'package:docsify/generated/app_translation.dart';
import 'package:docsify/services/globals.dart';
import 'package:docsify/utils/device_utils.dart';
import 'package:docsify/utils/log_utils.dart';
import 'package:docsify/utils/toast_utils.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

enum LoginAction {
  REGISTER,
  CONTACT,
  REGULATION,
  COOKIES,
  POLICY,
  FORGOT_PASSWORD
}

class LoginController extends GetxController {
  final isHidePass = true.obs;
  final emailController = TextEditingController();
  final passController = TextEditingController();
  final passFocus = FocusNode();
  final errorEmail = ''.obs;
  final errorPass = ''.obs;
  final userProvider = UserProvider();
  final _googleSignIn = GoogleSignIn(scopes: ['email']);

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void showHidePass() {
    isHidePass.value = !isHidePass.value;
  }

  void handleLoginByAccount(BuildContext context) async {
    var email = emailController.value.text;
    var pass = passController.value.text;
    bool isValid = true;
    if (email.isEmpty) {
      errorEmail.value = LocaleKeys.please_input_email.tr;
      isValid = false;
    } else if (!EmailValidator.validate(email)) {
      isValid = false;
      errorEmail.value = LocaleKeys.please_input_valid_email.tr;
    } else {
      errorEmail.value = '';
    }
    if (pass.isEmpty) {
      isValid = false;
      errorPass.value = LocaleKeys.please_input_pass.tr;
    } else if (pass.length < 6) {
      isValid = false;
      errorPass.value = LocaleKeys.please_input_valid_pass.tr;
    } else {
      errorPass.value = '';
    }
    if (isValid) {
      Dialogs.showLoadingDialog(context);
      var result = await userProvider.login(email, pass);
      Dialogs.hideLoadingDialog();
      if (result.error != null) {
        toast(result.error);
      } else if (result.data != null && result.statusCode == 200) {
        var userModel = UserResponse.fromJson(result.data['data']);
        accessToken = userModel.token;
        await GetStorage().write(StorageKey.AccountInfo, userModel.toJson());
        toast(result.message.toString());
      } else {
        toast(result.message.toString());
      }
    }
  }

  void handleGoogleSignIn(BuildContext context) {
    try {
      _googleSignIn.signIn().then((ob) async {
        var account = await ob?.authentication;
        if (account != null) {
          var token = account.accessToken;
          if (token != null) {
            Dialogs.showLoadingDialog(context);
            var result = await userProvider.googleSignIn(token);
            Dialogs.hideLoadingDialog();
            if (result.error != null) {
              toast(result.error);
            } else if (result.data != null && result.statusCode == 200) {
              var userModel = UserResponse.fromJson(result.data['data']);
              accessToken = userModel.token;
              await GetStorage()
                  .write(StorageKey.AccountInfo, userModel.toJson());
              toast(result.message.toString());
            } else {
              toast(result.message.toString());
            }
          }
        }
      });
    } catch (ex) {
      logE(ex.toString());
    }
  }

  void handleGoogleSignOut() {
    try {
      _googleSignIn.signOut();
    } catch (ex) {
      logE(ex.toString());
    }
  }

  void handleAction(LoginAction action) {
    logE(action.toString());
    switch (action) {
      case LoginAction.REGISTER:
        {
          break;
        }
      case LoginAction.CONTACT:
        {
          break;
        }
      case LoginAction.COOKIES:
        {
          break;
        }
      case LoginAction.POLICY:
        {
          break;
        }
    }
  }
}