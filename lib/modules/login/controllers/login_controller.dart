import 'dart:async';

import 'package:docsify/app/routes/app_pages.dart';
import 'package:docsify/components/dialogs.dart';
import 'package:docsify/config/constant.dart';
import 'package:docsify/data/model/user_model.dart';
import 'package:docsify/data/provider/user_provider.dart';
import 'package:docsify/generated/app_translation.dart';
import 'package:docsify/utils/app_utils.dart';
import 'package:docsify/utils/connection_utils.dart';
import 'package:docsify/utils/log_utils.dart';
import 'package:docsify/utils/storage_utils.dart';
import 'package:docsify/utils/toast_utils.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

enum LoginAction {
  REGISTER,
  CONTACT,
  REGULATION,
  COOKIES,
  POLICY,
  FORGOT_PASSWORD,
  GO_TO_PROVIDER
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
  void onClose() {}

  void showHidePass() {
    isHidePass.value = !isHidePass.value;
  }

  void handleLoginByAccount(BuildContext context) async {
    var email = emailController.value.text.replaceAll(' ', '');
    emailController.text=email;
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
      await Dialogs.hideLoadingDialog();
      if (result.error != null) {
        toast(result.error);
        if (result.error == MessageKey.need_active_account) {
          Dialogs.showActiveCode(
              emailController.value.text.replaceAll(" ", ""), context, () {});
        }
      } else if (result.data != null) {
        var userModel = UserResponse.fromJson(result.data['data']);
        if(userModel.role == MessageKey.user){
          await StorageUtils.saveUser(userModel);
          toast(result.message.toString());
          Get.toNamed(Routes.HOME);
        }else {
          toast(result.message.toString());
        }
      }
    }
  }

  void showQuitDialog(BuildContext context) {
    Utils.hideKeyboard(context);
    Get.back();
  }

  Future<void> handleLogoutByFacebook() async {
    await FacebookAuth.instance.logOut();
  }

  Future<void> handleFacebookSignIn(BuildContext context) async {
    if (await ConnectionUtils.isConnect() == false) {
      toast(LocaleKeys.network_error.tr);
      return;
    }

    final LoginResult loginResponse =
        await FacebookAuth.instance.login(permissions: ['email']);
    if (loginResponse.status == LoginStatus.success &&
        loginResponse.accessToken?.token != null) {
      Dialogs.showLoadingDialog(context);
      var result =
          await userProvider.facebookSignIn(loginResponse.accessToken!.token);
      await Dialogs.hideLoadingDialog();
      if (result.error != null) {
        toast(result.error);
      } else if (result.data != null) {
        var userModel = UserResponse.fromJson(result.data['data']);
        await StorageUtils.saveUser(userModel);
        toast(result.message.toString());
        Get.toNamed(Routes.HOME);
      }
    } else {
      toast(LocaleKeys.network_error.tr);
      logD("${loginResponse.status}\n${loginResponse.message}");
    }
  }

  Future<void> handleGoogleSignIn(BuildContext context) async {
    try {
      if (await ConnectionUtils.isConnect() == false) {
        toast(LocaleKeys.network_error.tr);
        return;
      }
      _googleSignIn.signIn().then((ob) async {
        var account = await ob?.authentication;
        if (account != null) {
          var token = account.accessToken;
          if (token != null) {
            Dialogs.showLoadingDialog(context);
            var result = await userProvider.googleSignIn(token);
            await Dialogs.hideLoadingDialog();
            if (result.error != null) {
              toast(result.error);
            } else if (result.data != null) {
              var userModel = UserResponse.fromJson(result.data['data']);
              await StorageUtils.saveUser(userModel);
              toast(result.message.toString());
              Get.toNamed(Routes.HOME);
            }
          }
        }
      });
    } catch (ex) {
      toast(LocaleKeys.network_error.tr);
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
    switch (action) {
      case LoginAction.REGISTER:
        {
          Get.toNamed(Routes.REGISTER_STEP1);
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
      case LoginAction.FORGOT_PASSWORD:
        {
          Get.toNamed(Routes.FORGOT_PASS);
          break;
        }
      case LoginAction.GO_TO_PROVIDER:
        {
          logE("GO TO PROVIDER");
          break;
        }
    }
  }
}
