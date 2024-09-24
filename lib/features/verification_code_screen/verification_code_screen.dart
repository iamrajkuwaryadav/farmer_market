import 'package:crunchshop/core/helpers/pin_plus_keyboard/pin_input_controller.dart';
import 'package:crunchshop/core/helpers/pin_plus_keyboard/pin_plus_keyboard_package.dart';
import 'package:crunchshop/core/themes/themes.dart';
import 'package:crunchshop/exports/common_export.dart';

import 'package:crunchshop/exports/core_export.dart';
import 'package:crunchshop/features/payment_success_screen/payment_success_screen.dart';
import 'package:flutter/material.dart';

class VerificationCodeScreen extends StatefulWidget {
  const VerificationCodeScreen({super.key});

  @override
  State<VerificationCodeScreen> createState() => _VerificationCodeScreenState();
}

class _VerificationCodeScreenState extends State<VerificationCodeScreen> {
  PinInputController pinInputController = PinInputController(length: 4);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: CustomAppBar(
          height: getVerticalSize(87),
          leadingWidth: 40,
          leading: AppbarImage(
              height: getVerticalSize(18),
              width: getHorizontalSize(10),
              svgPath: LocalFiles.imgArrowleft,
              margin: getMargin(left: 30, top: 19, bottom: 18),
              onTap: () {
                onTapArrowleft11(context);
              }),
          centerTitle: true,
          title: AppbarSubtitle1(text: "Verification Code"),
        ),
        body: Container(
          width: double.maxFinite,
          padding: getPadding(top: 8, bottom: 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const DividerWidget(),
              CustomImageView(
                svgPath: LocalFiles.imgMail,
                height: getSize(60),
                width: getSize(60),
                margin: getMargin(top: 50),
              ),
              Padding(
                padding: getPadding(top: 29),
                child: const TextSemiBold20(title: "OTP Verification"),
              ),
              Padding(
                padding: getPadding(top: 25, bottom: 25),
                child: const Text16SemiBold(
                  title: "We have sent OTP on your number",
                ),
              ),
              Padding(
                padding: getPadding(top: 25, bottom: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text18Bold(title: "Don’t receive a OTP? "),
                    Text18BoldPrimary(
                      title: "Resend OTP",
                    ),
                  ],
                ),
              ),
              PinPlusKeyBoardPackage(
                inputsMaxWidth: 100,
                inputTextColor: AppTheme.primaryTextColor,
                inputBorderColor: AppTheme.borderColor,
                buttonBorderColor: Colors.transparent,
                btnTextColor: AppTheme.primaryTextColor,
                spacing: size.height * 0.06,
                pinInputController: pinInputController,
                onSubmit: () {
                  /// ignore: avoid_print
                  print("Text is : ${pinInputController.text}");

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PaymentSuccessScreen(),
                    ),
                  );
                },
                keyboardFontFamily: '',
                cancelColor: AppTheme.primaryTextColor,
                doneButton: Icon(
                  Icons.done,
                  color: AppTheme.primaryTextColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  onTapArrowleft11(BuildContext context) {
    Navigator.pop(context);
  }
}
