import 'package:crunchshop/core/enums/enums.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:crunchshop/core/config/shared_preferences_keys.dart';
import 'package:crunchshop/core/themes/themes.dart';

class MyThemeController extends GetxController {
  bool isLightMode = true;

  ThemeModeType themeModeType = ThemeModeType.light;
  FontFamilyType fontType = FontFamilyType.beVietnamPro;
}

class ThemeController extends GetxController {
  bool isLightMode = true;
  ThemeModeType themeModeType = ThemeModeType.light;
  FontFamilyType fontType = FontFamilyType.beVietnamPro;
  ColorType colorType = ColorType.maroon;

  ThemeController({
    required this.themeModeType,
    required this.fontType,
    required this.colorType,
  });

  static Future<ThemeController> init() async {
    ThemeController themeProvider = ThemeController(
      colorType: await SharedPreferencesKeys().getColorType(),
      fontType: await SharedPreferencesKeys().getFontType(),
      themeModeType: await SharedPreferencesKeys().getThemeMode(),
    );
    return themeProvider;
  }

  updateThemeMode(ThemeModeType themeModeTypeData) async {
    await SharedPreferencesKeys().setThemeMode(themeModeTypeData);
    final systemBrightness = Get.context == null
        ? Brightness.light
        : MediaQuery.of(Get.context!).platformBrightness;
    checkAndSetThemeMode(
      themeModeTypeData == ThemeModeType.light
          ? Brightness.light
          : themeModeTypeData == ThemeModeType.dark
              ? Brightness.dark
              : systemBrightness,
    );
  }

// this func is auto check theme and update them
  void checkAndSetThemeMode(Brightness systemBrightness) async {
    bool theLightTheme = isLightMode;

    // mode is selected by user
    themeModeType = await SharedPreferencesKeys().getThemeMode();
    if (themeModeType == ThemeModeType.light) {
      // if mode is system then we add as system birtness
      theLightTheme = systemBrightness == Brightness.light;
    } else if (themeModeType == ThemeModeType.dark) {
      theLightTheme = false;
    } else {
      //light theme selected by user
      theLightTheme = true;
    }

    if (isLightMode != theLightTheme) {
      isLightMode = theLightTheme;
      update();
    }
  }

  void checkAndSetFonType() async {
    final FontFamilyType fontTypeData =
        await SharedPreferencesKeys().getFontType();
    if (fontTypeData != fontType) {
      fontType = fontTypeData;
      update();
    }
  }

  Future updateFontType(FontFamilyType fontTypeData) async {
    await SharedPreferencesKeys().setFontType(fontTypeData);
    fontType = fontTypeData;
    update();
  }

  Future updateColorType(ColorType colorData) async {
    await SharedPreferencesKeys().setColorType(colorData);
    colorType = colorData;
    update();
  }

  void checkAndSetColorType() async {
    final ColorType colorTypeData =
        await SharedPreferencesKeys().getColorType();
    if (colorTypeData != colorType) {
      colorType = colorTypeData;
      update();
    }
  }
}
