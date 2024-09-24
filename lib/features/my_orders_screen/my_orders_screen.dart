import 'package:crunchshop/core/models/product_model.dart';
import 'package:crunchshop/exports/common_export.dart';
import 'package:crunchshop/exports/core_export.dart';
import 'package:crunchshop/features/shopping_cart_screen/components/cart_product_item_card.dart';
import 'package:flutter/material.dart';

class MyOrdersScreen extends StatelessWidget {
  const MyOrdersScreen({super.key});

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
                  onTapArrowleft14(context);
                }),
            centerTitle: true,
            title: AppbarSubtitle1(text: "My Orders")),
        body: SizedBox(
          width: size.width,
          child: SingleChildScrollView(
            padding: getPadding(top: 6),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const DividerWidget(),
                Padding(
                  padding: getPadding(left: 30, top: 30, right: 34),
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return CartProductItemCard(
                        productModel: productsList[0],
                        isTrackOrderScreen: true,
                        isMyOrderScreen: true,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  onTapTrackorder(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.trackOrderScreen);
  }

  onTapArrowleft14(BuildContext context) {
    Navigator.pop(context);
  }
}
