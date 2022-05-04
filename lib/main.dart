import 'dart:io';

import 'package:docsify/config/constant.dart';
import 'package:docsify/generated/app_translation.dart';
import 'package:docsify/utils/log_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app/routes/app_pages.dart';

void main() async {
  await configApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context) => GetMaterialApp(
        initialRoute: AppPages.INITIAL,
        getPages: AppPages.routes,
        theme: ThemeData(
          textTheme: GoogleFonts.mulishTextTheme(),
          backgroundColor: Colors.white,
          primaryColor: Colors.white,
          bottomAppBarColor: Colors.yellow,
          dividerColor: Colors.transparent,
          shadowColor: Colors.transparent,
          appBarTheme: const AppBarTheme(elevation: 0),
        ),
        defaultTransition: Transition.native,
        translations: AppTranslation(),
        locale: Get.deviceLocale,
        fallbackLocale: AppTranslation.fallbackLocale,
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

Future<void> configApp() async {
  HttpOverrides.global = MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();
  configOrientation();
  await GetStorage.init();
  await dotenv.load(fileName: '.env.dev');
}

void configOrientation() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
}
