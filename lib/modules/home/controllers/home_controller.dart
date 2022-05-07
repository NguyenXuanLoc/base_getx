import 'dart:async';

import 'package:docsify/components//dialogs.dart';
import 'package:docsify/config/constant.dart';
import 'package:docsify/data/model/user_model.dart';
import 'package:docsify/data/provider/user_provider.dart';
import 'package:docsify/services/globals.dart';

import 'package:docsify/utils/log_utils.dart';
import 'package:docsify/utils/storage_utils.dart';
import 'package:docsify/utils/toast_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

class HomeController extends GetxController {
  var isCheck = true.obs;
  var testController = ScrollController();
  var isLoading = false;
  var itemCount = 30.obs;
  final count = 0.obs;

  final _googleSignIn = GoogleSignIn(scopes: ['email']);
  final userProvider = UserProvider();

  @override
  void onInit() {
    super.onInit();
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
            await Dialogs.hideLoadingDialog();
            if (result.error != null) {
              toast(result.error);
            } else if (result.data != null && result.statusCode == 200) {
              var userModel = UserResponse.fromJson(result.data['data']);
              await StorageUtils.saveUser(userModel);
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

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void showDialog(BuildContext context) {
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      Dialogs.showLoadingDialog(context);
      Timer(Duration(seconds: 1), () => Dialogs.hideLoadingDialog());
    });
  }

  void increment() => count.value++;
}
