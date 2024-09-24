import 'dart:async';

import 'package:crunchshop/core/controllers/localization_controller.dart';
import 'package:crunchshop/core/themes/themes.dart';
import 'package:crunchshop/exports/core_export.dart';
import 'package:crunchshop/features/home_page/home_page.dart';
import 'package:flutter/material.dart';

class PaymentSuccessScreen extends StatefulWidget {
  const PaymentSuccessScreen({super.key});

  @override
  State<PaymentSuccessScreen> createState() => _PaymentSuccessScreenState();
}

class _PaymentSuccessScreenState extends State<PaymentSuccessScreen> {
  void navigator() {
    Navigator.of(context).pushReplacement(
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => const HomePage(),
        transitionDuration: const Duration(milliseconds: 2000),
        transitionsBuilder: (_, Animation<double> animation, __, Widget child) {
          return Opacity(
            opacity: animation.value,
            child: child,
          );
        },
      ),
    );
  }

  /// Set timer splash
  _timer() async {
    return Timer(const Duration(milliseconds: 5300), navigator);
  }

  @override
  void initState() {
    super.initState();
    _timer();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Card(
                clipBehavior: Clip.antiAlias,
                elevation: 0,
                margin: getMargin(
                  top: 2,
                ),
                color: AppColors.deepOrangeA400,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(getHorizontalSize(88)),
                ),
                child: Container(
                  height: getSize(
                    176,
                  ),
                  width: getSize(
                    176,
                  ),
                  padding: getPadding(
                    left: 44,
                    top: 46,
                    right: 44,
                    bottom: 46,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.deepOrangeA400,
                    borderRadius: BorderRadius.circular(getHorizontalSize(88)),
                  ),
                  child: Stack(
                    children: [
                      CustomImageView(
                        svgPath: LocalFiles.imgCheckmark,
                        height: getVerticalSize(
                          67,
                        ),
                        width: getHorizontalSize(
                          80,
                        ),
                        alignment: Alignment.topRight,
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: getPadding(
                  top: 52,
                ),
                child: Text(
                  Loc.alized.lbl_payment_success,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontSize: 26,
                        color: AppTheme.primaryTextColor,
                      ),
                ),
              ),
              Padding(
                padding: getPadding(
                  top: 8,
                ),
                child: Text(
                  Loc.alized.msg_your_order_placed,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontSize: 20,
                        color: Colors.grey,
                      ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
