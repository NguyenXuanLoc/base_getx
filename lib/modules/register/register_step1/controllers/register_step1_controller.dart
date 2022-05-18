import 'package:docsify/app/routes/app_pages.dart';
import 'package:docsify/components/dialogs.dart';
import 'package:docsify/data/model/user_model.dart';
import 'package:docsify/data/provider/user_provider.dart';
import 'package:docsify/generated/app_translation.dart';
import 'package:docsify/modules/login/controllers/login_controller.dart';
import 'package:docsify/utils/app_utils.dart';
import 'package:docsify/utils/connection_utils.dart';
import 'package:docsify/utils/storage_utils.dart';
import 'package:docsify/utils/toast_utils.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class RegisterStep1Controller extends GetxController {
  final userProvider = UserProvider();
  final focusEmail = FocusNode();
  final focusPass = FocusNode();
  final focusRePass = FocusNode();

  final errorEmail = ''.obs;
  final errorPass = ''.obs;
  final errorRePass = ''.obs;

  final isHidePass = true.obs;
  final isHideRsPass = true.obs;
  final emailController = TextEditingController();
  final passController = TextEditingController();
  final rePassController = TextEditingController();
  final isAgreeTerm = false.obs;
  final _googleSignIn = GoogleSignIn(scopes: ['email']);

  @override
  void onClose() {}

  void checkTerm() {
    isAgreeTerm.value = !isAgreeTerm.value;
  }

  Future<void> handleRegister(BuildContext context) async {
    if (isValidInfo()) {
      Utils.hideKeyboard(context);
      var email = emailController.value.text;
      var pass = passController.value.text;
      Dialogs.showLoadingDialog(context);
      var result =
          await userProvider.registerByEmail(email, email.split('@')[0], pass);
      await Dialogs.hideLoadingDialog();
      if (result.error != null) {
        toast(result.error);
      } else {
        var userModel = UserResponse.fromJson(result.data['data']);
        await StorageUtils.saveUser(userModel);
        Get.toNamed(Routes.REGISTER_STEP2,
            arguments: emailController.value.text);
      }
    }
  }
  void showQuitDialog(BuildContext context) {
    Utils.hideKeyboard(context);
    Dialogs.showQuitForgotPassDialog(
        context, () => Get.offAllNamed(Routes.HOME));
  }

  bool isValidInfo() {
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

  void changeHidePass() {
    isHidePass.value = !isHidePass.value;
  }

  void changeHideRePass() {
    isHideRsPass.value = !isHideRsPass.value;
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
        if (userModel.profile == null) {
          Get.toNamed(Routes.REGISTER_STEP2, arguments: 'true');
        } else {
          toast(result.message.toString());
          Get.toNamed(Routes.HOME);
        }
      }
    } else {
      toast(LocaleKeys.network_error.tr);
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
              if (userModel.profile == null) {
                Get.toNamed(Routes.REGISTER_STEP2, arguments: 'true');
              } else {
                toast(result.message.toString());
                Get.toNamed(Routes.HOME);
              }
            }
          }
        }
      });
    } catch (ex) {
      toast(LocaleKeys.network_error.tr);
    }
  }
}
