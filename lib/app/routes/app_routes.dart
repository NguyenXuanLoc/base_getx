part of 'app_pages.dart';

abstract class Routes {
  Routes._();

  static const HOME = _Paths.HOME;
  static const SPLASH = _Paths.SPLASH;
  static const TEST = _Paths.TEST;
  static const LOGIN = _Paths.LOGIN;
  static const FORGOT_PASS = _Paths.FORGOT_PASS;
  static const REGISTER_STEP1 = _Paths.REGISTER_STEP1;
  static const REGISTER_STEP2 = _Paths.REGISTER_STEP2;
  static const ACTIVE_CODE = _Paths.ACTIVE_CODE;
}

abstract class _Paths {
  _Paths._();

  static const HOME = '/home';
  static const SPLASH = '/splash';
  static const TEST = '/test';
  static const LOGIN = '/login';
  static const FORGOT_PASS = '/forgot-pass';
  static const REGISTER_STEP1 = '/register-step1';
  static const REGISTER_STEP2 = '/register-step2';
  static const ACTIVE_CODE = '/active-code';
}
