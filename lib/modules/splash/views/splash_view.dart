import 'package:docsify/components//app_scalford.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.routerHome();
    return const AppScaffold(
        body: Center(
      child: Text(
        'SplashView is working',
        style: TextStyle(fontSize: 20),
      ),
    ));
  }
}
