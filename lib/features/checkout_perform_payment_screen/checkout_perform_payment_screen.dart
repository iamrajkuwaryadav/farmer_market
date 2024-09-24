import 'package:crunchshop/core/controllers/localization_controller.dart';
import 'package:crunchshop/core/helpers/flutter_credit_card/credit_card_brand.dart';
import 'package:crunchshop/core/helpers/flutter_credit_card/credit_card_form.dart';
import 'package:crunchshop/core/helpers/flutter_credit_card/credit_card_model.dart';
import 'package:crunchshop/core/helpers/flutter_credit_card/credit_card_widget.dart';
import 'package:crunchshop/core/helpers/flutter_credit_card/custom_card_type_icon.dart';
import 'package:crunchshop/core/themes/themes.dart';
import 'package:crunchshop/exports/common_export.dart';
import 'package:crunchshop/exports/core_export.dart';
import 'package:crunchshop/features/verification_code_screen/verification_code_screen.dart';
import 'package:flutter/material.dart';

class CheckoutPerformPaymentScreen extends StatefulWidget {
  const CheckoutPerformPaymentScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return CheckoutPerformPaymentScreenState();
  }
}

class CheckoutPerformPaymentScreenState
    extends State<CheckoutPerformPaymentScreen> {
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;
  bool useGlassMorphism = false;
  bool useBackgroundImage = false;
  OutlineInputBorder? border;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    border = OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.grey.withOpacity(0.7),
        width: 2.0,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: CustomAppBar(
        height: getVerticalSize(87),
        leadingWidth: 40,
        leading: AppbarImage(
          height: getVerticalSize(18),
          width: getHorizontalSize(10),
          svgPath: LocalFiles.imgArrowleft,
          margin: getMargin(left: 30, top: 19, bottom: 18),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title: AppbarSubtitle1(text: Loc.alized.lbl_checkout),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            const DividerWidget(),
            const SizedBox(
              height: 30,
            ),
            CreditCardWidget(
              cardNumber: cardNumber,
              expiryDate: expiryDate,
              cardHolderName: cardHolderName,
              cvvCode: cvvCode,
              bankName: 'Axis Bank',
              showBackView: isCvvFocused,
              obscureCardNumber: true,
              obscureCardCvv: true,
              isHolderNameVisible: true,
              backgroundImage: 'assets/images/atm-card-bg.png',
              isSwipeGestureEnabled: true,
              onCreditCardWidgetChange: (CreditCardBrand creditCardBrand) {},
              customCardTypeIcons: <CustomCardTypeIcon>[
                CustomCardTypeIcon(
                  cardType: CardType.mastercard,
                  cardImage: Image.asset(
                    'assets/icons/mastercard.png',
                    height: 48,
                    width: 48,
                  ),
                ),
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    CreditCardForm(
                      formKey: formKey,
                      obscureCvv: true,
                      obscureNumber: true,
                      cardNumber: cardNumber,
                      cvvCode: cvvCode,
                      isHolderNameVisible: true,
                      isCardNumberVisible: true,
                      isExpiryDateVisible: true,
                      cardHolderName: cardHolderName,
                      expiryDate: expiryDate,
                      themeColor: AppTheme.primaryColor,
                      textColor: AppTheme.isLightMode
                          ? AppTheme.primaryTextColor
                          : Colors.white,
                      cardNumberDecoration: InputDecoration(
                        //labelText: 'Number',
                        hintText: 'Card Number',
                        hintStyle: _setFontStyle(),
                        border: _setBorderStyle(),
                        enabledBorder: _setBorderStyle(),
                        focusedBorder: _setBorderStyle(),
                        disabledBorder: _setBorderStyle(),
                        isDense: true,
                        contentPadding: getPadding(all: 18),
                      ),
                      expiryDateDecoration: InputDecoration(
                        // labelText: 'Expired Date',
                        hintText: 'Expired Date',
                        hintStyle: _setFontStyle(),
                        border: _setBorderStyle(),
                        enabledBorder: _setBorderStyle(),
                        focusedBorder: _setBorderStyle(),
                        disabledBorder: _setBorderStyle(),
                        isDense: true,
                        contentPadding: getPadding(all: 18),
                      ),
                      cvvCodeDecoration: InputDecoration(
                        // labelText: 'CVV',
                        hintText: 'CVV',
                        hintStyle: _setFontStyle(),
                        border: _setBorderStyle(),
                        enabledBorder: _setBorderStyle(),
                        focusedBorder: _setBorderStyle(),
                        disabledBorder: _setBorderStyle(),
                        isDense: true,
                        contentPadding: getPadding(all: 18),
                      ),
                      cardHolderDecoration: InputDecoration(
                        // labelText: 'Card Holder',
                        hintText: 'Card Holder Name',
                        hintStyle: _setFontStyle(),
                        border: _setBorderStyle(),
                        enabledBorder: _setBorderStyle(),
                        focusedBorder: _setBorderStyle(),
                        disabledBorder: _setBorderStyle(),
                        isDense: true,
                        contentPadding: getPadding(all: 18),
                      ),
                      onCreditCardModelChange: onCreditCardModelChange,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomButton(
        height: getVerticalSize(55),
        text: Loc.alized.lbl_pay_now,
        margin: getMargin(left: 30, right: 30, bottom: 38),
        shape: ButtonShape.Square,
        onTap: () {
          if (formKey.currentState!.validate()) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const VerificationCodeScreen(),
              ),
            );
          } else {
            print('invalid!');
          }
        },
      ),
    );
  }

  void onCreditCardModelChange(CreditCardModel? creditCardModel) {
    setState(() {
      cardNumber = creditCardModel!.cardNumber;
      expiryDate = creditCardModel.expiryDate;
      cardHolderName = creditCardModel.cardHolderName;
      cvvCode = creditCardModel.cvvCode;
      isCvvFocused = creditCardModel.isCvvFocused;
    });
  }

  _setFontStyle() {
    return TextStyle(
      color: Theme.of(context).hintColor,
      fontSize: getFontSize(16),
      fontWeight: FontWeight.w400,
    );
  }

  _setBorderStyle() {
    return OutlineInputBorder(
      borderSide: BorderSide(
        color: AppTheme.borderColor,
        width: 1,
      ),
    );
  }
}
