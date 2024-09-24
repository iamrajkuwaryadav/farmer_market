import 'package:crunchshop/exports/core_export.dart';
import 'package:crunchshop/features/home_page/home_page.dart';
import 'package:crunchshop/features/home_page/widgets/app_drawer.dart';
import 'package:crunchshop/features/profile_screen/profile_screen.dart';
import 'package:crunchshop/features/shopping_cart_screen/shopping_cart_screen.dart';
import 'package:crunchshop/features/wishlist_screen/wishlist_screen.dart';
import 'package:crunchshop/widgets/custom_bottom_bar.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class HomeBottomNavContainer extends StatelessWidget {
  final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  HomeBottomNavContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _drawerKey,
        drawer: const Drawer(child: AppDrawer()),
        body: Navigator(
          key: navigatorKey,
          initialRoute: AppRoutes.mainHomePage,
          onGenerateRoute: (routeSetting) => PageRouteBuilder(
            pageBuilder: (ctx, ani, ani1) => getCurrentPage(routeSetting.name!),
            transitionDuration: const Duration(
              seconds: 0,
            ),
          ),
        ),
        bottomNavigationBar: CustomBottomBar(
          onChanged: (BottomBarEnum type) {
            Navigator.pushNamed(
              navigatorKey.currentContext!,
              getCurrentRoute(type),
            );
          },
        ),
      ),
    );
  }

  ///Handling route based on bottom click actions
  String getCurrentRoute(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.Home:
        return AppRoutes.mainHomePage;
      case BottomBarEnum.WishList:
        return AppRoutes.wishlistScreen;
      case BottomBarEnum.Cart:
        return AppRoutes.shoppingCartScreen;
      case BottomBarEnum.Account:
        return AppRoutes.myAccountScreen;
      default:
        return "/";
    }
  }

  ///Handling page based on route
  Widget getCurrentPage(String currentRoute) {
    switch (currentRoute) {
      case AppRoutes.mainHomePage:
        return const HomePage();
      case AppRoutes.wishlistScreen:
        return const WishlistScreen();
      case AppRoutes.shoppingCartScreen:
        return const ShoppingCartScreen();
      case AppRoutes.myAccountScreen:
        return const ProfileScreen();
      default:
        return const DefaultWidget();
    }
  }
}
