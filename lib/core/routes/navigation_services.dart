import 'package:flutter/material.dart';
import 'package:crunchshop/features/profile_screen/components/country_screen.dart';
import 'package:crunchshop/features/profile_screen/components/currency_screen.dart';

class NavigationServices {
  NavigationServices(this.context);

  final BuildContext context;

  Future<dynamic> _pushMaterialPageRoute(Widget widget,
      {bool fullScreenDialog = false}) async {
    return await Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => widget, fullscreenDialog: fullScreenDialog),
    );
  }

  Future gotoSplashScreen() async {
    // await Navigator.pushNamedAndRemoveUntil(
    //     context, AppRoutes.splash, (Route<dynamic> route) => false);
  }

  void gotoIntroductionScreen() {
    // Navigator.pushNamedAndRemoveUntil(
    //     context, AppRoutes.onBoardingScreen, (Route<dynamic> route) => false);
  }

  Future<dynamic> gotoCurrencyScreen() async {
    return await _pushMaterialPageRoute(const CurrencyScreen(),
        fullScreenDialog: true);
  }

  Future<dynamic> gotoCountryScreen() async {
    return await _pushMaterialPageRoute(const CountryScreen(),
        fullScreenDialog: true);
  }
}
