import 'package:crunchshop/core/models/address_model.dart';
import 'package:crunchshop/core/models/product_model.dart';
import 'package:crunchshop/features/my_orders_screen/my_orders_screen.dart';
import 'package:crunchshop/features/shopping_cart_screen/shopping_cart_screen.dart';
import 'package:crunchshop/features/onboarding/onboarding_screen.dart';
import 'package:crunchshop/features/product_search_result/product_search_result.dart';
import 'package:crunchshop/features/splash_screen/theme_splash_screen.dart';
import 'package:crunchshop/features/wishlist_screen/wishlist_screen.dart';
import 'package:flutter/material.dart';
import 'package:crunchshop/features/login_screen/login_screen.dart';
import 'package:crunchshop/features/sign_up_screen/sign_up_screen.dart';
import 'package:crunchshop/features/forget_password_screen/forget_password_screen.dart';
import 'package:crunchshop/features/reset_password_screen/reset_password_screen.dart';
import 'package:crunchshop/features/home_container/home_bottom_nav_container.dart';
import 'package:crunchshop/features/product_detail_screen/product_detail_screen.dart';
import 'package:crunchshop/features/checkout_delivery_information_screen/checkout_delivery_information_screen.dart';
import 'package:crunchshop/features/add_edit_address_screen/add_edit_address_screen.dart';
import 'package:crunchshop/features/select_delivery_address_screen/select_delivery_address_screen.dart';
import 'package:crunchshop/features/checkout_payment_method_screen/checkout_payment_method_screen.dart';
import 'package:crunchshop/features/checkout_perform_payment_screen/checkout_perform_payment_screen.dart';
import 'package:crunchshop/features/verification_code_screen/verification_code_screen.dart';
import 'package:crunchshop/features/payment_success_screen/payment_success_screen.dart';
import 'package:crunchshop/features/profile_screen/profile_screen.dart';
import 'package:crunchshop/features/edit_profile_screen/edit_profile_screen.dart';
import 'package:crunchshop/features/track_order_screen/track_order_screen.dart';
import 'package:crunchshop/features/app_navigation_screen/app_navigation_screen.dart';

class AppRoutes {
  static const String splashScreen = '/splash_screen';
  static const String onboardingScreen = '/onboarding_screen';
  static const String loginScreen = '/login_screen';
  static const String signUpScreen = '/sign_up_screen';
  static const String forgetPasswordScreen = '/forget_password_screen';
  static const String resetPasswordScreen = '/reset_password_screen';
  static const String mainHomePage = '/main_home_page';
  static const String mainHomeContainerScreen = '/main_home_container_screen';
  static const String productDetailScreenScreen = '/product_page_one_screen';
  static const String wishlistScreen = '/wishlist_page';
  static const String shoppingCartScreen = '/ShoppingCartScreen';
  static const String deliveryInformationScreen =
      '/delivery_information_screen';
  static const String addEditAddressScreen = '/AddEditAddressScreen';
  static const String deliveryAddressScreen = '/delivery_address_screen';
  static const String paymentMethodScreen = '/payment_method_screen';
  static const String checkoutPerformPaymentScreen =
      '/CheckoutPerformPaymentScreen';
  static const String verificationCodeScreen = '/verification_code_screen';
  static const String paymentSuccessScreen = '/payment_success_screen';
  static const String myAccountScreen = '/my_account_screen';
  static const String editProfileScreen = '/edit_profile_screen';
  static const String myOrdersPage = '/my_orders_page';
  static const String trackOrderScreen = '/track_order_screen';
  static const String productsSearchResult = 'ProductSearchResult';
  static const String appNavigationScreen = '/app_navigation_screen';

  static Map<String, WidgetBuilder> routes = {
    splashScreen: (context) => const SplashScreen(),
    onboardingScreen: (context) => const OnBoardingScreen(),
    loginScreen: (context) => const LoginScreen(),
    signUpScreen: (context) => const SignUpScreen(),
    forgetPasswordScreen: (context) => const ForgetPasswordScreen(),
    resetPasswordScreen: (context) => const ResetPasswordScreen(),
    mainHomeContainerScreen: (context) => HomeBottomNavContainer(),
    shoppingCartScreen: (context) => const ShoppingCartScreen(),
    productsSearchResult: (context) => const ProductSearchResult(),
    productDetailScreenScreen: (context) => ProductDetailScreen(
          productModel: productsList[0],
        ),
    deliveryInformationScreen: (context) =>
        const CheckoutDeliveryInformationScreen(),
    addEditAddressScreen: (context) =>
        AddEditAddressScreen(addressModel: deliveryAddressesList[0]),
    deliveryAddressScreen: (context) => const SelectDeliveryAddressScreen(),
    paymentMethodScreen: (context) => const CheckoutPaymentMethodScreen(),
    checkoutPerformPaymentScreen: (context) =>
        const CheckoutPerformPaymentScreen(),
    verificationCodeScreen: (context) => const VerificationCodeScreen(),
    paymentSuccessScreen: (context) => const PaymentSuccessScreen(),
    myAccountScreen: (context) => const ProfileScreen(),
    editProfileScreen: (context) => const EditProfileScreen(),
    trackOrderScreen: (context) => TrackOrderScreen(),
    wishlistScreen: (context) => const WishlistScreen(),
    myOrdersPage: (context) => const MyOrdersScreen(),
    appNavigationScreen: (context) => const AppNavigationScreen()
  };
}
