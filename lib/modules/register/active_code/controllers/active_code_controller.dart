import 'package:docsify/app/routes/app_pages.dart';
import 'package:docsify/components/dialogs.dart';
import 'package:docsify/data/provider/user_provider.dart';
import 'package:docsify/generated/app_translation.dart';
import 'package:docsify/services/globals.dart' as globals;
import 'package:docsify/utils/log_utils.dart';
import 'package:docsify/utils/toast_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ActiveCodeController extends GetxController {
  final userProvider = UserProvider();
  final codeController = TextEditingController();
  final errorCode = ''.obs;
  String email = '';

  @override
  void onInit() {
    try {
      email = Get.arguments;
    } catch (ex) {
      email = '';
    }
    super.onInit();
  }

  @override
  void onReady() {
    getActiveEmail();
    super.onReady();
  }

  void handleActiveCode(BuildContext context) async {
    if (isValid()) {
      var code = codeController.text;
      Dialogs.showLoadingDialog(context);
      var result = await userProvider.activeCode(code);
      await Dialogs.hideLoadingDialog();
      if (result.error != null) {
        toast(result.error.toString());
      } else {
        toast(result.message.toString());
        Get.offAllNamed(Routes.LOGIN);
      }
    }
  }

  bool isValid() {
    var code = codeController.text;
    var isValid = true;
    if (code.isEmpty) {
      isValid = false;
      errorCode.value = LocaleKeys.please_input_your_code.tr;
    } else if (code.length != 6) {
      isValid = false;
      errorCode.value = LocaleKeys.please_input_valid_code.tr;
    } else {
      errorCode.value = '';
    }
    return isValid;
  }

  Future<void> getActiveEmail() async {
    var result = await userProvider.sentActiveEmail(globals.accountId);
    if (result.error != null) {
      toast(result.error.toString());
    }
  }

  Future<void> resentActiveEmail(BuildContext context) async {
    Dialogs.showLoadingDialog(context);
    var result = await userProvider.resentActiveEmail(email);
    await Dialogs.hideLoadingDialog();
    if (result.error != null) {
      toast(result.error.toString());
    } else {
      toast(result.message.toString());
    }
  }

  @override
  void onClose() {}
}
