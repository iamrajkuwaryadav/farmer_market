import 'package:crunchshop/core/controllers/localization_controller.dart';
import 'package:crunchshop/core/models/address_model.dart';
import 'package:crunchshop/exports/common_export.dart';
import 'package:crunchshop/exports/core_export.dart';
import 'package:crunchshop/features/checkout_delivery_information_screen/widgets/address_box_widget.dart';
import 'package:crunchshop/features/add_edit_address_screen/add_edit_address_screen.dart';
import 'package:flutter/material.dart';

class SelectDeliveryAddressScreen extends StatelessWidget {
  const SelectDeliveryAddressScreen({super.key});
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
            margin: getMargin(left: 30, top: 17, bottom: 20),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          centerTitle: true,
          title: AppbarSubtitle1(text: Loc.alized.msg_delivery_address),
        ),
        body: Container(
          width: double.maxFinite,
          padding: getPadding(top: 6, bottom: 6),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const DividerWidget(),
              Padding(
                  padding: getPadding(left: 30, top: 31),
                  child: TextSemiBold20(
                    title: Loc.alized.msg_select_delivery,
                  )),
              Expanded(
                child: Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: getPadding(left: 15, top: 15, right: 15),
                    child: GridView.builder(
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          mainAxisExtent: getVerticalSize(187),
                          crossAxisCount: 2,
                          mainAxisSpacing: getHorizontalSize(20),
                          crossAxisSpacing: getHorizontalSize(20)),
                      physics: const BouncingScrollPhysics(),
                      itemCount: deliveryAddressesList.length,
                      itemBuilder: (context, index) {
                        return AddressBoxWidget(
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
                        );
                      },
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        bottomNavigationBar: CustomButton(
          height: getVerticalSize(55),
          text: Loc.alized.lbl_change_address,
          margin: getMargin(left: 30, right: 30, bottom: 38),
          shape: ButtonShape.Square,
          onTap: () {
            Navigator.pushNamed(context, AppRoutes.deliveryInformationScreen);
          },
        ),
      ),
    );
  }
}
