import 'package:crunchshop/core/controllers/localization_controller.dart';
import 'package:crunchshop/core/models/address_model.dart';
import 'package:crunchshop/core/models/product_model.dart';
import 'package:crunchshop/core/themes/themes.dart';
import 'package:crunchshop/exports/common_export.dart';
import 'package:crunchshop/exports/core_export.dart';
import 'package:crunchshop/features/checkout_delivery_information_screen/widgets/address_box_widget.dart';
import 'package:crunchshop/features/shopping_cart_screen/components/cart_product_item_card.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class TrackOrderScreen extends StatelessWidget {
  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  TrackOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
            height: getVerticalSize(85),
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
            title: AppbarSubtitle1(text: Loc.alized.lbl_track_order)),
        body: SizedBox(
          width: size.width,
          child: SingleChildScrollView(
            padding: getPadding(top: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const DividerWidget(),
                Padding(
                  padding: getPadding(left: 30, top: 30, right: 65),
                  child: CartProductItemCard(
                    productModel: productsList[0],
                    isTrackOrderScreen: true,
                  ),
                ),
                const TrackOrderTimelineWidget(
                  title: "Order Monday, 20 January 2023",
                  isCompleted: true,
                ),
                const TrackOrderTimelineWidget(
                  title: "Shipped Tuesday, 20 January 2023",
                  isCompleted: true,
                ),
                const TrackOrderTimelineWidget(
                  title: "Out For Delivery",
                  isCompleted: false,
                ),
                const TrackOrderTimelineWidget(
                  title: "Arriving Saturday",
                  isCompleted: false,
                  isLastItem: true,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: getPadding(top: 40),
                    child: Divider(
                      height: getVerticalSize(2),
                      thickness: getVerticalSize(2),
                      color: AppTheme.borderColor,
                      indent: getHorizontalSize(30),
                      endIndent: getHorizontalSize(30),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: getPadding(left: 30, top: 31, bottom: 30),
                    child: TextSemiBold20(
                      title: Loc.alized.msg_delivery_information,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: AddressBoxWidget(
                    addressModel: deliveryAddressesList[0],
                    widthPercentage: 0.90,
                    onTapEditIcon: () {},
                    isAllowedEdit: false,
                  ),
                ),
                Padding(
                  padding: getPadding(left: 30, top: 40),
                  child: const TextSemiBold20(
                    title: "Order Info",
                  ),
                ),
                OrderFeatureTile(
                  title: Loc.alized.lbl_subtotal,
                  value: "890.00",
                ),
                OrderFeatureTile(
                  title: Loc.alized.lbl_shipping_charge,
                  value: "+ 10.00",
                ),
                Padding(
                  padding: getPadding(left: 30, top: 21, right: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text18Grey(
                        title: Loc.alized.lbl_total,
                      ),
                      const Text18BoldPrimary(
                        title: "900.00",
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 40,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class OrderFeatureTile extends StatelessWidget {
  const OrderFeatureTile({
    super.key,
    required this.title,
    required this.value,
  });

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: getPadding(left: 30, top: 21, right: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text18Grey(
            title: title,
          ),
          Text18Grey(title: value)
        ],
      ),
    );
  }
}

class TrackOrderTimelineWidget extends StatelessWidget {
  const TrackOrderTimelineWidget({
    super.key,
    required this.title,
    required this.isCompleted,
    this.isLastItem = false,
  });

  final String title;
  final bool isCompleted;
  final bool isLastItem;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: getPadding(left: 30, top: 20),
          child: Row(
            children: [
              isCompleted
                  ? CustomImageView(
                      svgPath: LocalFiles.imgCheckmarkDeepOrangeA400,
                      height: getSize(30),
                      width: getSize(30))
                  : Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.blueGray10001,
                      ),
                    ),
              Padding(
                padding: getPadding(left: 16),
                child: isCompleted
                    ? Text18Bold(title: title)
                    : Text18BoldGrey(title: title),
              )
            ],
          ),
        ),
        if (!isLastItem)
          Padding(
            padding: getPadding(left: 42),
            child: SizedBox(
              height: getVerticalSize(42),
              child: VerticalDivider(
                width: getHorizontalSize(2),
                thickness: getVerticalSize(2),
                color: AppColors.gray30002,
                indent: getHorizontalSize(12),
              ),
            ),
          ),
      ],
    );
  }
}
