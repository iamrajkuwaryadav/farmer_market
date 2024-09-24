import 'package:crunchshop/core/controllers/localization_controller.dart';
import 'package:crunchshop/core/models/address_model.dart';
import 'package:crunchshop/exports/common_export.dart';

import 'package:crunchshop/exports/core_export.dart';
import 'package:crunchshop/features/checkout_delivery_information_screen/widgets/add_new_address_button.dart';
import 'package:crunchshop/features/checkout_delivery_information_screen/widgets/address_box_widget.dart';
import 'package:crunchshop/features/add_edit_address_screen/add_edit_address_screen.dart';
import 'package:crunchshop/features/checkout_payment_method_screen/checkout_payment_method_screen.dart';
import 'package:crunchshop/features/select_delivery_address_screen/select_delivery_address_screen.dart';
import 'package:flutter/material.dart';

class CheckoutDeliveryInformationScreen extends StatelessWidget {
  const CheckoutDeliveryInformationScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
          height: getVerticalSize(87),
          leadingWidth: 40,
          leading: AppbarImage(
            height: getVerticalSize(18),
            width: getHorizontalSize(10),
            svgPath: LocalFiles.imgArrowleft,
            onTap: () {
              Navigator.pop(context);
            },
          ),
          centerTitle: true,
          title: AppbarSubtitle1(text: Loc.alized.msg_delivery_information),
        ),
        body: Container(
          width: double.maxFinite,
          padding: getPadding(top: 6, bottom: 6),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const DividerWidget(),
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: getPadding(left: 30, top: 31, right: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextSemiBold20(
                          title: Loc.alized.msg_delivery_information,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const SelectDeliveryAddressScreen(),
                              ),
                            );
                          },
                          child: Padding(
                            padding: getPadding(top: 1, bottom: 1),
                            child: TextSemiBold20Primary(
                              title: Loc.alized.lbl_change,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: getPadding(left: 30, top: 15, right: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AddressBoxWidget(
                          addressModel: deliveryAddressesList[0],
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
                        const AddNewAddressButton(),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: getPadding(left: 30, top: 31),
                  child: TextSemiBold20(
                    title: Loc.alized.msg_recent_delivery,
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: SizedBox(
                    height: getVerticalSize(180),
                    child: ListView.separated(
                      padding: getPadding(left: 30, top: 17),
                      scrollDirection: Axis.horizontal,
                      separatorBuilder: (context, index) {
                        return SizedBox(height: getVerticalSize(20));
                      },
                      itemCount: deliveryAddressesList.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 20.0),
                          child: AddressBoxWidget(
                            addressModel: deliveryAddressesList[index],
                            onTapEditIcon: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => AddEditAddressScreen(
                                    addressModel: deliveryAddressesList[index],
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: getPadding(left: 30, top: 31),
                  child: TextSemiBold20(
                    title: Loc.alized.msg_all_delivery_address,
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: SizedBox(
                    height: getVerticalSize(180),
                    child: ListView.separated(
                      padding: getPadding(left: 30, top: 17),
                      scrollDirection: Axis.horizontal,
                      separatorBuilder: (context, index) {
                        return SizedBox(height: getVerticalSize(20));
                      },
                      itemCount: deliveryAddressesList.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 20.0),
                          child: AddressBoxWidget(
                            addressModel: deliveryAddressesList[index],
                            onTapEditIcon: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => AddEditAddressScreen(
                                    addressModel: deliveryAddressesList[index],
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        bottomNavigationBar: CustomButton(
          height: getVerticalSize(55),
          text: Loc.alized.lbl_checkout,
          margin: getMargin(left: 30, right: 30, bottom: 38),
          shape: ButtonShape.Square,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const CheckoutPaymentMethodScreen(),
              ),
            );
          },
        ),
      ),
    );
  }

  onTapTxtChange(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.deliveryAddressScreen);
  }

  onTapImgOffer(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.addEditAddressScreen);
  }
}
