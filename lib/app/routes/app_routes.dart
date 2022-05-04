part of 'app_pages.dart';

abstract class Routes {
  Routes._();

  static const HOME = _Paths.HOME;
  static const SPLASH = _Paths.SPLASH;
  static const TEST = _Paths.TEST;
}

abstract class _Paths {
  _Paths._();

  static const HOME = '/home';
  static const SPLASH = '/splash';
  static const TEST = '/test';
}
