import 'package:crunchshop/core/controllers/localization_controller.dart';
import 'package:crunchshop/core/models/address_model.dart';
import 'package:crunchshop/exports/common_export.dart';
import 'package:crunchshop/exports/core_export.dart';
import 'package:crunchshop/features/add_edit_address_screen/add_edit_address_screen.dart';
import 'package:crunchshop/features/checkout_delivery_information_screen/widgets/address_box_widget.dart';
import 'package:crunchshop/features/checkout_perform_payment_screen/checkout_perform_payment_screen.dart';
import 'package:flutter/material.dart';

class CheckoutPaymentMethodScreen extends StatefulWidget {
  const CheckoutPaymentMethodScreen({super.key});

  @override
  State<CheckoutPaymentMethodScreen> createState() =>
      _CheckoutPaymentMethodScreenState();
}

class _CheckoutPaymentMethodScreenState
    extends State<CheckoutPaymentMethodScreen> {
  String _selectedValue = '';

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
              margin: getMargin(left: 30, top: 17, bottom: 20),
              onTap: () {
                onTapArrowleft9(context);
              }),
          centerTitle: true,
          title: AppbarSubtitle1(text: Loc.alized.lbl_payment_method),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const DividerWidget(),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: getPadding(left: 30, top: 31, bottom: 30),
                  child: TextSemiBold20(
                    title: Loc.alized.msg_delivery_information,
                  ),
                ),
              ),
              AddressBoxWidget(
                addressModel: deliveryAddressesList[0],
                widthPercentage: 0.90,
                onTapEditIcon: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddEditAddressScreen(
                        addressModel: deliveryAddressesList[0],
                      ),
                    ),
                  );
                },
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: getPadding(left: 30, top: 61),
                  child: TextSemiBold20(
                    title: Loc.alized.lbl_payment_method,
                  ),
                ),
              ),
              Card(
                margin: getPadding(left: 16, top: 14, right: 16, bottom: 14),
                child: RadioListTile(
                  title: Row(
                    children: [
                      CustomImageView(
                        svgPath: LocalFiles.imgCard,
                        height: getVerticalSize(24),
                        width: getHorizontalSize(32),
                        margin: getMargin(left: 4),
                      ),
                      const SizedBox(width: 10),
                      const Text16SemiBold(title: "Debit/Credit card"),
                    ],
                  ),
                  value: 'Debit/Credit card',
                  groupValue: _selectedValue,
                  controlAffinity: ListTileControlAffinity.trailing,
                  visualDensity: VisualDensity.standard.copyWith(
                    vertical: 2.0,
                    horizontal: 2.0,
                  ),
                  onChanged: (value) {
                    setState(() {
                      _selectedValue = value!;
                    });
                  },
                ),
              ),
              Card(
                margin: getPadding(left: 16, top: 14, right: 16, bottom: 14),
                child: RadioListTile(
                  title: Row(
                    children: [
                      CustomImageView(
                        imagePath: LocalFiles.imgIconIndigo800,
                        height: getVerticalSize(24),
                        width: getHorizontalSize(24),
                        margin: getMargin(left: 4),
                      ),
                      const SizedBox(width: 10),
                      const Text16SemiBold(title: "Paypal"),
                    ],
                  ),
                  value: 'Paypal',
                  groupValue: _selectedValue,
                  controlAffinity: ListTileControlAffinity.trailing,
                  visualDensity: VisualDensity.standard.copyWith(
                    vertical: 2.0,
                    horizontal: 2.0,
                  ),
                  onChanged: (value) {
                    setState(() {
                      _selectedValue = value!;
                    });
                  },
                ),
              ),
              Card(
                margin: getPadding(left: 16, top: 14, right: 16, bottom: 14),
                child: RadioListTile(
                  title: Row(
                    children: [
                      CustomImageView(
                        svgPath: LocalFiles.imgLock,
                        height: getVerticalSize(24),
                        width: getHorizontalSize(24),
                        margin: getMargin(left: 4),
                      ),
                      const SizedBox(width: 10),
                      const Text16SemiBold(title: "Amazon Pay"),
                    ],
                  ),
                  value: 'Amazon Pay',
                  groupValue: _selectedValue,
                  controlAffinity: ListTileControlAffinity.trailing,
                  visualDensity: VisualDensity.standard.copyWith(
                    vertical: 2.0,
                    horizontal: 2.0,
                  ),
                  onChanged: (value) {
                    setState(() {
                      _selectedValue = value!;
                    });
                  },
                ),
              ),
              Card(
                margin: getPadding(left: 16, top: 14, right: 16, bottom: 14),
                child: RadioListTile(
                  title: Row(
                    children: [
                      CustomImageView(
                        imagePath: LocalFiles.cashOnDeliveryIcon,
                        height: getVerticalSize(30),
                        width: getHorizontalSize(24),
                        margin: getMargin(left: 4),
                      ),
                      const SizedBox(width: 10),
                      const Text16SemiBold(title: "Cash On Delivery"),
                    ],
                  ),
                  value: "Cash On Delivery",
                  groupValue: _selectedValue,
                  controlAffinity: ListTileControlAffinity.trailing,
                  visualDensity: VisualDensity.standard.copyWith(
                    vertical: 2.0,
                    horizontal: 2.0,
                  ),
                  onChanged: (value) {
                    setState(() {
                      _selectedValue = value!;
                    });
                  },
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: CustomButton(
          height: getVerticalSize(55),
          text: "Checkout",
          margin: getMargin(left: 30, right: 30, bottom: 38),
          shape: ButtonShape.Square,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const CheckoutPerformPaymentScreen(),
              ),
            );
          },
        ),
      ),
    );
  }

  onTapImgOffer(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.addEditAddressScreen);
  }

  onTapArrowleft9(BuildContext context) {
    Navigator.pop(context);
  }
}
