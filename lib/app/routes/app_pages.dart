import 'package:get/get.dart';

import '../../modules/forgot_pass/bindings/forgot_pass_binding.dart';
import '../../modules/forgot_pass/views/forgot_pass_view.dart';
import '../../modules/home/bindings/home_binding.dart';
import '../../modules/home/views/home_view.dart';
import '../../modules/login/bindings/login_binding.dart';
import '../../modules/login/views/login_view.dart';
import '../../modules/register/active_code/bindings/active_code_binding.dart';
import '../../modules/register/active_code/views/active_code_view.dart';
import '../../modules/register/register_step1/bindings/register_step1_binding.dart';
import '../../modules/register/register_step1/bindings/register_step1_binding.dart';
import '../../modules/register/register_step1/views/register_step1_view.dart';
import '../../modules/register/register_step1/views/register_step1_view.dart';
import '../../modules/register/register_step2/bindings/register_step2_binding.dart';
import '../../modules/register/register_step2/views/register_step2_view.dart';
import '../../modules/splash/bindings/splash_binding.dart';
import '../../modules/splash/views/splash_view.dart';
import '../../modules/test/bindings/test_binding.dart';
import '../../modules/test/views/test_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LOGIN;

  static final routes = [
    GetPage(
      transition: Transition.rightToLeft,
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      transition: Transition.rightToLeft,
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      transition: Transition.rightToLeft,
      name: _Paths.TEST,
      page: () => TestView(),
      binding: TestBinding(),
    ),
    GetPage(
      transition: Transition.rightToLeft,
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      transition: Transition.rightToLeft,
      name: _Paths.FORGOT_PASS,
      page: () => ForgotPassView(),
      binding: ForgotPassBinding(),
    ),
    GetPage(
      transition: Transition.rightToLeft,
      name: _Paths.REGISTER_STEP1,
      page: () => RegisterStep1View(),
      binding: RegisterStep1Binding(),
    ),
    GetPage(
      transition: Transition.rightToLeft,
      name: _Paths.REGISTER_STEP2,
      page: () => RegisterStep2View(),
      binding: RegisterStep2Binding(),
    ),
    GetPage(
      transition: Transition.rightToLeft,
      name: _Paths.ACTIVE_CODE,
      page: () => ActiveCodeView(),
      binding: ActiveCodeBinding(),
    ),
  ];
}
