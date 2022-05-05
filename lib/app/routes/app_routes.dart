part of 'app_pages.dart';

abstract class Routes {
  Routes._();

  static const HOME = _Paths.HOME;
  static const SPLASH = _Paths.SPLASH;
  static const TEST = _Paths.TEST;
  static const LOGIN = _Paths.LOGIN;
  static const FORGOT_PASS = _Paths.FORGOT_PASS;
}

abstract class _Paths {
  _Paths._();

  static const HOME = '/home';
  static const SPLASH = '/splash';
  static const TEST = '/test';
  static const LOGIN = '/login';
  static const FORGOT_PASS = '/forgot-pass';
}
