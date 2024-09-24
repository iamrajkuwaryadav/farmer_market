import 'dart:io';

import 'package:crunchshop/core/models/language_model.dart';
import 'package:crunchshop/core/routes/app_routes.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:crunchshop/core/controllers/localization_controller.dart';
import 'package:crunchshop/core/controllers/theme_controller.dart';
import 'package:crunchshop/core/themes/themes.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

var globalMessengerKey = GlobalKey<ScaffoldMessengerState>();

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<Loc>(
      builder: (locController) {
        return GetBuilder<ThemeController>(
          builder: (controller) {
            final ThemeData theme = AppTheme.getThemeData;
            return MaterialApp(
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              supportedLocales: getLocalesFromLanguageModels(),
              navigatorKey: navigatorKey,
              locale: locController.locale,
              title: 'Crunch Shop',
              debugShowCheckedModeBanner: false,
              theme: theme,
              routes: AppRoutes.routes,
              initialRoute: AppRoutes.appNavigationScreen,
              builder: (BuildContext context, Widget? child) {
                _setFirstTimeSomeData(context, theme);
                return Directionality(
                  textDirection: locController.locale.languageCode == 'ar'
                      ? TextDirection.rtl
                      : TextDirection.ltr,
                  child: MediaQuery(
                    key: ValueKey(
                        'languageCode ${locController.locale.languageCode}'),
                    data: MediaQuery.of(context).copyWith(
                      textScaleFactor: MediaQuery.of(context).size.width > 360
                          ? 1.0
                          : MediaQuery.of(context).size.width >= 340
                              ? 0.9
                              : 0.8,
                    ),
                    child: child ?? const SizedBox(),
                  ),
                );
              },
            );
          },
        );
      },
    );
  }

// when this application open every time on that time we check and update some theme data
  void _setFirstTimeSomeData(BuildContext context, ThemeData theme) {
    _setStatusBarNavigationBarTheme(theme);
    //we call some theme basic data set in app like color, font, theme mode, language
    Get.find<ThemeController>()
        .checkAndSetThemeMode(MediaQuery.of(context).platformBrightness);
  }

  void _setStatusBarNavigationBarTheme(ThemeData themeData) {
    final brightness = !kIsWeb && Platform.isAndroid
        ? themeData.brightness == Brightness.light
            ? Brightness.dark
            : Brightness.light
        : themeData.brightness;
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: brightness,
      statusBarBrightness: brightness,
      systemNavigationBarColor: themeData.colorScheme.background,
      systemNavigationBarDividerColor: Colors.transparent,
      systemNavigationBarIconBrightness: brightness,
    ));
  }
}
