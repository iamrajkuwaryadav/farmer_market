import 'package:crunchshop/exports/core_export.dart';
import 'package:crunchshop/features/checkout_perform_payment_screen/checkout_perform_payment_screen.dart';
import 'package:flutter/material.dart';

class AppNavigationScreen extends StatelessWidget {
  const AppNavigationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.whiteA700,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              decoration: AppDecoration.fillWhiteA700,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding:
                          getPadding(left: 20, top: 10, right: 20, bottom: 10),
                      child: Text(
                        "App Screens",
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style: AppStyle.txtRobotoRegular20,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: getPadding(left: 20),
                      child: Text(
                        "Check the app's UI",
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style: AppStyle.txtRegular16,
                      ),
                    ),
                  ),
                  Padding(
                      padding: getPadding(top: 5),
                      child: Divider(
                          height: getVerticalSize(1),
                          thickness: getVerticalSize(1),
                          color: AppColors.black900))
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  decoration: AppDecoration.fillWhiteA700,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ScreenItemListTile(
                        done: true,
                        title: "Splash Screen",
                        onTap: () {
                          Navigator.pushNamed(context, AppRoutes.splashScreen);
                        },
                      ),
                      ScreenItemListTile(
                        done: true,
                        title: "OnBoarding",
                        onTap: () {
                          Navigator.pushNamed(
                              context, AppRoutes.onboardingScreen);
                        },
                      ),
                      ScreenItemListTile(
                        done: true,
                        title: "Login",
                        onTap: () {
                          Navigator.pushNamed(context, AppRoutes.loginScreen);
                        },
                      ),
                      ScreenItemListTile(
                        done: true,
                        title: "Sign Up",
                        onTap: () {
                          Navigator.pushNamed(context, AppRoutes.signUpScreen);
                        },
                      ),
                      ScreenItemListTile(
                        done: true,
                        title: "Forget Password",
                        onTap: () {
                          Navigator.pushNamed(
                              context, AppRoutes.forgetPasswordScreen);
                        },
                      ),
                      ScreenItemListTile(
                        done: true,
                        title: "Reset Password",
                        onTap: () {
                          Navigator.pushNamed(
                              context, AppRoutes.resetPasswordScreen);
                        },
                      ),
                      ScreenItemListTile(
                        done: true,
                        title: "Home",
                        onTap: () {
                          Navigator.pushNamed(
                              context, AppRoutes.mainHomeContainerScreen);
                        },
                      ),
                      ScreenItemListTile(
                        done: true,
                        title: "WishList",
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            AppRoutes.wishlistScreen,
                          );
                        },
                      ),
                      ScreenItemListTile(
                        done: true,
                        title: "Cart Screen",
                        onTap: () {
                          Navigator.pushNamed(
                              context, AppRoutes.shoppingCartScreen);
                        },
                      ),
                      ScreenItemListTile(
                        done: true,
                        title: "Product Detail Screen",
                        onTap: () {
                          Navigator.pushNamed(
                              context, AppRoutes.productDetailScreenScreen);
                        },
                      ),
                      ScreenItemListTile(
                        done: true,
                        title: "Checkout Set Delivery Information Address",
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            AppRoutes.deliveryInformationScreen,
                          );
                        },
                      ),
                      ScreenItemListTile(
                        done: true,
                        title: "Checkout Edit Address",
                        onTap: () {
                          Navigator.pushNamed(
                              context, AppRoutes.addEditAddressScreen);
                        },
                      ),
                      ScreenItemListTile(
                        done: true,
                        title: "Checkout Add Address",
                        onTap: () {
                          Navigator.pushNamed(
                              context, AppRoutes.addEditAddressScreen);
                        },
                      ),
                      ScreenItemListTile(
                        done: true,
                        title: "Checkout Change Delivery Address",
                        onTap: () {
                          Navigator.pushNamed(
                              context, AppRoutes.deliveryAddressScreen);
                        },
                      ),
                      ScreenItemListTile(
                        done: true,
                        title: "Checkout Select Payment Method",
                        onTap: () {
                          Navigator.pushNamed(
                              context, AppRoutes.paymentMethodScreen);
                        },
                      ),
                      ScreenItemListTile(
                        done: true,
                        title: "Checkout : Perform Payment",
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const CheckoutPerformPaymentScreen(),
                            ),
                          );
                        },
                      ),
                      ScreenItemListTile(
                        done: true,
                        title: "Checkout: Verification Code",
                        onTap: () {
                          Navigator.pushNamed(
                              context, AppRoutes.verificationCodeScreen);
                        },
                      ),
                      ScreenItemListTile(
                        done: true,
                        title: "Checkout: Payment Success",
                        onTap: () {
                          Navigator.pushNamed(
                              context, AppRoutes.paymentSuccessScreen);
                        },
                      ),
                      ScreenItemListTile(
                        done: true,
                        title: "My Account Profile",
                        onTap: () {
                          Navigator.pushNamed(
                              context, AppRoutes.myAccountScreen);
                        },
                      ),
                      ScreenItemListTile(
                        done: true,
                        title: "Edit Profile",
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            AppRoutes.editProfileScreen,
                          );
                        },
                      ),
                      ScreenItemListTile(
                        done: true,
                        title: "My Orders",
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            AppRoutes.myOrdersPage,
                          );
                        },
                      ),
                      ScreenItemListTile(
                        done: true,
                        title: "Track Order",
                        onTap: () {
                          Navigator.pushNamed(
                              context, AppRoutes.trackOrderScreen);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ScreenItemListTile extends StatelessWidget {
  const ScreenItemListTile({
    super.key,
    required this.title,
    required this.onTap,
    this.done = false,
  });

  final String title;
  final VoidCallback onTap;
  final bool done;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: done ? Colors.green.shade200 : Colors.red.shade100,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: getPadding(left: 20, top: 10, right: 20, bottom: 10),
                child: Text(
                  title,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: AppStyle.txtRobotoRegular20,
                ),
              ),
            ),
            Padding(
              padding: getPadding(top: 5),
              child: Divider(
                height: getVerticalSize(1),
                thickness: getVerticalSize(1),
                color: Colors.blueGrey,
              ),
            )
          ],
        ),
      ),
    );
  }
}
